
;; Function main (main, funcdef_no=3539, decl_uid=97940, cgraph_uid=899, symbol_order=903)

main ()
{
  float & D.105410;
  struct col_type & D.105409;
  float * D.105408;
  int D.105407;
  int D.105406;
  int D.105405;
  long long unsigned int D.105404;
  struct FILE * D.105403;
  struct basic_ostream & D.105402;
  const GLubyte * D.105401;
  struct basic_ostream & D.105400;
  struct basic_ostream & D.105399;
  unsigned int D.105398;
  struct basic_ostream & D.105397;
  struct GLFWwindow * D.105396;
  unsigned int viewLoc;
  unsigned int modelLoc;
  struct mat4 projection;
  struct mat4 view;
  struct mat4 model;
  int validarNumerico;
  float lenVet;
  unsigned int VAO;
  unsigned int VBO;
  <<< error >>> tamVec;
  float vertices = <<< error >>>;
  struct FILE * arqin;
  char * pch;
  char linha[100];
  char c;
  int i;
  int linhas;
  struct Shader ourShader;
  struct GLFWwindow * window;
  struct allocator D.100891;
  const struct string D.100892;
  struct vec3 D.100872;
  struct vec3 D.100853;
  bool retval.16;
  bool retval.3;
  bool retval.1;
  bool retval.0;
  int D.105370;

  glfwInit ();
  glfwWindowHint (139266, 3);
  glfwWindowHint (139267, 3);
  glfwWindowHint (139272, 204801);
  D.105396 = glfwCreateWindow (800, 600, "OPenGL : Exemplo 3D", 0B, 0B);
  window = D.105396;
  if (window == 0B) goto <D.105368>; else goto <D.105369>;
  <D.105368>:
  D.105397 = std::operator<< <std::char_traits<char> > (&cout, "Failed to create GLFW window");
  _1 = D.105397;
  std::basic_ostream<char>::operator<< (_1, endl);
  glfwTerminate ();
  D.105370 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.105413>;
  <D.105369>:
  glfwMakeContextCurrent (window);
  glfwSetFramebufferSizeCallback (window, framebuffer_size_callback);
  D.105398 = glewInit ();
  _2 = D.105398;
  retval.0 = _2 != 0;
  if (retval.0 != 0) goto <D.105372>; else goto <D.105373>;
  <D.105372>:
  D.105399 = std::operator<< <std::char_traits<char> > (&cout, "Ocorreu um erro iniciando GLEW!");
  _3 = D.105399;
  std::basic_ostream<char>::operator<< (_3, endl);
  goto <D.105374>;
  <D.105373>:
  D.105400 = std::operator<< <std::char_traits<char> > (&cout, "GLEW OK!");
  _4 = D.105400;
  std::basic_ostream<char>::operator<< (_4, endl);
  D.105401 = glGetString (7938);
  _5 = D.105401;
  D.105402 = std::operator<< <std::char_traits<char> > (&cout, _5);
  _6 = D.105402;
  std::basic_ostream<char>::operator<< (_6, endl);
  <D.105374>:
  glEnable (2929);
  Shader::Shader (&ourShader, "vertex.glsl", "fragment.glsl", 0B);
  linhas = 1;
  i = 0;
  D.105403 = fopen ("casa.csv", "rt");
  arqin = D.105403;
  if (arqin == 0B) goto <D.105375>; else goto <D.105376>;
  <D.105375>:
  printf ("Erro na abertura de %s %d\n", "casa.csv", 8);
  exit (0);
  <D.105376>:
  <D.105377>:
  D.105404 = fread (&c, 1, 1, arqin);
  _7 = D.105404;
  retval.1 = _7 != 0;
  if (retval.1 != 0) goto <D.105379>; else goto <D.100893>;
  <D.105379>:
  c.2_8 = c;
  if (c.2_8 == 10) goto <D.105380>; else goto <D.105381>;
  <D.105380>:
  linhas = linhas + 1;
  goto <D.105382>;
  <D.105381>:
  <D.105382>:
  goto <D.105377>;
  <D.100893>:
  printf ("Linhas: %d \n", linhas);
  linhas = linhas * 8;
  printf ("Linhas: %d \n", linhas);
  fclose (arqin);
  fopen ("casa.csv", "rt");
  <D.105383>:
  _9 = feof (arqin);
  retval.3 = _9 == 0;
  if (retval.3 != 0) goto <D.105385>; else goto <D.100895>;
  <D.105385>:
  fgets (&linha, 100, arqin);
  pch = strtok (&linha, ";");
  <D.105386>:
  if (pch == 0B) goto <D.100897>; else goto <D.105387>;
  <D.105387>:
  validarNumerico = strcmp (pch, "\n");
  if (validarNumerico != 0) goto <D.105388>; else goto <D.105389>;
  <D.105388>:
  i = i + 1;
  goto <D.105390>;
  <D.105389>:
  <D.105390>:
  pch = strtok (0B, ";");
  goto <D.105386>;
  <D.100897>:
  goto <D.105383>;
  <D.100895>:
  fclose (arqin);
  i = 0;
  <D.105391>:
  i = i + 1;
  goto <D.105391>;
  <D.100899>:
  __glewGenVertexArrays.4_10 = __glewGenVertexArrays;
  __glewGenVertexArrays.4_10 (1, &VAO);
  __glewGenBuffers.5_11 = __glewGenBuffers;
  __glewGenBuffers.5_11 (1, &VBO);
  __glewBindVertexArray.6_12 = __glewBindVertexArray;
  VAO.7_13 = VAO;
  __glewBindVertexArray.6_12 (VAO.7_13);
  lenVet = 1.0e+0;
  __glewBindBuffer.8_14 = __glewBindBuffer;
  VBO.9_15 = VBO;
  __glewBindBuffer.8_14 (34962, VBO.9_15);
  __glewVertexAttribPointer.10_16 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.10_16 (0, 3, 5126, 0, 32, 0B);
  __glewEnableVertexAttribArray.11_17 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.11_17 (0);
  __glewVertexAttribPointer.12_18 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.12_18 (1, 3, 5126, 0, 32, 12B);
  __glewEnableVertexAttribArray.13_19 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.13_19 (1);
  __glewVertexAttribPointer.14_20 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.14_20 (2, 2, 5126, 0, 32, 12B);
  __glewEnableVertexAttribArray.15_21 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.15_21 (2);
  <D.105392>:
  D.105405 = glfwWindowShouldClose (window);
  _22 = D.105405;
  retval.16 = _22 == 0;
  if (retval.16 != 0) goto <D.105394>; else goto <D.100901>;
  <D.105394>:
  processInput (window);
  glClearColor (0.0, 0.0, 0.0, 1.0e+0);
  glClear (16640);
  Shader::use (&ourShader);
  model.value[0].D.51351.x = 1.0e+0;
  model.value[0].D.51357.y = 0.0;
  model.value[0].D.51363.z = 0.0;
  model.value[0].D.51369.w = 0.0;
  model.value[1].D.51351.x = 0.0;
  model.value[1].D.51357.y = 1.0e+0;
  model.value[1].D.51363.z = 0.0;
  model.value[1].D.51369.w = 0.0;
  model.value[2].D.51351.x = 0.0;
  model.value[2].D.51357.y = 0.0;
  model.value[2].D.51363.z = 1.0e+0;
  model.value[2].D.51369.w = 0.0;
  model.value[3].D.51351.x = 0.0;
  model.value[3].D.51357.y = 0.0;
  model.value[3].D.51363.z = 0.0;
  model.value[3].D.51369.w = 1.0e+0;
  view.value[0].D.51351.x = 1.0e+0;
  view.value[0].D.51357.y = 0.0;
  view.value[0].D.51363.z = 0.0;
  view.value[0].D.51369.w = 0.0;
  view.value[1].D.51351.x = 0.0;
  view.value[1].D.51357.y = 1.0e+0;
  view.value[1].D.51363.z = 0.0;
  view.value[1].D.51369.w = 0.0;
  view.value[2].D.51351.x = 0.0;
  view.value[2].D.51357.y = 0.0;
  view.value[2].D.51363.z = 1.0e+0;
  view.value[2].D.51369.w = 0.0;
  view.value[3].D.51351.x = 0.0;
  view.value[3].D.51357.y = 0.0;
  view.value[3].D.51363.z = 0.0;
  view.value[3].D.51369.w = 1.0e+0;
  projection.value[0].D.51351.x = 1.0e+0;
  projection.value[0].D.51357.y = 0.0;
  projection.value[0].D.51363.z = 0.0;
  projection.value[0].D.51369.w = 0.0;
  projection.value[1].D.51351.x = 0.0;
  projection.value[1].D.51357.y = 1.0e+0;
  projection.value[1].D.51363.z = 0.0;
  projection.value[1].D.51369.w = 0.0;
  projection.value[2].D.51351.x = 0.0;
  projection.value[2].D.51357.y = 0.0;
  projection.value[2].D.51363.z = 1.0e+0;
  projection.value[2].D.51369.w = 0.0;
  projection.value[3].D.51351.x = 0.0;
  projection.value[3].D.51357.y = 0.0;
  projection.value[3].D.51363.z = 0.0;
  projection.value[3].D.51369.w = 1.0e+0;
  glm::vec<3, float, (glm::qualifier)0>::vec (&D.100853, 1.0e+0, 0.0, 0.0);
  _23 = glm::radians<float> (5.5e+1);
  model = glm::rotate<float, (glm::qualifier)0> (&model, _23, &D.100853);
  glm::vec<3, float, (glm::qualifier)0>::vec (&D.100872, 0.0, 0.0, -3.0e+0);
  view = glm::translate<float, (glm::qualifier)0> (&view, &D.100872);
  _24 = glm::radians<float> (8.0e+1);
  projection = glm::perspective<float> (_24, 1.33333337306976318359375e+0, 1.00000001490116119384765625e-1, 1.0e+2);
  __glewGetUniformLocation.17_25 = __glewGetUniformLocation;
  _26 = ourShader.ID;
  D.105406 = __glewGetUniformLocation.17_25 (_26, "model");
  _27 = D.105406;
  modelLoc = (unsigned int) _27;
  __glewGetUniformLocation.18_28 = __glewGetUniformLocation;
  _29 = ourShader.ID;
  D.105407 = __glewGetUniformLocation.18_28 (_29, "view");
  _30 = D.105407;
  viewLoc = (unsigned int) _30;
  __glewUniformMatrix4fv.19_31 = __glewUniformMatrix4fv;
  D.105408 = glm::value_ptr<float, (glm::qualifier)0> (&model);
  _32 = D.105408;
  modelLoc.20_33 = (int) modelLoc;
  __glewUniformMatrix4fv.19_31 (modelLoc.20_33, 1, 0, _32);
  __glewUniformMatrix4fv.21_34 = __glewUniformMatrix4fv;
  D.105409 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&view, 0);
  _35 = D.105409;
  D.105410 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_35, 0);
  _36 = D.105410;
  viewLoc.22_37 = (int) viewLoc;
  __glewUniformMatrix4fv.21_34 (viewLoc.22_37, 1, 0, _36);
  std::allocator<char>::allocator (&D.100891);
  std::__cxx11::basic_string<char>::basic_string (&D.100892, "projection", &D.100891);
  Shader::setMat4 (&ourShader, &D.100892, &projection);
  __glewBindVertexArray.23_38 = __glewBindVertexArray;
  VAO.24_39 = VAO;
  __glewBindVertexArray.23_38 (VAO.24_39);
  glDrawArrays (4, 0, 36);
  glfwSwapBuffers (window);
  glfwPollEvents ();
  model = {CLOBBER};
  view = {CLOBBER};
  projection = {CLOBBER};
  goto <D.105392>;
  <D.100901>:
  __glewDeleteVertexArrays.25_40 = __glewDeleteVertexArrays;
  __glewDeleteVertexArrays.25_40 (1, &VAO);
  __glewDeleteBuffers.26_41 = __glewDeleteBuffers;
  __glewDeleteBuffers.26_41 (1, &VBO);
  glfwTerminate ();
  D.105370 = 0;
  goto <D.105413>;
  <D.105413>:
  ourShader = {CLOBBER};
  c = {CLOBBER};
  linha = {CLOBBER};
  VBO = {CLOBBER};
  VAO = {CLOBBER};
  goto <D.105395>;
  D.105370 = 0;
  goto <D.105395>;
  <D.105395>:
  return D.105370;
  <D.105411>:
  model = {CLOBBER};
  view = {CLOBBER};
  projection = {CLOBBER};
  resx 2
  <D.105412>:
  ourShader = {CLOBBER};
  c = {CLOBBER};
  linha = {CLOBBER};
  VBO = {CLOBBER};
  VAO = {CLOBBER};
  resx 1
}



