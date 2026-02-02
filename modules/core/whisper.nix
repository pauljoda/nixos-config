{ config, pkgs, ... }:

let
  whisperPort = 8123;
  
  whisperServer = pkgs.writeScriptBin "whisper-http-server" ''
    #!${pkgs.python3}/bin/python3
    import whisper
    from flask import Flask, request, jsonify
    import tempfile
    import os
    
    app = Flask(__name__)
    
    print("Loading Whisper model...")
    model = whisper.load_model("base")
    print("Model loaded successfully")
    
    @app.route('/transcribe', methods=['POST'])
    def transcribe():
        if 'file' not in request.files:
            return jsonify({'error': 'No file provided'}), 400
        
        file = request.files['file']
        
        with tempfile.NamedTemporaryFile(delete=False, suffix='.wav') as tmp:
            file.save(tmp.name)
            try:
                result = model.transcribe(tmp.name)
                return jsonify({'text': result['text'].strip()})
            except Exception as e:
                return jsonify({'error': str(e)}), 500
            finally:
                os.unlink(tmp.name)
    
    @app.route('/health', methods=['GET'])
    def health():
        return jsonify({'status': 'ok'})
    
    if __name__ == '__main__':
        app.run(host='0.0.0.0', port=${toString whisperPort})
  '';

  pythonEnv = pkgs.python3.withPackages (ps: with ps; [ 
    openai-whisper 
    flask
  ]);

in {
  systemd.services.whisper-server = {
    description = "Whisper HTTP transcription service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    
    serviceConfig = {
      ExecStart = "${pythonEnv}/bin/python3 ${whisperServer}/bin/whisper-http-server";
      Restart = "always";
      RestartSec = "10s";
      
      DynamicUser = true;
      StateDirectory = "whisper";
      CacheDirectory = "whisper";
      PrivateTmp = true;
      
      ProtectSystem = "strict";
      ProtectHome = true;
      NoNewPrivileges = true;
    };
    
    environment = {
      PYTHONUNBUFFERED = "1";
      XDG_CACHE_HOME = "/var/cache/whisper";
    };
  };

  networking.firewall.allowedTCPPorts = [ whisperPort ];
}
