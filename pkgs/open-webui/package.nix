{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  python3Packages,
  nixosTests,
  fetchurl,
  ffmpeg-headless,
}:
let
  pname = "open-webui";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "open-webui";
    repo = "open-webui";
    tag = "v${version}";
    hash = "sha256-LEDnz2Awy/FLQo84fsbvJ43TbX9euz5Ai9YsaJ5NcX4=";
  };

  frontend = buildNpmPackage rec {
    pname = "open-webui-frontend";
    inherit version src;

    pyodideVersion = "0.28.2";
    pyodide = fetchurl {
      hash = "sha256-MQIRdOj9yVVsF+nUNeINnAfyA6xULZFhyjuNnV0E5+c=";
      url = "https://github.com/pyodide/pyodide/releases/download/${pyodideVersion}/pyodide-${pyodideVersion}.tar.bz2";
    };

    npmDepsHash = "sha256-dgIdGJ69X+uQ+e80k+wHn1pVyjhjsmFVzIoa2+tUxuI=";

    npmFlags = [
      "--force"
      "--legacy-peer-deps"
    ];

    postPatch = ''
      substituteInPlace package.json \
        --replace-fail "npm run pyodide:fetch && vite build" "vite build"
    '';

    propagatedBuildInputs = [
      ffmpeg-headless
    ];

    env.CYPRESS_INSTALL_BINARY = "0";
    env.ONNXRUNTIME_NODE_INSTALL_CUDA = "skip";
    env.NODE_OPTIONS = "--max-old-space-size=8192";

    preBuild = ''
      tar xf ${pyodide} -C static/
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share
      cp -a build $out/share/open-webui

      runHook postInstall
    '';
  };
in
python3Packages.buildPythonApplication rec {
  inherit pname version src;
  pyproject = true;

  build-system = with python3Packages; [ hatchling ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail ', build = "open_webui/frontend"' ""
  '';

  env.HATCH_BUILD_NO_HOOKS = true;

  pythonRelaxDeps = true;

  dependencies =
    with python3Packages;
    [
      accelerate
      aiocache
      aiofiles
      aiohttp
      alembic
      anthropic
      apscheduler
      argon2-cffi
      asgiref
      async-timeout
      authlib
      azure-ai-documentintelligence
      azure-identity
      azure-storage-blob
      bcrypt
      black
      boto3
      brotli
      chardet
      chromadb
      cryptography
      ddgs
      docx2txt
      einops
      fake-useragent
      fastapi
      faster-whisper
      fpdf2
      ftfy
      google-api-python-client
      google-auth-httplib2
      google-auth-oauthlib
      google-cloud-storage
      google-genai
      googleapis-common-protos
      httpx
      itsdangerous
      langchain
      langchain-classic
      langchain-community
      langchain-text-splitters
      langdetect
      ldap3
      loguru
      markdown
      msoffcrypto-tool
      mcp
      nltk
      onnxruntime
      openai
      opencv-python-headless
      openpyxl
      opensearch-py
      pandas
      peewee
      peewee-migrate
      pgvector
      pillow
      psutil
      pyarrow
      pycrdt
      pydub
      pyjwt
      pymdown-extensions
      pymysql
      pypandoc
      pypdf
      python-jose
      python-mimeparse
      python-multipart
      python-pptx
      python-socketio
      pytube
      pytz
      pyxlsb
      rank-bm25
      rapidocr-onnxruntime
      redis
      requests
      restrictedpython
      sentence-transformers
      sentencepiece
      soundfile
      sqlalchemy
      starlette-compress
      starsessions
      tiktoken
      transformers
      unstructured
      uvicorn
      validators
      xlrd
      youtube-transcript-api
    ]
    ++ pyjwt.optional-dependencies.crypto
    ++ starsessions.optional-dependencies.redis;

  optional-dependencies = with python3Packages; rec {
    postgres = [
      pgvector
      psycopg2-binary
    ];

    all = [
      azure-search-documents
      colbert-ai
      elasticsearch
      firecrawl-py
      gcp-storage-emulator
      moto
      oracledb
      pinecone-client
      playwright
      pymilvus
      pymongo
      qdrant-client
      weaviate-client
    ]
    ++ moto.optional-dependencies.s3
    ++ postgres;
  };

  pythonImportsCheck = [ "open_webui" ];

  makeWrapperArgs = [ "--set FRONTEND_BUILD_DIR ${frontend}/share/open-webui" ];

  passthru = {
    tests = {
      inherit (nixosTests) open-webui;
    };
    inherit frontend;
  };

  meta = {
    changelog = "https://github.com/open-webui/open-webui/blob/${src.tag}/CHANGELOG.md";
    description = "Comprehensive suite for LLMs with a user-friendly WebUI";
    homepage = "https://github.com/open-webui/open-webui";
    license = {
      fullName = "Open WebUI License";
      url = "https://github.com/open-webui/open-webui/blob/0cef844168e97b70de2abee4c076cc30ffec6193/LICENSE";
      free = false;
    };
    longDescription = ''
      User-friendly WebUI for LLMs. Note on licensing: Code in Open WebUI prior
      to version 0.5.5 was MIT licensed. Since version 0.6.6, the project has
      adopted a modified BSD-3-Clause license that includes branding requirements
      and whose relicensing process from MIT has raised concerns within the community.
      Nixpkgs treats this custom license as non-free due to these factors.
    '';
    mainProgram = "open-webui";
    maintainers = with lib.maintainers; [
      shivaraj-bh
      codgician
    ];
  };
}