;; Function Shader::Shader (_ZN6ShaderC1EPKcS1_S1_, funcdef_no=3518, decl_uid=95316, cgraph_uid=859, symbol_order=861)

Shader::Shader (struct Shader * const this, const char * vertexPath, const char * fragmentPath, const char * geometryPath)
{
  unsigned int D.105444;
  unsigned int D.105442;
  unsigned int D.105441;
  unsigned int D.105440;
  struct basic_ostream & D.105435;
  struct __filebuf_type * D.105429;
  struct __filebuf_type * D.105428;
  struct __filebuf_type * D.105427;
  const char * gShaderCode;
  struct failure & e;
  struct stringstream gShaderStream;
  struct stringstream fShaderStream;
  struct stringstream vShaderStream;
  unsigned int geometry;
  unsigned int fragment;
  unsigned int vertex;
  const char * fShaderCode;
  const char * vShaderCode;
  struct ifstream gShaderFile;
  struct ifstream fShaderFile;
  struct ifstream vShaderFile;
  struct string geometryCode;
  struct string fragmentCode;
  struct string vertexCode;
  struct allocator D.95541;
  struct string D.95540;
  struct allocator D.95539;
  struct string D.95538;
  struct allocator D.95536;
  struct string D.95535;
  struct allocator D.95534;
  struct string D.95533;
  register struct failure * D.95532;
  struct __string_type D.95530;
  struct __string_type D.95528;
  struct __string_type D.95527;

  MEM[(struct  &)this] = {CLOBBER};
  std::__cxx11::basic_string<char>::basic_string (&vertexCode);
  std::__cxx11::basic_string<char>::basic_string (&fragmentCode);
  std::__cxx11::basic_string<char>::basic_string (&geometryCode);
  std::basic_ifstream<char>::basic_ifstream (&vShaderFile);
  std::basic_ifstream<char>::basic_ifstream (&fShaderFile);
  std::basic_ifstream<char>::basic_ifstream (&gShaderFile);
  _1 = std::operator| (4, 1);
  std::basic_ios<char>::exceptions (&vShaderFile.D.92731, _1);
  _2 = std::operator| (4, 1);
  std::basic_ios<char>::exceptions (&fShaderFile.D.92731, _2);
  _3 = std::operator| (4, 1);
  std::basic_ios<char>::exceptions (&gShaderFile.D.92731, _3);
  std::basic_ifstream<char>::open (&vShaderFile, vertexPath, 8);
  std::basic_ifstream<char>::open (&fShaderFile, fragmentPath, 8);
  _4 = std::operator| (16, 8);
  std::__cxx11::basic_stringstream<char>::basic_stringstream (&vShaderStream, _4);
  _5 = std::operator| (16, 8);
  std::__cxx11::basic_stringstream<char>::basic_stringstream (&fShaderStream, _5);
  D.105427 = std::basic_ifstream<char>::rdbuf (&vShaderFile);
  _6 = D.105427;
  std::basic_ostream<char>::operator<< (&vShaderStream.D.94702.D.89313, _6);
  D.105428 = std::basic_ifstream<char>::rdbuf (&fShaderFile);
  _7 = D.105428;
  std::basic_ostream<char>::operator<< (&fShaderStream.D.94702.D.89313, _7);
  std::basic_ifstream<char>::close (&vShaderFile);
  std::basic_ifstream<char>::close (&fShaderFile);
  D.95527 = std::__cxx11::basic_stringstream<char>::str (&vShaderStream); [return slot optimization]
  std::__cxx11::basic_string<char>::operator= (&vertexCode, &D.95527);
  D.95528 = std::__cxx11::basic_stringstream<char>::str (&fShaderStream); [return slot optimization]
  std::__cxx11::basic_string<char>::operator= (&fragmentCode, &D.95528);
  if (geometryPath != 0B) goto <D.105415>; else goto <D.105416>;
  <D.105415>:
  std::basic_ifstream<char>::open (&gShaderFile, geometryPath, 8);
  _8 = std::operator| (16, 8);
  std::__cxx11::basic_stringstream<char>::basic_stringstream (&gShaderStream, _8);
  D.105429 = std::basic_ifstream<char>::rdbuf (&gShaderFile);
  _9 = D.105429;
  std::basic_ostream<char>::operator<< (&gShaderStream.D.94702.D.89313, _9);
  std::basic_ifstream<char>::close (&gShaderFile);
  D.95530 = std::__cxx11::basic_stringstream<char>::str (&gShaderStream); [return slot optimization]
  std::__cxx11::basic_string<char>::operator= (&geometryCode, &D.95530);
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&gShaderStream);
  gShaderStream = {CLOBBER};
  goto <D.105417>;
  <D.105416>:
  <D.105417>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&fShaderStream);
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&vShaderStream);
  vShaderStream = {CLOBBER};
  fShaderStream = {CLOBBER};
  <D.105438>:
  _12 = std::__cxx11::basic_string<char>::c_str (&vertexCode);
  vShaderCode = _12;
  _13 = std::__cxx11::basic_string<char>::c_str (&fragmentCode);
  fShaderCode = _13;
  __glewCreateShader.27_14 = __glewCreateShader;
  D.105440 = __glewCreateShader.27_14 (35633);
  vertex = D.105440;
  __glewShaderSource.28_15 = __glewShaderSource;
  __glewShaderSource.28_15 (vertex, 1, &vShaderCode, 0B);
  __glewCompileShader.29_16 = __glewCompileShader;
  __glewCompileShader.29_16 (vertex);
  std::allocator<char>::allocator (&D.95534);
  std::__cxx11::basic_string<char>::basic_string (&D.95533, "VERTEX", &D.95534);
  Shader::checkCompileErrors (this, vertex, &D.95533);
  __glewCreateShader.30_17 = __glewCreateShader;
  D.105441 = __glewCreateShader.30_17 (35632);
  fragment = D.105441;
  __glewShaderSource.31_18 = __glewShaderSource;
  __glewShaderSource.31_18 (fragment, 1, &fShaderCode, 0B);
  __glewCompileShader.32_19 = __glewCompileShader;
  __glewCompileShader.32_19 (fragment);
  std::allocator<char>::allocator (&D.95536);
  std::__cxx11::basic_string<char>::basic_string (&D.95535, "FRAGMENT", &D.95536);
  Shader::checkCompileErrors (this, fragment, &D.95535);
  if (geometryPath != 0B) goto <D.105418>; else goto <D.105419>;
  <D.105418>:
  _20 = std::__cxx11::basic_string<char>::c_str (&geometryCode);
  gShaderCode = _20;
  __glewCreateShader.33_21 = __glewCreateShader;
  D.105442 = __glewCreateShader.33_21 (36313);
  geometry = D.105442;
  __glewShaderSource.34_22 = __glewShaderSource;
  __glewShaderSource.34_22 (geometry, 1, &gShaderCode, 0B);
  __glewCompileShader.35_23 = __glewCompileShader;
  __glewCompileShader.35_23 (geometry);
  std::allocator<char>::allocator (&D.95539);
  std::__cxx11::basic_string<char>::basic_string (&D.95538, "GEOMETRY", &D.95539);
  Shader::checkCompileErrors (this, geometry, &D.95538);
  gShaderCode = {CLOBBER};
  goto <D.105420>;
  <D.105419>:
  <D.105420>:
  __glewCreateProgram.36_24 = __glewCreateProgram;
  D.105444 = __glewCreateProgram.36_24 ();
  _25 = D.105444;
  this->ID = _25;
  __glewAttachShader.37_26 = __glewAttachShader;
  _27 = this->ID;
  __glewAttachShader.37_26 (_27, vertex);
  __glewAttachShader.38_28 = __glewAttachShader;
  _29 = this->ID;
  __glewAttachShader.38_28 (_29, fragment);
  if (geometryPath != 0B) goto <D.105421>; else goto <D.105422>;
  <D.105421>:
  __glewAttachShader.39_30 = __glewAttachShader;
  _31 = this->ID;
  __glewAttachShader.39_30 (_31, geometry);
  goto <D.105423>;
  <D.105422>:
  <D.105423>:
  __glewLinkProgram.40_32 = __glewLinkProgram;
  _33 = this->ID;
  __glewLinkProgram.40_32 (_33);
  std::allocator<char>::allocator (&D.95541);
  std::__cxx11::basic_string<char>::basic_string (&D.95540, "PROGRAM", &D.95541);
  _34 = this->ID;
  Shader::checkCompileErrors (this, _34, &D.95540);
  __glewDeleteShader.41_35 = __glewDeleteShader;
  __glewDeleteShader.41_35 (vertex);
  __glewDeleteShader.42_36 = __glewDeleteShader;
  __glewDeleteShader.42_36 (fragment);
  if (geometryPath != 0B) goto <D.105424>; else goto <D.105425>;
  <D.105424>:
  __glewDeleteShader.43_37 = __glewDeleteShader;
  __glewDeleteShader.43_37 (geometry);
  goto <D.105426>;
  <D.105425>:
  <D.105426>:
  std::basic_ifstream<char>::~basic_ifstream (&gShaderFile);
  std::basic_ifstream<char>::~basic_ifstream (&fShaderFile);
  std::basic_ifstream<char>::~basic_ifstream (&vShaderFile);
  std::__cxx11::basic_string<char>::~basic_string (&geometryCode);
  std::__cxx11::basic_string<char>::~basic_string (&fragmentCode);
  std::__cxx11::basic_string<char>::~basic_string (&vertexCode);
  vertexCode = {CLOBBER};
  fragmentCode = {CLOBBER};
  geometryCode = {CLOBBER};
  vShaderFile = {CLOBBER};
  fShaderFile = {CLOBBER};
  gShaderFile = {CLOBBER};
  vShaderCode = {CLOBBER};
  fShaderCode = {CLOBBER};
  return;
  <D.105430>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&gShaderStream);
  resx 13
  <D.105431>:
  gShaderStream = {CLOBBER};
  resx 12
  <D.105432>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&fShaderStream);
  resx 11
  <D.105433>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&vShaderStream);
  resx 10
  <D.105434>:
  vShaderStream = {CLOBBER};
  fShaderStream = {CLOBBER};
  resx 9
  <D.105439>:
  eh_dispatch 8
  resx 8
  <D.105437>:
  _10 = __builtin_eh_pointer (8);
  D.95532 = __cxa_begin_catch (_10);
  e = D.95532;
  D.105435 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::SHADER::FILE_NOT_SUCCESFULLY_READ");
  _11 = D.105435;
  std::basic_ostream<char>::operator<< (_11, endl);
  __cxa_end_catch ();
  goto <D.105438>;
  <D.105436>:
  __cxa_end_catch ();
  resx 19
  <D.105443>:
  gShaderCode = {CLOBBER};
  resx 21
  <D.105445>:
  std::basic_ifstream<char>::~basic_ifstream (&gShaderFile);
  resx 7
  <D.105446>:
  std::basic_ifstream<char>::~basic_ifstream (&fShaderFile);
  resx 6
  <D.105447>:
  std::basic_ifstream<char>::~basic_ifstream (&vShaderFile);
  resx 5
  <D.105448>:
  std::__cxx11::basic_string<char>::~basic_string (&geometryCode);
  resx 4
  <D.105449>:
  std::__cxx11::basic_string<char>::~basic_string (&fragmentCode);
  resx 3
  <D.105450>:
  std::__cxx11::basic_string<char>::~basic_string (&vertexCode);
  resx 2
  <D.105451>:
  vertexCode = {CLOBBER};
  fragmentCode = {CLOBBER};
  geometryCode = {CLOBBER};
  vShaderFile = {CLOBBER};
  fShaderFile = {CLOBBER};
  gShaderFile = {CLOBBER};
  vShaderCode = {CLOBBER};
  fShaderCode = {CLOBBER};
  resx 1
}



;; Function std::__cxx11::basic_string<char>::basic_string (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2Ev, funcdef_no=3863, decl_uid=72983, cgraph_uid=1204, symbol_order=1208)

std::__cxx11::basic_string<char>::basic_string (struct basic_string * const this)
{
  char * D.105452;
  struct allocator D.103063;

  MEM[(struct  &)this] = {CLOBBER};
  _1 = &this->_M_dataplus;
  std::allocator<char>::allocator (&D.103063);
  D.105452 = std::__cxx11::basic_string<char>::_M_local_data (this);
  _2 = D.105452;
  std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (_1, _2, &D.103063);
  std::__cxx11::basic_string<char>::_M_set_length (this, 0);
  return;
}



;; Function std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC2EPcOS3_, funcdef_no=3931, decl_uid=72044, cgraph_uid=1272, symbol_order=1276)

std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (struct _Alloc_hider * const this, char * __dat, struct allocator & __a)
{
  MEM[(struct  &)this] = {CLOBBER};
  _1 = std::move<std::allocator<char>&> (__a);
  std::allocator<char>::allocator (this, _1);
  this->_M_p = __dat;
  return;
}



;; Function std::move<std::allocator<char>&> (_ZSt4moveIRSaIcEEONSt16remove_referenceIT_E4typeEOS3_, funcdef_no=3929, decl_uid=102024, cgraph_uid=1270, symbol_order=1274)

std::move<std::allocator<char>&> (struct allocator & __t)
{
  struct type & D.105453;

  D.105453 = __t;
  goto <D.105454>;
  <D.105454>:
  return D.105453;
}



;; Function std::operator| (_ZStorSt12_Ios_IostateS_, funcdef_no=2949, decl_uid=80506, cgraph_uid=753, symbol_order=754)

std::operator| (_Ios_Iostate __a, _Ios_Iostate __b)
{
  _Ios_Iostate D.105455;

  D.105455 = __a | __b;
  goto <D.105456>;
  <D.105456>:
  return D.105455;
}



;; Function std::operator| (_ZStorSt13_Ios_OpenmodeS_, funcdef_no=2942, decl_uid=80471, cgraph_uid=746, symbol_order=747)

std::operator| (_Ios_Openmode __a, _Ios_Openmode __b)
{
  _Ios_Openmode D.105457;

  D.105457 = __a | __b;
  goto <D.105458>;
  <D.105458>:
  return D.105457;
}



;; Function std::allocator<char>::allocator (_ZNSaIcEC2Ev, funcdef_no=3785, decl_uid=66529, cgraph_uid=1126, symbol_order=1130)

std::allocator<char>::allocator (struct allocator * const this)
{
  __gnu_cxx::new_allocator<char>::new_allocator (this);
  return;
}



;; Function __gnu_cxx::new_allocator<char>::new_allocator (_ZN9__gnu_cxx13new_allocatorIcEC2Ev, funcdef_no=3957, decl_uid=66464, cgraph_uid=1298, symbol_order=1302)

__gnu_cxx::new_allocator<char>::new_allocator (struct new_allocator * const this)
{
  return;
}



;; Function std::__cxx11::basic_string<char>::basic_string (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_, funcdef_no=3893, decl_uid=72923, cgraph_uid=1234, symbol_order=1238)

std::__cxx11::basic_string<char>::basic_string (struct basic_string * const this, const char * __s, const struct allocator & __a)
{
  char * D.105463;
  const char * iftmp.44;

  MEM[(struct  &)this] = {CLOBBER};
  _1 = &this->_M_dataplus;
  D.105463 = std::__cxx11::basic_string<char>::_M_local_data (this);
  _2 = D.105463;
  std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (_1, _2, __a);
  if (__s != 0B) goto <D.105460>; else goto <D.105461>;
  <D.105460>:
  _3 = std::char_traits<char>::length (__s);
  iftmp.44 = __s + _3;
  goto <D.105462>;
  <D.105461>:
  iftmp.44 = __s + 18446744073709551615;
  <D.105462>:
  std::__cxx11::basic_string<char>::_M_construct<const char*> (this, __s, iftmp.44);
  return;
  <D.105464>:
  _4 = &this->_M_dataplus;
  std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (_4);
  resx 1
}



;; Function std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC2EPcRKS3_, funcdef_no=3963, decl_uid=72052, cgraph_uid=1304, symbol_order=1308)

std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (struct _Alloc_hider * const this, char * __dat, const struct allocator & __a)
{
  MEM[(struct  &)this] = {CLOBBER};
  std::allocator<char>::allocator (this, __a);
  this->_M_p = __dat;
  return;
}



;; Function std::char_traits<char>::length (_ZNSt11char_traitsIcE6lengthEPKc, funcdef_no=2189, decl_uid=65236, cgraph_uid=466, symbol_order=467)

std::char_traits<char>::length (const char_type * __s)
{
  size_t D.105465;

  D.105465 = __builtin_strlen (__s);
  goto <D.105466>;
  <D.105466>:
  return D.105465;
}



;; Function std::__cxx11::basic_string<char>::_M_construct<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_, funcdef_no=3965, decl_uid=102623, cgraph_uid=1306, symbol_order=1310)

std::__cxx11::basic_string<char>::_M_construct<const char*> (struct basic_string * const this, const char * __beg, const char * __end)
{
  struct __false_type D.105467;
  struct _Integral D.103463;

  std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (this, __beg, __end, D.105467);
  return;
}



;; Function std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPKcEEvT_S8_St12__false_type, funcdef_no=4092, decl_uid=103497, cgraph_uid=1433, symbol_order=1437)

std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (struct basic_string * const this, const char * __beg, const char * __end, struct __false_type D.103501)
{
  struct forward_iterator_tag D.105468;
  struct _Tag D.104026;
  struct forward_iterator_tag D.104046;

  _1 = &D.104026;
  std::__cxx11::basic_string<char>::_M_construct<const char*> (this, __beg, __end, D.105468);
  return;
}



;; Function std::__cxx11::basic_string<char>::_M_construct<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, funcdef_no=4150, decl_uid=104036, cgraph_uid=1491, symbol_order=1495)

std::__cxx11::basic_string<char>::_M_construct<const char*> (struct basic_string * const this, const char * __beg, const char * __end, struct forward_iterator_tag D.104040)
{
  char * D.105482;
  char * D.105481;
  long long int D.105480;
  size_type __dnew;
  bool iftmp.46;
  bool retval.45;

  _1 = __gnu_cxx::__is_null_pointer<const char> (__beg);
  if (_1 != 0) goto <D.105473>; else goto <D.105471>;
  <D.105473>:
  if (__beg != __end) goto <D.105474>; else goto <D.105471>;
  <D.105474>:
  iftmp.46 = 1;
  goto <D.105472>;
  <D.105471>:
  iftmp.46 = 0;
  <D.105472>:
  retval.45 = iftmp.46;
  if (retval.45 != 0) goto <D.105475>; else goto <D.105476>;
  <D.105475>:
  std::__throw_logic_error ("basic_string::_M_construct null not valid");
  <D.105476>:
  D.105480 = std::distance<const char*> (__beg, __end);
  _2 = D.105480;
  _3 = (long long unsigned int) _2;
  __dnew = _3;
  __dnew.47_4 = __dnew;
  if (__dnew.47_4 > 15) goto <D.105477>; else goto <D.105478>;
  <D.105477>:
  D.105481 = std::__cxx11::basic_string<char>::_M_create (this, &__dnew, 0);
  _5 = D.105481;
  std::__cxx11::basic_string<char>::_M_data (this, _5);
  __dnew.48_6 = __dnew;
  std::__cxx11::basic_string<char>::_M_capacity (this, __dnew.48_6);
  goto <D.105479>;
  <D.105478>:
  <D.105479>:
  D.105482 = std::__cxx11::basic_string<char>::_M_data (this);
  _7 = D.105482;
  std::__cxx11::basic_string<char>::_S_copy_chars (_7, __beg, __end);
  __dnew.49_9 = __dnew;
  std::__cxx11::basic_string<char>::_M_set_length (this, __dnew.49_9);
  __dnew = {CLOBBER};
  return;
  <D.105485>:
  eh_dispatch 2
  resx 2
  <D.105484>:
  _8 = __builtin_eh_pointer (2);
  __cxa_begin_catch (_8);
  std::__cxx11::basic_string<char>::_M_dispose (this);
  __cxa_rethrow ();
  <D.105483>:
  __cxa_end_catch ();
  resx 3
  <D.105486>:
  __dnew = {CLOBBER};
  resx 1
}



;; Function __gnu_cxx::__is_null_pointer<const char> (_ZN9__gnu_cxx17__is_null_pointerIKcEEbPT_, funcdef_no=4189, decl_uid=104396, cgraph_uid=1530, symbol_order=1534)

__gnu_cxx::__is_null_pointer<const char> (const char * __ptr)
{
  bool D.105487;

  D.105487 = __ptr == 0B;
  goto <D.105488>;
  <D.105488>:
  return D.105487;
}



;; Function std::distance<const char*> (_ZSt8distanceIPKcENSt15iterator_traitsIT_E15difference_typeES3_S3_, funcdef_no=4190, decl_uid=104399, cgraph_uid=1532, symbol_order=1536)

std::distance<const char*> (const char * __first, const char * __last)
{
  struct random_access_iterator_tag D.105490;
  struct iterator_category D.105186;
  difference_type D.105489;

  std::__iterator_category<const char*> (&__first);
  __first.50_1 = __first;
  D.105489 = std::__distance<const char*> (__first.50_1, __last, D.105490);
  goto <D.105491>;
  <D.105491>:
  return D.105489;
}



;; Function std::__iterator_category<const char*> (_ZSt19__iterator_categoryIPKcENSt15iterator_traitsIT_E17iterator_categoryERKS3_, funcdef_no=4191, decl_uid=105184, cgraph_uid=1531, symbol_order=1535)

std::__iterator_category<const char*> (const char * const & D.105185)
{
  struct iterator_category D.105492;

  goto <D.105493>;
  <D.105493>:
  return D.105492;
}



;; Function std::__distance<const char*> (_ZSt10__distanceIPKcENSt15iterator_traitsIT_E15difference_typeES3_S3_St26random_access_iterator_tag, funcdef_no=4234, decl_uid=105187, cgraph_uid=1575, symbol_order=1579)

std::__distance<const char*> (const char * __first, const char * __last, struct random_access_iterator_tag D.105190)
{
  difference_type D.105494;

  D.105494 = __last - __first;
  goto <D.105495>;
  <D.105495>:
  return D.105494;
}



;; Function std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev, funcdef_no=3685, decl_uid=73082, cgraph_uid=1025, symbol_order=1029)

std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (struct _Alloc_hider * const this)
{
  std::allocator<char>::~allocator (this);
  MEM[(struct  &)this] = {CLOBBER};
  <D.102013>:
  return;
}



;; Function Shader::checkCompileErrors (_ZN6Shader18checkCompileErrorsEjNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, funcdef_no=3538, decl_uid=95314, cgraph_uid=879, symbol_order=881)

Shader::checkCompileErrors (struct Shader * const this, GLuint shader, struct string & restrict type)
{
  struct basic_ostream & D.105516;
  struct basic_ostream & D.105515;
  struct basic_ostream & D.105514;
  struct basic_ostream & D.105513;
  struct basic_ostream & D.105512;
  struct basic_ostream & D.105511;
  struct basic_ostream & D.105510;
  struct basic_ostream & D.105509;
  struct basic_ostream & D.105508;
  struct basic_ostream & D.105507;
  bool D.105506;
  GLchar infoLog[1024];
  GLint success;
  bool retval.51;

  D.105506 = std::operator!=<char, std::char_traits<char>, std::allocator<char> > (type, "PROGRAM");
  retval.51 = D.105506;
  if (retval.51 != 0) goto <D.105497>; else goto <D.105498>;
  <D.105497>:
  __glewGetShaderiv.52_1 = __glewGetShaderiv;
  __glewGetShaderiv.52_1 (shader, 35713, &success);
  success.53_2 = success;
  if (success.53_2 == 0) goto <D.105499>; else goto <D.105500>;
  <D.105499>:
  __glewGetShaderInfoLog.54_3 = __glewGetShaderInfoLog;
  __glewGetShaderInfoLog.54_3 (shader, 1024, 0B, &infoLog);
  D.105507 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::SHADER_COMPILATION_ERROR of type: ");
  _4 = D.105507;
  D.105508 = std::operator<< <char, std::char_traits<char>, std::allocator<char> > (_4, type);
  _5 = D.105508;
  D.105509 = std::operator<< <std::char_traits<char> > (_5, "\n");
  _6 = D.105509;
  D.105510 = std::operator<< <std::char_traits<char> > (_6, &infoLog);
  _7 = D.105510;
  D.105511 = std::operator<< <std::char_traits<char> > (_7, "\n -- --------------------------------------------------- -- ");
  _8 = D.105511;
  std::basic_ostream<char>::operator<< (_8, endl);
  goto <D.105501>;
  <D.105500>:
  <D.105501>:
  goto <D.105502>;
  <D.105498>:
  __glewGetProgramiv.55_9 = __glewGetProgramiv;
  __glewGetProgramiv.55_9 (shader, 35714, &success);
  success.56_10 = success;
  if (success.56_10 == 0) goto <D.105503>; else goto <D.105504>;
  <D.105503>:
  __glewGetProgramInfoLog.57_11 = __glewGetProgramInfoLog;
  __glewGetProgramInfoLog.57_11 (shader, 1024, 0B, &infoLog);
  D.105512 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::PROGRAM_LINKING_ERROR of type: ");
  _12 = D.105512;
  D.105513 = std::operator<< <char, std::char_traits<char>, std::allocator<char> > (_12, type);
  _13 = D.105513;
  D.105514 = std::operator<< <std::char_traits<char> > (_13, "\n");
  _14 = D.105514;
  D.105515 = std::operator<< <std::char_traits<char> > (_14, &infoLog);
  _15 = D.105515;
  D.105516 = std::operator<< <std::char_traits<char> > (_15, "\n -- --------------------------------------------------- -- ");
  _16 = D.105516;
  std::basic_ostream<char>::operator<< (_16, endl);
  goto <D.105505>;
  <D.105504>:
  <D.105505>:
  <D.105502>:
  success = {CLOBBER};
  infoLog = {CLOBBER};
  return;
  <D.105517>:
  success = {CLOBBER};
  infoLog = {CLOBBER};
  resx 1
}



;; Function std::operator!=<char, std::char_traits<char>, std::allocator<char> > (_ZStneIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, funcdef_no=3901, decl_uid=97879, cgraph_uid=1242, symbol_order=1246)

std::operator!=<char, std::char_traits<char>, std::allocator<char> > (const struct basic_string & __lhs, const char * __rhs)
{
  bool D.105518;

  _1 = std::operator==<char, std::char_traits<char>, std::allocator<char> > (__lhs, __rhs);
  D.105518 = ~_1;
  goto <D.105519>;
  <D.105519>:
  return D.105518;
}



;; Function std::operator==<char, std::char_traits<char>, std::allocator<char> > (_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, funcdef_no=4071, decl_uid=103157, cgraph_uid=1412, symbol_order=1416)

std::operator==<char, std::char_traits<char>, std::allocator<char> > (const struct basic_string & __lhs, const char * __rhs)
{
  bool D.105520;

  _1 = std::__cxx11::basic_string<char>::compare (__lhs, __rhs);
  D.105520 = _1 == 0;
  goto <D.105521>;
  <D.105521>:
  return D.105520;
}



;; Function std::__cxx11::basic_string<char>::~basic_string (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev, funcdef_no=3686, decl_uid=72988, cgraph_uid=1027, symbol_order=1031)

std::__cxx11::basic_string<char>::~basic_string (struct basic_string * const this)
{
  std::__cxx11::basic_string<char>::_M_dispose (this);
  _1 = &this->_M_dataplus;
  std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (_1);
  MEM[(struct  &)this] = {CLOBBER};
  <D.102016>:
  return;
}



;; Function processInput (_Z12processInputP10GLFWwindow, funcdef_no=3559, decl_uid=97937, cgraph_uid=900, symbol_order=904)

processInput (struct GLFWwindow * window)
{
  int D.105526;
  bool retval.58;

  D.105526 = glfwGetKey (window, 256);
  _1 = D.105526;
  retval.58 = _1 == 1;
  if (retval.58 != 0) goto <D.105523>; else goto <D.105524>;
  <D.105523>:
  glfwSetWindowShouldClose (window, 1);
  goto <D.105525>;
  <D.105524>:
  <D.105525>:
  return;
}



;; Function framebuffer_size_callback (_Z25framebuffer_size_callbackP10GLFWwindowii, funcdef_no=3560, decl_uid=97935, cgraph_uid=901, symbol_order=905)

framebuffer_size_callback (struct GLFWwindow * window, int width, int height)
{
  glViewport (0, 0, width, height);
  return;
}



;; Function __static_initialization_and_destruction_0 (_Z41__static_initialization_and_destruction_0ii, funcdef_no=4260, decl_uid=105358, cgraph_uid=1602, symbol_order=1702)

__static_initialization_and_destruction_0 (int __initialize_p, int __priority)
{
  if (__initialize_p == 1) goto <D.105527>; else goto <D.105528>;
  <D.105527>:
  if (__priority == 65535) goto <D.105529>; else goto <D.105530>;
  <D.105529>:
  std::ios_base::Init::Init (&__ioinit);
  atexit (__tcf_0);
  goto <D.105531>;
  <D.105530>:
  <D.105531>:
  goto <D.105532>;
  <D.105528>:
  <D.105532>:
  return;
}



;; Function __tcf_0 (__tcf_0, funcdef_no=4261, decl_uid=105362, cgraph_uid=1601, symbol_order=1701)

__tcf_0 ()
{
  std::ios_base::Init::~Init (&__ioinit);
  return;
}



;; Function _GLOBAL__sub_I_main (_GLOBAL__sub_I_main, funcdef_no=4262, decl_uid=105366, cgraph_uid=1603, symbol_order=2318)

_GLOBAL__sub_I_main ()
{
  __static_initialization_and_destruction_0 (1, 65535);
  return;
}

