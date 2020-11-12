
;; Function main (main, funcdef_no=3539, decl_uid=97940, cgraph_uid=899, symbol_order=903)

main ()
{
  float & D.105412;
  struct col_type & D.105411;
  float * D.105410;
  int D.105409;
  int D.105408;
  double D.105405;
  int D.105404;
  long long unsigned int D.105403;
  struct FILE * D.105402;
  struct basic_ostream & D.105401;
  const GLubyte * D.105400;
  struct basic_ostream & D.105399;
  struct basic_ostream & D.105398;
  unsigned int D.105397;
  struct basic_ostream & D.105396;
  struct GLFWwindow * D.105395;
  unsigned int viewLoc;
  unsigned int modelLoc;
  struct mat4 projection;
  struct mat4 view;
  struct mat4 model;
  int validarNumerico;
  unsigned int VAO;
  unsigned int VBO;
  float * vertices;
  struct FILE * arqin;
  char * linhaComentario;
  char * pch;
  char linha[100];
  char c;
  int i;
  int linhas;
  struct Shader ourShader;
  struct GLFWwindow * window;
  struct allocator D.100890;
  const struct string D.100891;
  struct vec3 D.100868;
  struct vec3 D.100850;
  bool retval.17;
  bool retval.3;
  bool retval.1;
  bool retval.0;
  int D.105367;

  glfwInit ();
  glfwWindowHint (139266, 3);
  glfwWindowHint (139267, 3);
  glfwWindowHint (139272, 204801);
  D.105395 = glfwCreateWindow (800, 600, "OPenGL : TDE 2 - 3D", 0B, 0B);
  window = D.105395;
  if (window == 0B) goto <D.105365>; else goto <D.105366>;
  <D.105365>:
  D.105396 = std::operator<< <std::char_traits<char> > (&cout, "Failed to create GLFW window");
  _1 = D.105396;
  std::basic_ostream<char>::operator<< (_1, endl);
  glfwTerminate ();
  D.105367 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.105419>;
  <D.105366>:
  glfwMakeContextCurrent (window);
  glfwSetFramebufferSizeCallback (window, framebuffer_size_callback);
  D.105397 = glewInit ();
  _2 = D.105397;
  retval.0 = _2 != 0;
  if (retval.0 != 0) goto <D.105369>; else goto <D.105370>;
  <D.105369>:
  D.105398 = std::operator<< <std::char_traits<char> > (&cout, "Ocorreu um erro iniciando GLEW!");
  _3 = D.105398;
  std::basic_ostream<char>::operator<< (_3, endl);
  goto <D.105371>;
  <D.105370>:
  D.105399 = std::operator<< <std::char_traits<char> > (&cout, "GLEW OK!");
  _4 = D.105399;
  std::basic_ostream<char>::operator<< (_4, endl);
  D.105400 = glGetString (7938);
  _5 = D.105400;
  D.105401 = std::operator<< <std::char_traits<char> > (&cout, _5);
  _6 = D.105401;
  std::basic_ostream<char>::operator<< (_6, endl);
  <D.105371>:
  glEnable (2929);
  Shader::Shader (&ourShader, "vertex.glsl", "fragment.glsl", 0B);
  linhas = 1;
  i = 0;
  D.105402 = fopen ("casa.csv", "rt");
  arqin = D.105402;
  if (arqin == 0B) goto <D.105372>; else goto <D.105373>;
  <D.105372>:
  printf ("Erro na abertura de %s %d\n", "casa.csv", 8);
  exit (0);
  <D.105373>:
  <D.105374>:
  D.105403 = fread (&c, 1, 1, arqin);
  _7 = D.105403;
  retval.1 = _7 != 0;
  if (retval.1 != 0) goto <D.105376>; else goto <D.100892>;
  <D.105376>:
  c.2_8 = c;
  if (c.2_8 == 10) goto <D.105377>; else goto <D.105378>;
  <D.105377>:
  linhas = linhas + 1;
  goto <D.105379>;
  <D.105378>:
  <D.105379>:
  goto <D.105374>;
  <D.100892>:
  printf ("Linhas: %d \n", linhas);
  _9 = linhas * 8;
  _10 = (long long unsigned int) _9;
  _11 = _10 * 4;
  vertices = malloc (_11);
  fclose (arqin);
  i = 0;
  fopen ("casa.csv", "rt");
  <D.105380>:
  _12 = feof (arqin);
  retval.3 = _12 == 0;
  if (retval.3 != 0) goto <D.105382>; else goto <D.100894>;
  <D.105382>:
  fgets (&linha, 100, arqin);
  linhaComentario = strstr (&linha, "//");
  if (linhaComentario == 0B) goto <D.105383>; else goto <D.105384>;
  <D.105383>:
  pch = strtok (&linha, ";");
  <D.105385>:
  if (pch == 0B) goto <D.100896>; else goto <D.105386>;
  <D.105386>:
  validarNumerico = strcmp (pch, "\n");
  if (validarNumerico != 0) goto <D.105387>; else goto <D.105388>;
  <D.105387>:
  _13 = atof (pch);
  _14 = (long long unsigned int) i;
  _15 = _14 * 4;
  _16 = vertices + _15;
  _17 = (float) _13;
  *_16 = _17;
  _18 = (long long unsigned int) i;
  _19 = _18 * 4;
  _20 = vertices + _19;
  _21 = *_20;
  _22 = (double) _21;
  printf ("vertices[%d]: %f\n ", i, _22);
  i = i + 1;
  goto <D.105389>;
  <D.105388>:
  <D.105389>:
  pch = strtok (0B, ";");
  goto <D.105385>;
  <D.100896>:
  goto <D.105390>;
  <D.105384>:
  <D.105390>:
  goto <D.105380>;
  <D.100894>:
  fclose (arqin);
  __glewGenVertexArrays.4_23 = __glewGenVertexArrays;
  __glewGenVertexArrays.4_23 (1, &VAO);
  __glewGenBuffers.5_24 = __glewGenBuffers;
  __glewGenBuffers.5_24 (1, &VBO);
  __glewBindVertexArray.6_25 = __glewBindVertexArray;
  VAO.7_26 = VAO;
  __glewBindVertexArray.6_25 (VAO.7_26);
  __glewBindBuffer.8_27 = __glewBindBuffer;
  VBO.9_28 = VBO;
  __glewBindBuffer.8_27 (34962, VBO.9_28);
  __glewBufferData.10_29 = __glewBufferData;
  _30 = linhas * 8;
  _31 = (long long unsigned int) _30;
  _32 = _31 * 4;
  _33 = (long long int) _32;
  __glewBufferData.10_29 (34962, _33, vertices, 35044);
  __glewVertexAttribPointer.11_34 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.11_34 (0, 3, 5126, 0, 32, 0B);
  __glewEnableVertexAttribArray.12_35 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.12_35 (0);
  __glewVertexAttribPointer.13_36 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.13_36 (1, 3, 5126, 0, 32, 12B);
  __glewEnableVertexAttribArray.14_37 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.14_37 (1);
  __glewVertexAttribPointer.15_38 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.15_38 (2, 2, 5126, 0, 32, 12B);
  __glewEnableVertexAttribArray.16_39 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.16_39 (2);
  <D.105391>:
  D.105404 = glfwWindowShouldClose (window);
  _40 = D.105404;
  retval.17 = _40 == 0;
  if (retval.17 != 0) goto <D.105393>; else goto <D.100898>;
  <D.105393>:
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
  glm::vec<3, float, (glm::qualifier)0>::vec (&D.100850, 0.0, -5.0e-1, 0.0);
  D.105405 = glfwGetTime ();
  _41 = D.105405;
  _42 = (float) _41;
  model = glm::rotate<float, (glm::qualifier)0> (&model, _42, &D.100850);
  D.100850 = {CLOBBER};
  glm::vec<3, float, (glm::qualifier)0>::vec (&D.100868, 0.0, 0.0, -3.0e+0);
  view = glm::translate<float, (glm::qualifier)0> (&view, &D.100868);
  D.100868 = {CLOBBER};
  _43 = glm::radians<float> (6.0e+1);
  projection = glm::perspective<float> (_43, 1.33333337306976318359375e+0, 1.00000001490116119384765625e-1, 1.0e+2);
  __glewGetUniformLocation.18_44 = __glewGetUniformLocation;
  _45 = ourShader.ID;
  D.105408 = __glewGetUniformLocation.18_44 (_45, "model");
  _46 = D.105408;
  modelLoc = (unsigned int) _46;
  __glewGetUniformLocation.19_47 = __glewGetUniformLocation;
  _48 = ourShader.ID;
  D.105409 = __glewGetUniformLocation.19_47 (_48, "view");
  _49 = D.105409;
  viewLoc = (unsigned int) _49;
  __glewUniformMatrix4fv.20_50 = __glewUniformMatrix4fv;
  D.105410 = glm::value_ptr<float, (glm::qualifier)0> (&model);
  _51 = D.105410;
  modelLoc.21_52 = (int) modelLoc;
  __glewUniformMatrix4fv.20_50 (modelLoc.21_52, 1, 0, _51);
  __glewUniformMatrix4fv.22_53 = __glewUniformMatrix4fv;
  D.105411 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&view, 0);
  _54 = D.105411;
  D.105412 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_54, 0);
  _55 = D.105412;
  viewLoc.23_56 = (int) viewLoc;
  __glewUniformMatrix4fv.22_53 (viewLoc.23_56, 1, 0, _55);
  std::allocator<char>::allocator (&D.100890);
  std::__cxx11::basic_string<char>::basic_string (&D.100891, "projection", &D.100890);
  Shader::setMat4 (&ourShader, &D.100891, &projection);
  std::__cxx11::basic_string<char>::~basic_string (&D.100891);
  D.100891 = {CLOBBER};
  std::allocator<char>::~allocator (&D.100890);
  D.100890 = {CLOBBER};
  __glewBindVertexArray.24_57 = __glewBindVertexArray;
  VAO.25_58 = VAO;
  __glewBindVertexArray.24_57 (VAO.25_58);
  _59 = linhas * 36;
  glDrawArrays (4, 0, _59);
  glfwSwapBuffers (window);
  glfwPollEvents ();
  model = {CLOBBER};
  view = {CLOBBER};
  projection = {CLOBBER};
  goto <D.105391>;
  <D.100898>:
  __glewDeleteVertexArrays.26_60 = __glewDeleteVertexArrays;
  __glewDeleteVertexArrays.26_60 (1, &VAO);
  __glewDeleteBuffers.27_61 = __glewDeleteBuffers;
  __glewDeleteBuffers.27_61 (1, &VBO);
  glfwTerminate ();
  D.105367 = 0;
  goto <D.105419>;
  <D.105419>:
  ourShader = {CLOBBER};
  c = {CLOBBER};
  linha = {CLOBBER};
  VBO = {CLOBBER};
  VAO = {CLOBBER};
  goto <D.105394>;
  D.105367 = 0;
  goto <D.105394>;
  <D.105394>:
  return D.105367;
  <D.105406>:
  D.100850 = {CLOBBER};
  resx 3
  <D.105407>:
  D.100868 = {CLOBBER};
  resx 5
  <D.105413>:
  std::__cxx11::basic_string<char>::~basic_string (&D.100891);
  resx 10
  <D.105414>:
  D.100891 = {CLOBBER};
  resx 9
  <D.105415>:
  std::allocator<char>::~allocator (&D.100890);
  resx 8
  <D.105416>:
  D.100890 = {CLOBBER};
  resx 7
  <D.105417>:
  model = {CLOBBER};
  view = {CLOBBER};
  projection = {CLOBBER};
  resx 2
  <D.105418>:
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
  unsigned int D.105462;
  unsigned int D.105456;
  unsigned int D.105451;
  unsigned int D.105446;
  struct basic_ostream & D.105441;
  struct __filebuf_type * D.105435;
  struct __filebuf_type * D.105434;
  struct __filebuf_type * D.105433;
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
  D.105433 = std::basic_ifstream<char>::rdbuf (&vShaderFile);
  _6 = D.105433;
  std::basic_ostream<char>::operator<< (&vShaderStream.D.94702.D.89313, _6);
  D.105434 = std::basic_ifstream<char>::rdbuf (&fShaderFile);
  _7 = D.105434;
  std::basic_ostream<char>::operator<< (&fShaderStream.D.94702.D.89313, _7);
  std::basic_ifstream<char>::close (&vShaderFile);
  std::basic_ifstream<char>::close (&fShaderFile);
  D.95527 = std::__cxx11::basic_stringstream<char>::str (&vShaderStream); [return slot optimization]
  std::__cxx11::basic_string<char>::operator= (&vertexCode, &D.95527);
  std::__cxx11::basic_string<char>::~basic_string (&D.95527);
  D.95527 = {CLOBBER};
  D.95528 = std::__cxx11::basic_stringstream<char>::str (&fShaderStream); [return slot optimization]
  std::__cxx11::basic_string<char>::operator= (&fragmentCode, &D.95528);
  std::__cxx11::basic_string<char>::~basic_string (&D.95528);
  D.95528 = {CLOBBER};
  if (geometryPath != 0B) goto <D.105421>; else goto <D.105422>;
  <D.105421>:
  std::basic_ifstream<char>::open (&gShaderFile, geometryPath, 8);
  _8 = std::operator| (16, 8);
  std::__cxx11::basic_stringstream<char>::basic_stringstream (&gShaderStream, _8);
  D.105435 = std::basic_ifstream<char>::rdbuf (&gShaderFile);
  _9 = D.105435;
  std::basic_ostream<char>::operator<< (&gShaderStream.D.94702.D.89313, _9);
  std::basic_ifstream<char>::close (&gShaderFile);
  D.95530 = std::__cxx11::basic_stringstream<char>::str (&gShaderStream); [return slot optimization]
  std::__cxx11::basic_string<char>::operator= (&geometryCode, &D.95530);
  std::__cxx11::basic_string<char>::~basic_string (&D.95530);
  D.95530 = {CLOBBER};
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&gShaderStream);
  gShaderStream = {CLOBBER};
  goto <D.105423>;
  <D.105422>:
  <D.105423>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&fShaderStream);
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&vShaderStream);
  vShaderStream = {CLOBBER};
  fShaderStream = {CLOBBER};
  <D.105444>:
  _12 = std::__cxx11::basic_string<char>::c_str (&vertexCode);
  vShaderCode = _12;
  _13 = std::__cxx11::basic_string<char>::c_str (&fragmentCode);
  fShaderCode = _13;
  __glewCreateShader.28_14 = __glewCreateShader;
  D.105446 = __glewCreateShader.28_14 (35633);
  vertex = D.105446;
  __glewShaderSource.29_15 = __glewShaderSource;
  __glewShaderSource.29_15 (vertex, 1, &vShaderCode, 0B);
  __glewCompileShader.30_16 = __glewCompileShader;
  __glewCompileShader.30_16 (vertex);
  std::allocator<char>::allocator (&D.95534);
  std::__cxx11::basic_string<char>::basic_string (&D.95533, "VERTEX", &D.95534);
  Shader::checkCompileErrors (this, vertex, &D.95533);
  std::__cxx11::basic_string<char>::~basic_string (&D.95533);
  D.95533 = {CLOBBER};
  std::allocator<char>::~allocator (&D.95534);
  D.95534 = {CLOBBER};
  __glewCreateShader.31_17 = __glewCreateShader;
  D.105451 = __glewCreateShader.31_17 (35632);
  fragment = D.105451;
  __glewShaderSource.32_18 = __glewShaderSource;
  __glewShaderSource.32_18 (fragment, 1, &fShaderCode, 0B);
  __glewCompileShader.33_19 = __glewCompileShader;
  __glewCompileShader.33_19 (fragment);
  std::allocator<char>::allocator (&D.95536);
  std::__cxx11::basic_string<char>::basic_string (&D.95535, "FRAGMENT", &D.95536);
  Shader::checkCompileErrors (this, fragment, &D.95535);
  std::__cxx11::basic_string<char>::~basic_string (&D.95535);
  D.95535 = {CLOBBER};
  std::allocator<char>::~allocator (&D.95536);
  D.95536 = {CLOBBER};
  if (geometryPath != 0B) goto <D.105424>; else goto <D.105425>;
  <D.105424>:
  _20 = std::__cxx11::basic_string<char>::c_str (&geometryCode);
  gShaderCode = _20;
  __glewCreateShader.34_21 = __glewCreateShader;
  D.105456 = __glewCreateShader.34_21 (36313);
  geometry = D.105456;
  __glewShaderSource.35_22 = __glewShaderSource;
  __glewShaderSource.35_22 (geometry, 1, &gShaderCode, 0B);
  __glewCompileShader.36_23 = __glewCompileShader;
  __glewCompileShader.36_23 (geometry);
  std::allocator<char>::allocator (&D.95539);
  std::__cxx11::basic_string<char>::basic_string (&D.95538, "GEOMETRY", &D.95539);
  Shader::checkCompileErrors (this, geometry, &D.95538);
  std::__cxx11::basic_string<char>::~basic_string (&D.95538);
  D.95538 = {CLOBBER};
  std::allocator<char>::~allocator (&D.95539);
  D.95539 = {CLOBBER};
  gShaderCode = {CLOBBER};
  goto <D.105426>;
  <D.105425>:
  <D.105426>:
  __glewCreateProgram.37_24 = __glewCreateProgram;
  D.105462 = __glewCreateProgram.37_24 ();
  _25 = D.105462;
  this->ID = _25;
  __glewAttachShader.38_26 = __glewAttachShader;
  _27 = this->ID;
  __glewAttachShader.38_26 (_27, vertex);
  __glewAttachShader.39_28 = __glewAttachShader;
  _29 = this->ID;
  __glewAttachShader.39_28 (_29, fragment);
  if (geometryPath != 0B) goto <D.105427>; else goto <D.105428>;
  <D.105427>:
  __glewAttachShader.40_30 = __glewAttachShader;
  _31 = this->ID;
  __glewAttachShader.40_30 (_31, geometry);
  goto <D.105429>;
  <D.105428>:
  <D.105429>:
  __glewLinkProgram.41_32 = __glewLinkProgram;
  _33 = this->ID;
  __glewLinkProgram.41_32 (_33);
  std::allocator<char>::allocator (&D.95541);
  std::__cxx11::basic_string<char>::basic_string (&D.95540, "PROGRAM", &D.95541);
  _34 = this->ID;
  Shader::checkCompileErrors (this, _34, &D.95540);
  std::__cxx11::basic_string<char>::~basic_string (&D.95540);
  D.95540 = {CLOBBER};
  std::allocator<char>::~allocator (&D.95541);
  D.95541 = {CLOBBER};
  __glewDeleteShader.42_35 = __glewDeleteShader;
  __glewDeleteShader.42_35 (vertex);
  __glewDeleteShader.43_36 = __glewDeleteShader;
  __glewDeleteShader.43_36 (fragment);
  if (geometryPath != 0B) goto <D.105430>; else goto <D.105431>;
  <D.105430>:
  __glewDeleteShader.44_37 = __glewDeleteShader;
  __glewDeleteShader.44_37 (geometry);
  goto <D.105432>;
  <D.105431>:
  <D.105432>:
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
  <D.105436>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&gShaderStream);
  resx 17
  <D.105437>:
  gShaderStream = {CLOBBER};
  resx 16
  <D.105438>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&fShaderStream);
  resx 11
  <D.105439>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&vShaderStream);
  resx 10
  <D.105440>:
  vShaderStream = {CLOBBER};
  fShaderStream = {CLOBBER};
  resx 9
  <D.105445>:
  eh_dispatch 8
  resx 8
  <D.105443>:
  _10 = __builtin_eh_pointer (8);
  D.95532 = __cxa_begin_catch (_10);
  e = D.95532;
  D.105441 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::SHADER::FILE_NOT_SUCCESFULLY_READ");
  _11 = D.105441;
  std::basic_ostream<char>::operator<< (_11, endl);
  __cxa_end_catch ();
  goto <D.105444>;
  <D.105442>:
  __cxa_end_catch ();
  resx 25
  <D.105447>:
  std::__cxx11::basic_string<char>::~basic_string (&D.95533);
  resx 30
  <D.105448>:
  D.95533 = {CLOBBER};
  resx 29
  <D.105449>:
  std::allocator<char>::~allocator (&D.95534);
  resx 28
  <D.105450>:
  D.95534 = {CLOBBER};
  resx 27
  <D.105452>:
  std::__cxx11::basic_string<char>::~basic_string (&D.95535);
  resx 38
  <D.105453>:
  D.95535 = {CLOBBER};
  resx 37
  <D.105454>:
  std::allocator<char>::~allocator (&D.95536);
  resx 36
  <D.105455>:
  D.95536 = {CLOBBER};
  resx 35
  <D.105457>:
  std::__cxx11::basic_string<char>::~basic_string (&D.95538);
  resx 47
  <D.105458>:
  D.95538 = {CLOBBER};
  resx 46
  <D.105459>:
  std::allocator<char>::~allocator (&D.95539);
  resx 45
  <D.105460>:
  D.95539 = {CLOBBER};
  resx 44
  <D.105461>:
  gShaderCode = {CLOBBER};
  resx 43
  <D.105463>:
  std::__cxx11::basic_string<char>::~basic_string (&D.95540);
  resx 56
  <D.105464>:
  D.95540 = {CLOBBER};
  resx 55
  <D.105465>:
  std::allocator<char>::~allocator (&D.95541);
  resx 54
  <D.105466>:
  D.95541 = {CLOBBER};
  resx 53
  <D.105467>:
  std::basic_ifstream<char>::~basic_ifstream (&gShaderFile);
  resx 7
  <D.105468>:
  std::basic_ifstream<char>::~basic_ifstream (&fShaderFile);
  resx 6
  <D.105469>:
  std::basic_ifstream<char>::~basic_ifstream (&vShaderFile);
  resx 5
  <D.105470>:
  std::__cxx11::basic_string<char>::~basic_string (&geometryCode);
  resx 4
  <D.105471>:
  std::__cxx11::basic_string<char>::~basic_string (&fragmentCode);
  resx 3
  <D.105472>:
  std::__cxx11::basic_string<char>::~basic_string (&vertexCode);
  resx 2
  <D.105473>:
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
  char * D.105474;
  struct allocator D.103060;

  MEM[(struct  &)this] = {CLOBBER};
  _1 = &this->_M_dataplus;
  std::allocator<char>::allocator (&D.103060);
  D.105474 = std::__cxx11::basic_string<char>::_M_local_data (this);
  _2 = D.105474;
  std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (_1, _2, &D.103060);
  std::allocator<char>::~allocator (&D.103060);
  D.103060 = {CLOBBER};
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



;; Function std::move<std::allocator<char>&> (_ZSt4moveIRSaIcEEONSt16remove_referenceIT_E4typeEOS3_, funcdef_no=3929, decl_uid=102021, cgraph_uid=1270, symbol_order=1274)

std::move<std::allocator<char>&> (struct allocator & __t)
{
  struct type & D.105475;

  D.105475 = __t;
  goto <D.105476>;
  <D.105476>:
  return D.105475;
}



;; Function std::operator| (_ZStorSt12_Ios_IostateS_, funcdef_no=2949, decl_uid=80506, cgraph_uid=753, symbol_order=754)

std::operator| (_Ios_Iostate __a, _Ios_Iostate __b)
{
  _Ios_Iostate D.105477;

  D.105477 = __a | __b;
  goto <D.105478>;
  <D.105478>:
  return D.105477;
}



;; Function std::operator| (_ZStorSt13_Ios_OpenmodeS_, funcdef_no=2942, decl_uid=80471, cgraph_uid=746, symbol_order=747)

std::operator| (_Ios_Openmode __a, _Ios_Openmode __b)
{
  _Ios_Openmode D.105479;

  D.105479 = __a | __b;
  goto <D.105480>;
  <D.105480>:
  return D.105479;
}



;; Function Shader::checkCompileErrors (_ZN6Shader18checkCompileErrorsEjNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, funcdef_no=3538, decl_uid=95314, cgraph_uid=879, symbol_order=881)

Shader::checkCompileErrors (struct Shader * const this, GLuint shader, struct string & restrict type)
{
  struct basic_ostream & D.105501;
  struct basic_ostream & D.105500;
  struct basic_ostream & D.105499;
  struct basic_ostream & D.105498;
  struct basic_ostream & D.105497;
  struct basic_ostream & D.105496;
  struct basic_ostream & D.105495;
  struct basic_ostream & D.105494;
  struct basic_ostream & D.105493;
  struct basic_ostream & D.105492;
  bool D.105491;
  GLchar infoLog[1024];
  GLint success;
  bool retval.45;

  D.105491 = std::operator!=<char, std::char_traits<char>, std::allocator<char> > (type, "PROGRAM");
  retval.45 = D.105491;
  if (retval.45 != 0) goto <D.105482>; else goto <D.105483>;
  <D.105482>:
  __glewGetShaderiv.46_1 = __glewGetShaderiv;
  __glewGetShaderiv.46_1 (shader, 35713, &success);
  success.47_2 = success;
  if (success.47_2 == 0) goto <D.105484>; else goto <D.105485>;
  <D.105484>:
  __glewGetShaderInfoLog.48_3 = __glewGetShaderInfoLog;
  __glewGetShaderInfoLog.48_3 (shader, 1024, 0B, &infoLog);
  D.105492 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::SHADER_COMPILATION_ERROR of type: ");
  _4 = D.105492;
  D.105493 = std::operator<< <char, std::char_traits<char>, std::allocator<char> > (_4, type);
  _5 = D.105493;
  D.105494 = std::operator<< <std::char_traits<char> > (_5, "\n");
  _6 = D.105494;
  D.105495 = std::operator<< <std::char_traits<char> > (_6, &infoLog);
  _7 = D.105495;
  D.105496 = std::operator<< <std::char_traits<char> > (_7, "\n -- --------------------------------------------------- -- ");
  _8 = D.105496;
  std::basic_ostream<char>::operator<< (_8, endl);
  goto <D.105486>;
  <D.105485>:
  <D.105486>:
  goto <D.105487>;
  <D.105483>:
  __glewGetProgramiv.49_9 = __glewGetProgramiv;
  __glewGetProgramiv.49_9 (shader, 35714, &success);
  success.50_10 = success;
  if (success.50_10 == 0) goto <D.105488>; else goto <D.105489>;
  <D.105488>:
  __glewGetProgramInfoLog.51_11 = __glewGetProgramInfoLog;
  __glewGetProgramInfoLog.51_11 (shader, 1024, 0B, &infoLog);
  D.105497 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::PROGRAM_LINKING_ERROR of type: ");
  _12 = D.105497;
  D.105498 = std::operator<< <char, std::char_traits<char>, std::allocator<char> > (_12, type);
  _13 = D.105498;
  D.105499 = std::operator<< <std::char_traits<char> > (_13, "\n");
  _14 = D.105499;
  D.105500 = std::operator<< <std::char_traits<char> > (_14, &infoLog);
  _15 = D.105500;
  D.105501 = std::operator<< <std::char_traits<char> > (_15, "\n -- --------------------------------------------------- -- ");
  _16 = D.105501;
  std::basic_ostream<char>::operator<< (_16, endl);
  goto <D.105490>;
  <D.105489>:
  <D.105490>:
  <D.105487>:
  success = {CLOBBER};
  infoLog = {CLOBBER};
  return;
  <D.105502>:
  success = {CLOBBER};
  infoLog = {CLOBBER};
  resx 1
}



;; Function std::operator!=<char, std::char_traits<char>, std::allocator<char> > (_ZStneIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, funcdef_no=3901, decl_uid=97879, cgraph_uid=1242, symbol_order=1246)

std::operator!=<char, std::char_traits<char>, std::allocator<char> > (const struct basic_string & __lhs, const char * __rhs)
{
  bool D.105503;

  _1 = std::operator==<char, std::char_traits<char>, std::allocator<char> > (__lhs, __rhs);
  D.105503 = ~_1;
  goto <D.105504>;
  <D.105504>:
  return D.105503;
}



;; Function std::operator==<char, std::char_traits<char>, std::allocator<char> > (_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, funcdef_no=4071, decl_uid=103154, cgraph_uid=1412, symbol_order=1416)

std::operator==<char, std::char_traits<char>, std::allocator<char> > (const struct basic_string & __lhs, const char * __rhs)
{
  bool D.105505;

  _1 = std::__cxx11::basic_string<char>::compare (__lhs, __rhs);
  D.105505 = _1 == 0;
  goto <D.105506>;
  <D.105506>:
  return D.105505;
}



;; Function Shader::use (_ZN6Shader3useEv, funcdef_no=3519, decl_uid=95256, cgraph_uid=860, symbol_order=862)

Shader::use (struct Shader * const this)
{
  __glewUseProgram.52_1 = __glewUseProgram;
  _2 = this->ID;
  __glewUseProgram.52_1 (_2);
  return;
}



;; Function glm::rotate<float, (glm::qualifier)0> (_ZN3glm6rotateIfLNS_9qualifierE0EEENS_3matILi4ELi4ET_XT0_EEERKS4_S3_RKNS_3vecILi3ES3_XT0_EEE, funcdef_no=3904, decl_uid=100851, cgraph_uid=1246, symbol_order=1250)

glm::rotate<float, (glm::qualifier)0> (const struct mat & m, float angle, const struct vec & v)
{
  struct col_type & D.105598;
  const struct col_type & D.105597;
  struct col_type & D.105592;
  const struct col_type & D.105591;
  float & D.105590;
  struct col_type & D.105589;
  const struct col_type & D.105588;
  float & D.105587;
  struct col_type & D.105586;
  const struct col_type & D.105585;
  float & D.105584;
  struct col_type & D.105583;
  struct col_type & D.105578;
  const struct col_type & D.105577;
  float & D.105576;
  struct col_type & D.105575;
  const struct col_type & D.105574;
  float & D.105573;
  struct col_type & D.105572;
  const struct col_type & D.105571;
  float & D.105570;
  struct col_type & D.105569;
  struct col_type & D.105564;
  const struct col_type & D.105563;
  float & D.105562;
  struct col_type & D.105561;
  const struct col_type & D.105560;
  float & D.105559;
  struct col_type & D.105558;
  const struct col_type & D.105557;
  float & D.105556;
  struct col_type & D.105555;
  float & D.105554;
  struct col_type & D.105553;
  float & D.105552;
  float & D.105551;
  float & D.105550;
  struct col_type & D.105549;
  float & D.105548;
  float & D.105547;
  float & D.105546;
  float & D.105545;
  struct col_type & D.105544;
  float & D.105543;
  float & D.105542;
  float & D.105541;
  float & D.105540;
  struct col_type & D.105539;
  float & D.105538;
  float & D.105537;
  float & D.105536;
  float & D.105535;
  struct col_type & D.105534;
  float & D.105533;
  float & D.105532;
  float & D.105531;
  struct col_type & D.105530;
  float & D.105529;
  float & D.105528;
  float & D.105527;
  float & D.105526;
  struct col_type & D.105525;
  float & D.105524;
  float & D.105523;
  float & D.105522;
  float & D.105521;
  struct col_type & D.105520;
  float & D.105519;
  float & D.105518;
  float & D.105517;
  float & D.105516;
  struct col_type & D.105515;
  float & D.105514;
  float & D.105513;
  struct mat Result [value-expr: <retval>];
  struct mat Rotate;
  struct vec temp;
  struct vec axis;
  const float s;
  const float c;
  const float a;
  struct col_type & D.105511;
  struct col_type & D.105510;
  struct vec D.103201;
  struct vec D.103202;
  struct vec D.103203;
  struct vec D.103204;
  struct col_type & D.105509;
  struct vec D.103196;
  struct vec D.103197;
  struct vec D.103198;
  struct vec D.103199;
  struct col_type & D.105508;
  struct vec D.103188;
  struct vec D.103189;
  struct vec D.103193;
  struct vec D.103194;

  a = angle;
  c = std::cos (a);
  s = std::sin (a);
  axis = glm::normalize<3, float, (glm::qualifier)0> (v); [return slot optimization]
  _1 = 1.0e+0 - c;
  temp = glm::operator*<float, (glm::qualifier)0> (_1, &axis); [return slot optimization]
  D.105513 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 0);
  _2 = D.105513;
  _3 = *_2;
  D.105514 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _4 = D.105514;
  _5 = *_4;
  _6 = _3 * _5;
  D.105515 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _7 = D.105515;
  D.105516 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_7, 0);
  _8 = D.105516;
  _9 = c + _6;
  *_8 = _9;
  D.105517 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 0);
  _10 = D.105517;
  _11 = *_10;
  D.105518 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _12 = D.105518;
  _13 = *_12;
  _14 = _11 * _13;
  D.105519 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _15 = D.105519;
  _16 = *_15;
  _17 = s * _16;
  D.105520 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _18 = D.105520;
  D.105521 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_18, 1);
  _19 = D.105521;
  _20 = _14 + _17;
  *_19 = _20;
  D.105522 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 0);
  _21 = D.105522;
  _22 = *_21;
  D.105523 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _23 = D.105523;
  _24 = *_23;
  _25 = _22 * _24;
  D.105524 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _26 = D.105524;
  _27 = *_26;
  _28 = s * _27;
  D.105525 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _29 = D.105525;
  D.105526 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_29, 2);
  _30 = D.105526;
  _31 = _25 - _28;
  *_30 = _31;
  D.105527 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 1);
  _32 = D.105527;
  _33 = *_32;
  D.105528 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _34 = D.105528;
  _35 = *_34;
  _36 = _33 * _35;
  D.105529 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _37 = D.105529;
  _38 = *_37;
  _39 = s * _38;
  D.105530 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _40 = D.105530;
  D.105531 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_40, 0);
  _41 = D.105531;
  _42 = _36 - _39;
  *_41 = _42;
  D.105532 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 1);
  _43 = D.105532;
  _44 = *_43;
  D.105533 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _45 = D.105533;
  _46 = *_45;
  _47 = _44 * _46;
  D.105534 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _48 = D.105534;
  D.105535 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_48, 1);
  _49 = D.105535;
  _50 = c + _47;
  *_49 = _50;
  D.105536 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 1);
  _51 = D.105536;
  _52 = *_51;
  D.105537 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _53 = D.105537;
  _54 = *_53;
  _55 = _52 * _54;
  D.105538 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _56 = D.105538;
  _57 = *_56;
  _58 = s * _57;
  D.105539 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _59 = D.105539;
  D.105540 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_59, 2);
  _60 = D.105540;
  _61 = _55 + _58;
  *_60 = _61;
  D.105541 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 2);
  _62 = D.105541;
  _63 = *_62;
  D.105542 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _64 = D.105542;
  _65 = *_64;
  _66 = _63 * _65;
  D.105543 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _67 = D.105543;
  _68 = *_67;
  _69 = s * _68;
  D.105544 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _70 = D.105544;
  D.105545 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_70, 0);
  _71 = D.105545;
  _72 = _66 + _69;
  *_71 = _72;
  D.105546 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 2);
  _73 = D.105546;
  _74 = *_73;
  D.105547 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _75 = D.105547;
  _76 = *_75;
  _77 = _74 * _76;
  D.105548 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _78 = D.105548;
  _79 = *_78;
  _80 = s * _79;
  D.105549 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _81 = D.105549;
  D.105550 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_81, 1);
  _82 = D.105550;
  _83 = _77 - _80;
  *_82 = _83;
  D.105551 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 2);
  _84 = D.105551;
  _85 = *_84;
  D.105552 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _86 = D.105552;
  _87 = *_86;
  _88 = _85 * _87;
  D.105553 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _89 = D.105553;
  D.105554 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_89, 2);
  _90 = D.105554;
  _91 = c + _88;
  *_90 = _91;
  D.105555 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _92 = D.105555;
  D.105556 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_92, 2);
  _93 = D.105556;
  D.105557 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 2);
  _94 = D.105557;
  D.103194 = glm::operator*<float, (glm::qualifier)0> (_94, _93); [return slot optimization]
  D.105558 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _95 = D.105558;
  D.105559 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_95, 1);
  _96 = D.105559;
  D.105560 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 1);
  _97 = D.105560;
  D.103189 = glm::operator*<float, (glm::qualifier)0> (_97, _96); [return slot optimization]
  D.105561 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _98 = D.105561;
  D.105562 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_98, 0);
  _99 = D.105562;
  D.105563 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _100 = D.105563;
  D.103188 = glm::operator*<float, (glm::qualifier)0> (_100, _99); [return slot optimization]
  D.103193 = glm::operator+<float, (glm::qualifier)0> (&D.103188, &D.103189); [return slot optimization]
  D.105564 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 0);
  D.105508 = D.105564;
  *D.105508 = glm::operator+<float, (glm::qualifier)0> (&D.103193, &D.103194);
  D.103193 = {CLOBBER};
  D.103188 = {CLOBBER};
  D.103189 = {CLOBBER};
  D.103194 = {CLOBBER};
  D.105569 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _101 = D.105569;
  D.105570 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_101, 2);
  _102 = D.105570;
  D.105571 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 2);
  _103 = D.105571;
  D.103199 = glm::operator*<float, (glm::qualifier)0> (_103, _102); [return slot optimization]
  D.105572 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _104 = D.105572;
  D.105573 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_104, 1);
  _105 = D.105573;
  D.105574 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 1);
  _106 = D.105574;
  D.103197 = glm::operator*<float, (glm::qualifier)0> (_106, _105); [return slot optimization]
  D.105575 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _107 = D.105575;
  D.105576 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_107, 0);
  _108 = D.105576;
  D.105577 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _109 = D.105577;
  D.103196 = glm::operator*<float, (glm::qualifier)0> (_109, _108); [return slot optimization]
  D.103198 = glm::operator+<float, (glm::qualifier)0> (&D.103196, &D.103197); [return slot optimization]
  D.105578 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 1);
  D.105509 = D.105578;
  *D.105509 = glm::operator+<float, (glm::qualifier)0> (&D.103198, &D.103199);
  D.103198 = {CLOBBER};
  D.103196 = {CLOBBER};
  D.103197 = {CLOBBER};
  D.103199 = {CLOBBER};
  D.105583 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _110 = D.105583;
  D.105584 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_110, 2);
  _111 = D.105584;
  D.105585 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 2);
  _112 = D.105585;
  D.103204 = glm::operator*<float, (glm::qualifier)0> (_112, _111); [return slot optimization]
  D.105586 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _113 = D.105586;
  D.105587 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_113, 1);
  _114 = D.105587;
  D.105588 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 1);
  _115 = D.105588;
  D.103202 = glm::operator*<float, (glm::qualifier)0> (_115, _114); [return slot optimization]
  D.105589 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _116 = D.105589;
  D.105590 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_116, 0);
  _117 = D.105590;
  D.105591 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _118 = D.105591;
  D.103201 = glm::operator*<float, (glm::qualifier)0> (_118, _117); [return slot optimization]
  D.103203 = glm::operator+<float, (glm::qualifier)0> (&D.103201, &D.103202); [return slot optimization]
  D.105592 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 2);
  D.105510 = D.105592;
  *D.105510 = glm::operator+<float, (glm::qualifier)0> (&D.103203, &D.103204);
  D.103203 = {CLOBBER};
  D.103201 = {CLOBBER};
  D.103202 = {CLOBBER};
  D.103204 = {CLOBBER};
  D.105597 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 3);
  _119 = D.105597;
  D.105598 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 3);
  D.105511 = D.105598;
  *D.105511 = MEM[(const struct vec &)_119];
  goto <D.105600>;
  <D.105600>:
  axis = {CLOBBER};
  temp = {CLOBBER};
  Rotate = {CLOBBER};
  goto <D.105512>;
  <D.105512>:
  return <retval>;
  <D.105565>:
  D.103193 = {CLOBBER};
  resx 5
  <D.105566>:
  D.103188 = {CLOBBER};
  resx 4
  <D.105567>:
  D.103189 = {CLOBBER};
  resx 3
  <D.105568>:
  D.103194 = {CLOBBER};
  resx 2
  <D.105579>:
  D.103198 = {CLOBBER};
  resx 13
  <D.105580>:
  D.103196 = {CLOBBER};
  resx 12
  <D.105581>:
  D.103197 = {CLOBBER};
  resx 11
  <D.105582>:
  D.103199 = {CLOBBER};
  resx 10
  <D.105593>:
  D.103203 = {CLOBBER};
  resx 21
  <D.105594>:
  D.103201 = {CLOBBER};
  resx 20
  <D.105595>:
  D.103202 = {CLOBBER};
  resx 19
  <D.105596>:
  D.103204 = {CLOBBER};
  resx 18
  <D.105599>:
  axis = {CLOBBER};
  temp = {CLOBBER};
  Rotate = {CLOBBER};
  resx 1
}



;; Function std::cos (_ZSt3cosf, funcdef_no=66, decl_uid=23268, cgraph_uid=42, symbol_order=42)

std::cos (float __x)
{
  float D.105601;

  D.105601 = __builtin_cosf (__x);
  goto <D.105602>;
  <D.105602>:
  return D.105601;
}



;; Function std::sin (_ZSt3sinf, funcdef_no=101, decl_uid=23427, cgraph_uid=66, symbol_order=66)

std::sin (float __x)
{
  float D.105603;

  D.105603 = __builtin_sinf (__x);
  goto <D.105604>;
  <D.105604>:
  return D.105603;
}



;; Function glm::normalize<3, float, (glm::qualifier)0> (_ZN3glm9normalizeILi3EfLNS_9qualifierE0EEENS_3vecIXT_ET0_XT1_EEERKS4_, funcdef_no=4072, decl_uid=103172, cgraph_uid=1413, symbol_order=1417)

glm::normalize<3, float, (glm::qualifier)0> (const struct vec & x)
{
  <retval> = glm::detail::compute_normalize<3, float, (glm::qualifier)0, false>::call (x); [return slot optimization]
  goto <D.105606>;
  <D.105606>:
  return <retval>;
}



;; Function glm::detail::compute_normalize<3, float, (glm::qualifier)0, false>::call (_ZN3glm6detail17compute_normalizeILi3EfLNS_9qualifierE0ELb0EE4callERKNS_3vecILi3EfLS2_0EEE, funcdef_no=4136, decl_uid=103782, cgraph_uid=1477, symbol_order=1481)

glm::detail::compute_normalize<3, float, (glm::qualifier)0, false>::call (const struct vec & v)
{
  float D.105609;

  D.105609 = glm::dot<3, float, (glm::qualifier)0> (v, v);
  _1 = D.105609;
  _2 = glm::inversesqrt<float> (_1);
  <retval> = glm::operator*<float, (glm::qualifier)0> (v, _2); [return slot optimization]
  goto <D.105608>;
  <D.105608>:
  return <retval>;
}



;; Function glm::dot<3, float, (glm::qualifier)0> (_ZN3glm3dotILi3EfLNS_9qualifierE0EEET0_RKNS_3vecIXT_ES2_XT1_EEES6_, funcdef_no=4179, decl_uid=104332, cgraph_uid=1520, symbol_order=1524)

glm::dot<3, float, (glm::qualifier)0> (const struct vec & x, const struct vec & y)
{
  float D.105612;
  float D.105610;

  D.105612 = glm::detail::compute_dot<glm::vec<3, float, (glm::qualifier)0>, float, false>::call (x, y);
  D.105610 = D.105612;
  goto <D.105611>;
  <D.105611>:
  return D.105610;
}



;; Function glm::detail::compute_dot<glm::vec<3, float, (glm::qualifier)0>, float, false>::call (_ZN3glm6detail11compute_dotINS_3vecILi3EfLNS_9qualifierE0EEEfLb0EE4callERKS4_S7_, funcdef_no=4222, decl_uid=105137, cgraph_uid=1564, symbol_order=1568)

glm::detail::compute_dot<glm::vec<3, float, (glm::qualifier)0>, float, false>::call (const struct vec & a, const struct vec & b)
{
  struct vec tmp;
  float D.105613;

  tmp = glm::operator*<float, (glm::qualifier)0> (a, b); [return slot optimization]
  _1 = tmp.D.95554.x;
  _2 = tmp.D.95560.y;
  _3 = _1 + _2;
  _4 = tmp.D.95566.z;
  D.105613 = _3 + _4;
  goto <D.105615>;
  <D.105615>:
  tmp = {CLOBBER};
  goto <D.105614>;
  <D.105614>:
  return D.105613;
}



;; Function glm::operator*<float, (glm::qualifier)0> (_ZN3glmmlIfLNS_9qualifierE0EEENS_3vecILi3ET_XT0_EEERKS4_S6_, funcdef_no=4223, decl_uid=105270, cgraph_uid=1563, symbol_order=1567)

glm::operator*<float, (glm::qualifier)0> (const struct vec & v1, const struct vec & v2)
{
  _1 = v1->D.95566.z;
  _2 = v2->D.95566.z;
  _3 = _1 * _2;
  _4 = v1->D.95560.y;
  _5 = v2->D.95560.y;
  _6 = _4 * _5;
  _7 = v1->D.95554.x;
  _8 = v2->D.95554.x;
  _9 = _7 * _8;
  glm::vec<3, float, (glm::qualifier)0>::vec (&<retval>, _9, _6, _3);
  goto <D.105617>;
  <D.105617>:
  return <retval>;
}



;; Function glm::inversesqrt<float> (_ZN3glm11inversesqrtIfEET_S1_, funcdef_no=4180, decl_uid=104335, cgraph_uid=1521, symbol_order=1525)

glm::inversesqrt<float> (float x)
{
  float D.105618;

  _1 = std::sqrt (x);
  D.105618 = 1.0e+0 / _1;
  goto <D.105619>;
  <D.105619>:
  return D.105618;
}



;; Function std::sqrt (_ZSt4sqrtf, funcdef_no=107, decl_uid=23451, cgraph_uid=70, symbol_order=70)

std::sqrt (float __x)
{
  float D.105620;

  D.105620 = __builtin_sqrtf (__x);
  goto <D.105621>;
  <D.105621>:
  return D.105620;
}



;; Function glm::operator*<float, (glm::qualifier)0> (_ZN3glmmlIfLNS_9qualifierE0EEENS_3vecILi3ET_XT0_EEERKS4_S3_, funcdef_no=4181, decl_uid=104337, cgraph_uid=1522, symbol_order=1526)

glm::operator*<float, (glm::qualifier)0> (const struct vec & v, float scalar)
{
  _1 = v->D.95566.z;
  _2 = scalar * _1;
  _3 = v->D.95560.y;
  _4 = scalar * _3;
  _5 = v->D.95554.x;
  _6 = scalar * _5;
  glm::vec<3, float, (glm::qualifier)0>::vec (&<retval>, _6, _4, _2);
  goto <D.105623>;
  <D.105623>:
  return <retval>;
}



;; Function glm::operator*<float, (glm::qualifier)0> (_ZN3glmmlIfLNS_9qualifierE0EEENS_3vecILi3ET_XT0_EEES3_RKS4_, funcdef_no=4073, decl_uid=103176, cgraph_uid=1414, symbol_order=1418)

glm::operator*<float, (glm::qualifier)0> (float scalar, const struct vec & v)
{
  _1 = v->D.95566.z;
  _2 = scalar * _1;
  _3 = v->D.95560.y;
  _4 = scalar * _3;
  _5 = v->D.95554.x;
  _6 = scalar * _5;
  glm::vec<3, float, (glm::qualifier)0>::vec (&<retval>, _6, _4, _2);
  goto <D.105625>;
  <D.105625>:
  return <retval>;
}



;; Function glm::vec<3, float, (glm::qualifier)0>::operator[] (_ZN3glm3vecILi3EfLNS_9qualifierE0EEixEi, funcdef_no=3905, decl_uid=95573, cgraph_uid=1245, symbol_order=1249)

glm::vec<3, float, (glm::qualifier)0>::operator[] (struct vec * const this, length_type i)
{
  float & D.105632;
  bool iftmp.53;

  if (i >= 0) goto <D.105631>; else goto <D.105627>;
  <D.105631>:
  _1 = glm::vec<3, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105628>; else goto <D.105627>;
  <D.105627>:
  _assert ("i >= 0 && i < this->length()", "C:/glm/glm/detail/type_vec3.inl", 170);
  if (0 != 0) goto <D.105628>; else goto <D.105629>;
  <D.105628>:
  iftmp.53 = 1;
  goto <D.105630>;
  <D.105629>:
  iftmp.53 = 0;
  <D.105630>:
  switch (i) <default: <D.103182>, case 0: <D.103183>, case 1: <D.103184>, case 2: <D.103185>>
  <D.103182>:
  <D.103183>:
  D.105632 = &this->D.95554.x;
  goto <D.105633>;
  <D.103184>:
  D.105632 = &this->D.95560.y;
  goto <D.105633>;
  <D.103185>:
  D.105632 = &this->D.95566.z;
  goto <D.105633>;
  <D.105633>:
  return D.105632;
}



;; Function glm::vec<3, float, (glm::qualifier)0>::length (_ZN3glm3vecILi3EfLNS_9qualifierE0EE6lengthEv, funcdef_no=3898, decl_uid=95572, cgraph_uid=1238, symbol_order=1242)

glm::vec<3, float, (glm::qualifier)0>::length ()
{
  length_type D.105634;

  D.105634 = 3;
  goto <D.105635>;
  <D.105635>:
  return D.105634;
}



;; Function glm::operator*<float, (glm::qualifier)0> (_ZN3glmmlIfLNS_9qualifierE0EEENS_3vecILi4ET_XT0_EEERKS4_RKS3_, funcdef_no=1543, decl_uid=53303, cgraph_uid=398, symbol_order=398)

glm::operator*<float, (glm::qualifier)0> (const struct vec & v, const float & scalar)
{
  struct vec & D.105638;
  struct vec D.53349;

  _1 = *scalar;
  D.53349 = *v;
  D.105638 = glm::vec<4, float, (glm::qualifier)0>::operator*=<float> (&D.53349, _1);
  _2 = D.105638;
  <retval> = MEM[(const struct vec &)_2];
  goto <D.105640>;
  <D.105640>:
  D.53349 = {CLOBBER};
  goto <D.105637>;
  <D.105637>:
  return <retval>;
  <D.105639>:
  D.53349 = {CLOBBER};
  resx 1
}



;; Function glm::vec<4, float, (glm::qualifier)0>::operator*=<float> (_ZN3glm3vecILi4EfLNS_9qualifierE0EEmLIfEERS2_T_, funcdef_no=1544, decl_uid=53350, cgraph_uid=397, symbol_order=397)

glm::vec<4, float, (glm::qualifier)0>::operator*=<float> (struct vec * const this, float scalar)
{
  struct vec D.53360;
  struct vec & D.105641;

  glm::vec<4, float, (glm::qualifier)0>::vec (&D.53360, scalar);
  *this = glm::detail::compute_vec4_mul<float, (glm::qualifier)0, false>::call (this, &D.53360);
  D.105641 = this;
  goto <D.105644>;
  <D.105644>:
  D.53360 = {CLOBBER};
  goto <D.105642>;
  <D.105642>:
  return D.105641;
  <D.105643>:
  D.53360 = {CLOBBER};
  resx 1
}



;; Function glm::vec<4, float, (glm::qualifier)0>::vec (_ZN3glm3vecILi4EfLNS_9qualifierE0EEC1Ef, funcdef_no=1542, decl_uid=53261, cgraph_uid=391, symbol_order=391)

glm::vec<4, float, (glm::qualifier)0>::vec (struct vec * const this, float scalar)
{
  MEM[(struct  &)this] = {CLOBBER};
  this->D.51351.x = scalar;
  this->D.51357.y = scalar;
  this->D.51363.z = scalar;
  this->D.51369.w = scalar;
  return;
}



;; Function glm::detail::compute_vec4_mul<float, (glm::qualifier)0, false>::call (_ZN3glm6detail16compute_vec4_mulIfLNS_9qualifierE0ELb0EE4callERKNS_3vecILi4EfLS2_0EEES7_, funcdef_no=1545, decl_uid=53356, cgraph_uid=396, symbol_order=396)

glm::detail::compute_vec4_mul<float, (glm::qualifier)0, false>::call (const struct vec & a, const struct vec & b)
{
  _1 = a->D.51369.w;
  _2 = b->D.51369.w;
  _3 = _1 * _2;
  _4 = a->D.51363.z;
  _5 = b->D.51363.z;
  _6 = _4 * _5;
  _7 = a->D.51357.y;
  _8 = b->D.51357.y;
  _9 = _7 * _8;
  _10 = a->D.51351.x;
  _11 = b->D.51351.x;
  _12 = _10 * _11;
  glm::vec<4, float, (glm::qualifier)0>::vec (&<retval>, _12, _9, _6, _3);
  goto <D.105646>;
  <D.105646>:
  return <retval>;
}



;; Function glm::vec<4, float, (glm::qualifier)0>::vec (_ZN3glm3vecILi4EfLNS_9qualifierE0EEC1Effff, funcdef_no=1548, decl_uid=53249, cgraph_uid=395, symbol_order=395)

glm::vec<4, float, (glm::qualifier)0>::vec (struct vec * const this, float _x, float _y, float _z, float _w)
{
  MEM[(struct  &)this] = {CLOBBER};
  this->D.51351.x = _x;
  this->D.51357.y = _y;
  this->D.51363.z = _z;
  this->D.51369.w = _w;
  return;
}



;; Function glm::operator+<float, (glm::qualifier)0> (_ZN3glmplIfLNS_9qualifierE0EEENS_3vecILi4ET_XT0_EEERKS4_S6_, funcdef_no=3907, decl_uid=103190, cgraph_uid=1249, symbol_order=1253)

glm::operator+<float, (glm::qualifier)0> (const struct vec & v1, const struct vec & v2)
{
  struct vec & D.105649;
  struct vec D.103214;

  D.103214 = *v1;
  D.105649 = glm::vec<4, float, (glm::qualifier)0>::operator+=<float> (&D.103214, v2);
  _1 = D.105649;
  <retval> = MEM[(const struct vec &)_1];
  goto <D.105651>;
  <D.105651>:
  D.103214 = {CLOBBER};
  goto <D.105648>;
  <D.105648>:
  return <retval>;
  <D.105650>:
  D.103214 = {CLOBBER};
  resx 1
}



;; Function glm::vec<4, float, (glm::qualifier)0>::operator+=<float> (_ZN3glm3vecILi4EfLNS_9qualifierE0EEpLIfEERS2_RKNS0_ILi4ET_LS1_0EEE, funcdef_no=3908, decl_uid=103215, cgraph_uid=1248, symbol_order=1252)

glm::vec<4, float, (glm::qualifier)0>::operator+=<float> (struct vec * const this, const struct vec & v)
{
  struct vec D.103228;
  struct vec & D.105652;

  D.103228 = *v;
  *this = glm::detail::compute_vec4_add<float, (glm::qualifier)0, false>::call (this, &D.103228);
  D.105652 = this;
  goto <D.105654>;
  <D.105654>:
  D.103228 = {CLOBBER};
  goto <D.105653>;
  <D.105653>:
  return D.105652;
}



;; Function glm::detail::compute_vec4_add<float, (glm::qualifier)0, false>::call (_ZN3glm6detail16compute_vec4_addIfLNS_9qualifierE0ELb0EE4callERKNS_3vecILi4EfLS2_0EEES7_, funcdef_no=3909, decl_uid=103224, cgraph_uid=1247, symbol_order=1251)

glm::detail::compute_vec4_add<float, (glm::qualifier)0, false>::call (const struct vec & a, const struct vec & b)
{
  _1 = a->D.51369.w;
  _2 = b->D.51369.w;
  _3 = _1 + _2;
  _4 = a->D.51363.z;
  _5 = b->D.51363.z;
  _6 = _4 + _5;
  _7 = a->D.51357.y;
  _8 = b->D.51357.y;
  _9 = _7 + _8;
  _10 = a->D.51351.x;
  _11 = b->D.51351.x;
  _12 = _10 + _11;
  glm::vec<4, float, (glm::qualifier)0>::vec (&<retval>, _12, _9, _6, _3);
  goto <D.105656>;
  <D.105656>:
  return <retval>;
}



;; Function glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (_ZNK3glm3matILi4ELi4EfLNS_9qualifierE0EEixEi, funcdef_no=3536, decl_uid=97337, cgraph_uid=877, symbol_order=879)

glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (const struct mat * const this, length_type i)
{
  const struct col_type & D.105662;
  bool iftmp.54;

  _1 = glm::mat<4, 4, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105658>; else goto <D.105661>;
  <D.105661>:
  _assert ("i < this->length()", "C:/glm/glm/detail/type_mat4x4.inl", 298);
  if (0 != 0) goto <D.105658>; else goto <D.105659>;
  <D.105658>:
  iftmp.54 = 1;
  goto <D.105660>;
  <D.105659>:
  iftmp.54 = 0;
  <D.105660>:
  D.105662 = &this->value[i];
  goto <D.105663>;
  <D.105663>:
  return D.105662;
}



;; Function glm::mat<4, 4, float, (glm::qualifier)0>::length (_ZN3glm3matILi4ELi4EfLNS_9qualifierE0EE6lengthEv, funcdef_no=3537, decl_uid=97333, cgraph_uid=876, symbol_order=878)

glm::mat<4, 4, float, (glm::qualifier)0>::length ()
{
  length_type D.105664;

  D.105664 = 4;
  goto <D.105665>;
  <D.105665>:
  return D.105664;
}



;; Function glm::vec<3, float, (glm::qualifier)0>::vec (_ZN3glm3vecILi3EfLNS_9qualifierE0EEC1Efff, funcdef_no=3557, decl_uid=96468, cgraph_uid=897, symbol_order=901)

glm::vec<3, float, (glm::qualifier)0>::vec (struct vec * const this, float _x, float _y, float _z)
{
  MEM[(struct  &)this] = {CLOBBER};
  this->D.95554.x = _x;
  this->D.95560.y = _y;
  this->D.95566.z = _z;
  return;
}



;; Function glm::translate<float, (glm::qualifier)0> (_ZN3glm9translateIfLNS_9qualifierE0EEENS_3matILi4ELi4ET_XT0_EEERKS4_RKNS_3vecILi3ES3_XT0_EEE, funcdef_no=3906, decl_uid=100869, cgraph_uid=1250, symbol_order=1254)

glm::translate<float, (glm::qualifier)0> (const struct mat & m, const struct vec & v)
{
  struct col_type & D.105676;
  const struct col_type & D.105675;
  const float & D.105674;
  const struct col_type & D.105673;
  const float & D.105672;
  const struct col_type & D.105671;
  const float & D.105670;
  const struct col_type & D.105669;
  struct mat Result [value-expr: <retval>];
  struct col_type & D.105667;
  struct vec D.103209;
  struct vec D.103210;
  struct vec D.103211;
  struct vec D.103212;
  struct vec D.103233;

  <retval> = *m;
  D.105669 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 3);
  _1 = D.105669;
  D.105670 = glm::vec<3, float, (glm::qualifier)0>::operator[] (v, 2);
  _2 = D.105670;
  D.105671 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 2);
  _3 = D.105671;
  D.103212 = glm::operator*<float, (glm::qualifier)0> (_3, _2); [return slot optimization]
  D.105672 = glm::vec<3, float, (glm::qualifier)0>::operator[] (v, 1);
  _4 = D.105672;
  D.105673 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 1);
  _5 = D.105673;
  D.103210 = glm::operator*<float, (glm::qualifier)0> (_5, _4); [return slot optimization]
  D.105674 = glm::vec<3, float, (glm::qualifier)0>::operator[] (v, 0);
  _6 = D.105674;
  D.105675 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _7 = D.105675;
  D.103209 = glm::operator*<float, (glm::qualifier)0> (_7, _6); [return slot optimization]
  D.103211 = glm::operator+<float, (glm::qualifier)0> (&D.103209, &D.103210); [return slot optimization]
  D.103233 = glm::operator+<float, (glm::qualifier)0> (&D.103211, &D.103212); [return slot optimization]
  D.105676 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 3);
  D.105667 = D.105676;
  *D.105667 = glm::operator+<float, (glm::qualifier)0> (&D.103233, _1);
  D.103233 = {CLOBBER};
  D.103211 = {CLOBBER};
  D.103209 = {CLOBBER};
  D.103210 = {CLOBBER};
  D.103212 = {CLOBBER};
  goto <D.105668>;
  <D.105668>:
  return <retval>;
  <D.105677>:
  D.103233 = {CLOBBER};
  resx 5
  <D.105678>:
  D.103211 = {CLOBBER};
  resx 4
  <D.105679>:
  D.103209 = {CLOBBER};
  resx 3
  <D.105680>:
  D.103210 = {CLOBBER};
  resx 2
  <D.105681>:
  D.103212 = {CLOBBER};
  resx 1
}



;; Function glm::vec<3, float, (glm::qualifier)0>::operator[] (_ZNK3glm3vecILi3EfLNS_9qualifierE0EEixEi, funcdef_no=3897, decl_uid=95576, cgraph_uid=1239, symbol_order=1243)

glm::vec<3, float, (glm::qualifier)0>::operator[] (const struct vec * const this, length_type i)
{
  const float & D.105688;
  bool iftmp.55;

  if (i >= 0) goto <D.105687>; else goto <D.105683>;
  <D.105687>:
  _1 = glm::vec<3, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105684>; else goto <D.105683>;
  <D.105683>:
  _assert ("i >= 0 && i < this->length()", "C:/glm/glm/detail/type_vec3.inl", 186);
  if (0 != 0) goto <D.105684>; else goto <D.105685>;
  <D.105684>:
  iftmp.55 = 1;
  goto <D.105686>;
  <D.105685>:
  iftmp.55 = 0;
  <D.105686>:
  switch (i) <default: <D.103140>, case 0: <D.103141>, case 1: <D.103142>, case 2: <D.103143>>
  <D.103140>:
  <D.103141>:
  D.105688 = &this->D.95554.x;
  goto <D.105689>;
  <D.103142>:
  D.105688 = &this->D.95560.y;
  goto <D.105689>;
  <D.103143>:
  D.105688 = &this->D.95566.z;
  goto <D.105689>;
  <D.105689>:
  return D.105688;
}



;; Function glm::radians<float> (_ZN3glm7radiansIfEET_S1_, funcdef_no=3558, decl_uid=100873, cgraph_uid=898, symbol_order=902)

glm::radians<float> (float degrees)
{
  float D.105690;

  D.105690 = degrees * 1.745329238474369049072265625e-2;
  goto <D.105691>;
  <D.105691>:
  return D.105690;
}



;; Function glm::perspective<float> (_ZN3glm11perspectiveIfEENS_3matILi4ELi4ET_LNS_9qualifierE0EEES2_S2_S2_S2_, funcdef_no=3910, decl_uid=100875, cgraph_uid=1251, symbol_order=1255)

glm::perspective<float> (float fovy, float aspect, float zNear, float zFar)
{
  <retval> = glm::perspectiveRH_NO<float> (fovy, aspect, zNear, zFar); [return slot optimization]
  goto <D.105693>;
  <D.105693>:
  return <retval>;
}



;; Function glm::perspectiveRH_NO<float> (_ZN3glm16perspectiveRH_NOIfEENS_3matILi4ELi4ET_LNS_9qualifierE0EEES2_S2_S2_S2_, funcdef_no=4074, decl_uid=103237, cgraph_uid=1415, symbol_order=1419)

glm::perspectiveRH_NO<float> (float fovy, float aspect, float zNear, float zFar)
{
  float & D.105711;
  struct col_type & D.105710;
  float & D.105709;
  struct col_type & D.105708;
  float & D.105707;
  struct col_type & D.105706;
  float & D.105705;
  struct col_type & D.105704;
  float & D.105703;
  struct col_type & D.105702;
  float D.105701;
  struct mat Result [value-expr: <retval>];
  const float tanHalfFovy;
  bool iftmp.56;

  _1 = std::numeric_limits<float>::epsilon ();
  _2 = aspect - _1;
  D.105701 = glm::abs<float> (_2);
  _3 = D.105701;
  if (_3 > 0.0) goto <D.105696>; else goto <D.105699>;
  <D.105699>:
  _assert ("abs(aspect - std::numeric_limits<T>::epsilon()) > static_cast<T>(0)", "C:/glm/glm/ext/matrix_clip_space.inl", 251);
  if (0 != 0) goto <D.105696>; else goto <D.105697>;
  <D.105696>:
  iftmp.56 = 1;
  goto <D.105698>;
  <D.105697>:
  iftmp.56 = 0;
  <D.105698>:
  _4 = fovy / 2.0e+0;
  _5 = std::tan (_4);
  tanHalfFovy = _5;
  <retval> = {};
  tanHalfFovy.57_6 = tanHalfFovy;
  _7 = aspect * tanHalfFovy.57_6;
  D.105702 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 0);
  _8 = D.105702;
  D.105703 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_8, 0);
  _9 = D.105703;
  _10 = 1.0e+0 / _7;
  *_9 = _10;
  tanHalfFovy.58_11 = tanHalfFovy;
  D.105704 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 1);
  _12 = D.105704;
  D.105705 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_12, 1);
  _13 = D.105705;
  _14 = 1.0e+0 / tanHalfFovy.58_11;
  *_13 = _14;
  _15 = zFar + zNear;
  _16 = -_15;
  _17 = zFar - zNear;
  D.105706 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 2);
  _18 = D.105706;
  D.105707 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_18, 2);
  _19 = D.105707;
  _20 = _16 / _17;
  *_19 = _20;
  D.105708 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 2);
  _21 = D.105708;
  D.105709 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_21, 3);
  _22 = D.105709;
  *_22 = -1.0e+0;
  _23 = zFar * 2.0e+0;
  _24 = zNear * _23;
  _25 = -_24;
  _26 = zFar - zNear;
  D.105710 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 3);
  _27 = D.105710;
  D.105711 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_27, 2);
  _28 = D.105711;
  _29 = _25 / _26;
  *_28 = _29;
  goto <D.105713>;
  <D.105713>:
  tanHalfFovy = {CLOBBER};
  goto <D.105700>;
  <D.105700>:
  return <retval>;
  <D.105712>:
  tanHalfFovy = {CLOBBER};
  resx 1
}



;; Function std::numeric_limits<float>::epsilon (_ZNSt14numeric_limitsIfE7epsilonEv, funcdef_no=440, decl_uid=28156, cgraph_uid=336, symbol_order=336)

std::numeric_limits<float>::epsilon ()
{
  float D.105714;

  D.105714 = 1.1920928955078125e-7;
  goto <D.105715>;
  <D.105715>:
  return D.105714;
}



;; Function glm::abs<float> (_ZN3glm3absIfEET_S1_, funcdef_no=1755, decl_uid=59499, cgraph_uid=425, symbol_order=425)

glm::abs<float> (float x)
{
  float D.105716;

  D.105716 = glm::detail::compute_abs<float, true>::call (x);
  goto <D.105717>;
  <D.105717>:
  return D.105716;
}



;; Function glm::detail::compute_abs<float, true>::call (_ZN3glm6detail11compute_absIfLb1EE4callEf, funcdef_no=3606, decl_uid=59504, cgraph_uid=947, symbol_order=951)

glm::detail::compute_abs<float, true>::call (float x)
{
  float iftmp.59;
  float D.105718;

  if (x >= 0.0) goto <D.105720>; else goto <D.105721>;
  <D.105720>:
  iftmp.59 = x;
  goto <D.105722>;
  <D.105721>:
  iftmp.59 = -x;
  <D.105722>:
  D.105718 = iftmp.59;
  goto <D.105723>;
  <D.105723>:
  return D.105718;
}



;; Function std::tan (_ZSt3tanf, funcdef_no=110, decl_uid=23463, cgraph_uid=72, symbol_order=72)

std::tan (float __x)
{
  float D.105724;

  D.105724 = __builtin_tanf (__x);
  goto <D.105725>;
  <D.105725>:
  return D.105724;
}



;; Function glm::value_ptr<float, (glm::qualifier)0> (_ZN3glm9value_ptrIfLNS_9qualifierE0EEEPT_RNS_3matILi4ELi4ES2_XT0_EEE, funcdef_no=3911, decl_uid=100884, cgraph_uid=1252, symbol_order=1256)

glm::value_ptr<float, (glm::qualifier)0> (struct mat & m)
{
  struct col_type & D.105728;
  float * D.105726;

  D.105728 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _1 = D.105728;
  D.105726 = &_1->D.51351.x;
  goto <D.105727>;
  <D.105727>:
  return D.105726;
}



;; Function glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (_ZN3glm3matILi4ELi4EfLNS_9qualifierE0EEixEi, funcdef_no=3912, decl_uid=97334, cgraph_uid=1253, symbol_order=1257)

glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (struct mat * const this, length_type i)
{
  struct col_type & D.105734;
  bool iftmp.60;

  _1 = glm::mat<4, 4, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105730>; else goto <D.105733>;
  <D.105733>:
  _assert ("i < this->length()", "C:/glm/glm/detail/type_mat4x4.inl", 291);
  if (0 != 0) goto <D.105730>; else goto <D.105731>;
  <D.105730>:
  iftmp.60 = 1;
  goto <D.105732>;
  <D.105731>:
  iftmp.60 = 0;
  <D.105732>:
  D.105734 = &this->value[i];
  goto <D.105735>;
  <D.105735>:
  return D.105734;
}



;; Function glm::vec<4, float, (glm::qualifier)0>::operator[] (_ZN3glm3vecILi4EfLNS_9qualifierE0EEixEi, funcdef_no=3913, decl_uid=51376, cgraph_uid=1254, symbol_order=1258)

glm::vec<4, float, (glm::qualifier)0>::operator[] (struct vec * const this, length_type i)
{
  float & D.105742;
  bool iftmp.61;

  if (i >= 0) goto <D.105741>; else goto <D.105737>;
  <D.105741>:
  _1 = glm::vec<4, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105738>; else goto <D.105737>;
  <D.105737>:
  _assert ("i >= 0 && i < this->length()", "C:/glm/glm/detail/type_vec4.inl", 479);
  if (0 != 0) goto <D.105738>; else goto <D.105739>;
  <D.105738>:
  iftmp.61 = 1;
  goto <D.105740>;
  <D.105739>:
  iftmp.61 = 0;
  <D.105740>:
  switch (i) <default: <D.103246>, case 0: <D.103247>, case 1: <D.103248>, case 2: <D.103249>, case 3: <D.103250>>
  <D.103246>:
  <D.103247>:
  D.105742 = &this->D.51351.x;
  goto <D.105743>;
  <D.103248>:
  D.105742 = &this->D.51357.y;
  goto <D.105743>;
  <D.103249>:
  D.105742 = &this->D.51363.z;
  goto <D.105743>;
  <D.103250>:
  D.105742 = &this->D.51369.w;
  goto <D.105743>;
  <D.105743>:
  return D.105742;
}



;; Function glm::vec<4, float, (glm::qualifier)0>::length (_ZN3glm3vecILi4EfLNS_9qualifierE0EE6lengthEv, funcdef_no=3900, decl_uid=51375, cgraph_uid=1240, symbol_order=1244)

glm::vec<4, float, (glm::qualifier)0>::length ()
{
  length_type D.105744;

  D.105744 = 4;
  goto <D.105745>;
  <D.105745>:
  return D.105744;
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
  char * D.105750;
  const char * iftmp.62;

  MEM[(struct  &)this] = {CLOBBER};
  _1 = &this->_M_dataplus;
  D.105750 = std::__cxx11::basic_string<char>::_M_local_data (this);
  _2 = D.105750;
  std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (_1, _2, __a);
  if (__s != 0B) goto <D.105747>; else goto <D.105748>;
  <D.105747>:
  _3 = std::char_traits<char>::length (__s);
  iftmp.62 = __s + _3;
  goto <D.105749>;
  <D.105748>:
  iftmp.62 = __s + 18446744073709551615;
  <D.105749>:
  std::__cxx11::basic_string<char>::_M_construct<const char*> (this, __s, iftmp.62);
  return;
  <D.105751>:
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
  size_t D.105752;

  D.105752 = __builtin_strlen (__s);
  goto <D.105753>;
  <D.105753>:
  return D.105752;
}



;; Function std::__cxx11::basic_string<char>::_M_construct<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_, funcdef_no=3965, decl_uid=102620, cgraph_uid=1306, symbol_order=1310)

std::__cxx11::basic_string<char>::_M_construct<const char*> (struct basic_string * const this, const char * __beg, const char * __end)
{
  struct __false_type D.105754;
  struct _Integral D.103460;

  std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (this, __beg, __end, D.105754);
  D.103460 = {CLOBBER};
  return;
  <D.105755>:
  D.103460 = {CLOBBER};
  resx 1
}



;; Function std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPKcEEvT_S8_St12__false_type, funcdef_no=4092, decl_uid=103494, cgraph_uid=1433, symbol_order=1437)

std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (struct basic_string * const this, const char * __beg, const char * __end, struct __false_type D.103498)
{
  struct forward_iterator_tag D.105756;
  struct _Tag D.104023;
  struct forward_iterator_tag D.104043;

  _1 = &D.104023;
  std::__cxx11::basic_string<char>::_M_construct<const char*> (this, __beg, __end, D.105756);
  D.104023 = {CLOBBER};
  return;
  <D.105757>:
  D.104023 = {CLOBBER};
  resx 1
}



;; Function std::__cxx11::basic_string<char>::_M_construct<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, funcdef_no=4150, decl_uid=104033, cgraph_uid=1491, symbol_order=1495)

std::__cxx11::basic_string<char>::_M_construct<const char*> (struct basic_string * const this, const char * __beg, const char * __end, struct forward_iterator_tag D.104037)
{
  char * D.105771;
  char * D.105770;
  long long int D.105769;
  size_type __dnew;
  bool iftmp.64;
  bool retval.63;

  _1 = __gnu_cxx::__is_null_pointer<const char> (__beg);
  if (_1 != 0) goto <D.105762>; else goto <D.105760>;
  <D.105762>:
  if (__beg != __end) goto <D.105763>; else goto <D.105760>;
  <D.105763>:
  iftmp.64 = 1;
  goto <D.105761>;
  <D.105760>:
  iftmp.64 = 0;
  <D.105761>:
  retval.63 = iftmp.64;
  if (retval.63 != 0) goto <D.105764>; else goto <D.105765>;
  <D.105764>:
  std::__throw_logic_error ("basic_string::_M_construct null not valid");
  <D.105765>:
  D.105769 = std::distance<const char*> (__beg, __end);
  _2 = D.105769;
  _3 = (long long unsigned int) _2;
  __dnew = _3;
  __dnew.65_4 = __dnew;
  if (__dnew.65_4 > 15) goto <D.105766>; else goto <D.105767>;
  <D.105766>:
  D.105770 = std::__cxx11::basic_string<char>::_M_create (this, &__dnew, 0);
  _5 = D.105770;
  std::__cxx11::basic_string<char>::_M_data (this, _5);
  __dnew.66_6 = __dnew;
  std::__cxx11::basic_string<char>::_M_capacity (this, __dnew.66_6);
  goto <D.105768>;
  <D.105767>:
  <D.105768>:
  D.105771 = std::__cxx11::basic_string<char>::_M_data (this);
  _7 = D.105771;
  std::__cxx11::basic_string<char>::_S_copy_chars (_7, __beg, __end);
  __dnew.67_9 = __dnew;
  std::__cxx11::basic_string<char>::_M_set_length (this, __dnew.67_9);
  __dnew = {CLOBBER};
  return;
  <D.105774>:
  eh_dispatch 2
  resx 2
  <D.105773>:
  _8 = __builtin_eh_pointer (2);
  __cxa_begin_catch (_8);
  std::__cxx11::basic_string<char>::_M_dispose (this);
  __cxa_rethrow ();
  <D.105772>:
  __cxa_end_catch ();
  resx 3
  <D.105775>:
  __dnew = {CLOBBER};
  resx 1
}



;; Function __gnu_cxx::__is_null_pointer<const char> (_ZN9__gnu_cxx17__is_null_pointerIKcEEbPT_, funcdef_no=4189, decl_uid=104393, cgraph_uid=1530, symbol_order=1534)

__gnu_cxx::__is_null_pointer<const char> (const char * __ptr)
{
  bool D.105776;

  D.105776 = __ptr == 0B;
  goto <D.105777>;
  <D.105777>:
  return D.105776;
}



;; Function std::distance<const char*> (_ZSt8distanceIPKcENSt15iterator_traitsIT_E15difference_typeES3_S3_, funcdef_no=4190, decl_uid=104396, cgraph_uid=1532, symbol_order=1536)

std::distance<const char*> (const char * __first, const char * __last)
{
  struct random_access_iterator_tag D.105779;
  struct iterator_category D.105183;
  difference_type D.105778;

  std::__iterator_category<const char*> (&__first);
  __first.68_1 = __first;
  D.105778 = std::__distance<const char*> (__first.68_1, __last, D.105779);
  goto <D.105781>;
  <D.105781>:
  D.105183 = {CLOBBER};
  goto <D.105780>;
  <D.105780>:
  return D.105778;
}



;; Function std::__iterator_category<const char*> (_ZSt19__iterator_categoryIPKcENSt15iterator_traitsIT_E17iterator_categoryERKS3_, funcdef_no=4191, decl_uid=105181, cgraph_uid=1531, symbol_order=1535)

std::__iterator_category<const char*> (const char * const & D.105182)
{
  struct iterator_category D.105782;

  goto <D.105783>;
  <D.105783>:
  return D.105782;
}



;; Function std::__distance<const char*> (_ZSt10__distanceIPKcENSt15iterator_traitsIT_E15difference_typeES3_S3_St26random_access_iterator_tag, funcdef_no=4234, decl_uid=105184, cgraph_uid=1575, symbol_order=1579)

std::__distance<const char*> (const char * __first, const char * __last, struct random_access_iterator_tag D.105187)
{
  difference_type D.105784;

  D.105784 = __last - __first;
  goto <D.105785>;
  <D.105785>:
  return D.105784;
}



;; Function std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev, funcdef_no=3685, decl_uid=73082, cgraph_uid=1025, symbol_order=1029)

std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (struct _Alloc_hider * const this)
{
  std::allocator<char>::~allocator (this);
  MEM[(struct  &)this] = {CLOBBER};
  <D.102010>:
  return;
}



;; Function Shader::setMat4 (_ZNK6Shader7setMat4ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKN3glm3matILi4ELi4EfLNS8_9qualifierE0EEE, funcdef_no=3535, decl_uid=95310, cgraph_uid=878, symbol_order=880)

Shader::setMat4 (const struct Shader * const this, const struct string & name, const struct mat4 & mat)
{
  int D.105788;
  const float & D.105787;
  const struct col_type & D.105786;

  __glewUniformMatrix4fv.69_1 = __glewUniformMatrix4fv;
  D.105786 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (mat, 0);
  _2 = D.105786;
  D.105787 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_2, 0);
  _3 = D.105787;
  __glewGetUniformLocation.70_4 = __glewGetUniformLocation;
  _5 = std::__cxx11::basic_string<char>::c_str (name);
  _6 = this->ID;
  D.105788 = __glewGetUniformLocation.70_4 (_6, _5);
  _7 = D.105788;
  __glewUniformMatrix4fv.69_1 (_7, 1, 0, _3);
  return;
}



;; Function glm::vec<4, float, (glm::qualifier)0>::operator[] (_ZNK3glm3vecILi4EfLNS_9qualifierE0EEixEi, funcdef_no=3899, decl_uid=51379, cgraph_uid=1241, symbol_order=1245)

glm::vec<4, float, (glm::qualifier)0>::operator[] (const struct vec * const this, length_type i)
{
  const float & D.105795;
  bool iftmp.71;

  if (i >= 0) goto <D.105794>; else goto <D.105790>;
  <D.105794>:
  _1 = glm::vec<4, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105791>; else goto <D.105790>;
  <D.105790>:
  _assert ("i >= 0 && i < this->length()", "C:/glm/glm/detail/type_vec4.inl", 497);
  if (0 != 0) goto <D.105791>; else goto <D.105792>;
  <D.105791>:
  iftmp.71 = 1;
  goto <D.105793>;
  <D.105792>:
  iftmp.71 = 0;
  <D.105793>:
  switch (i) <default: <D.103147>, case 0: <D.103148>, case 1: <D.103149>, case 2: <D.103150>, case 3: <D.103151>>
  <D.103147>:
  <D.103148>:
  D.105795 = &this->D.51351.x;
  goto <D.105796>;
  <D.103149>:
  D.105795 = &this->D.51357.y;
  goto <D.105796>;
  <D.103150>:
  D.105795 = &this->D.51363.z;
  goto <D.105796>;
  <D.103151>:
  D.105795 = &this->D.51369.w;
  goto <D.105796>;
  <D.105796>:
  return D.105795;
}



;; Function std::__cxx11::basic_string<char>::~basic_string (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev, funcdef_no=3686, decl_uid=72988, cgraph_uid=1027, symbol_order=1031)

std::__cxx11::basic_string<char>::~basic_string (struct basic_string * const this)
{
  std::__cxx11::basic_string<char>::_M_dispose (this);
  _1 = &this->_M_dataplus;
  std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (_1);
  MEM[(struct  &)this] = {CLOBBER};
  <D.102013>:
  return;
}



;; Function std::allocator<char>::~allocator (_ZNSaIcED2Ev, funcdef_no=3788, decl_uid=66534, cgraph_uid=1129, symbol_order=1133)

std::allocator<char>::~allocator (struct allocator * const this)
{
  __gnu_cxx::new_allocator<char>::~new_allocator (this);
  <D.102616>:
  return;
}



;; Function __gnu_cxx::new_allocator<char>::~new_allocator (_ZN9__gnu_cxx13new_allocatorIcED2Ev, funcdef_no=3960, decl_uid=66469, cgraph_uid=1301, symbol_order=1305)

__gnu_cxx::new_allocator<char>::~new_allocator (struct new_allocator * const this)
{
  <D.103421>:
  return;
}



;; Function processInput (_Z12processInputP10GLFWwindow, funcdef_no=3559, decl_uid=97937, cgraph_uid=900, symbol_order=904)

processInput (struct GLFWwindow * window)
{
  int D.105801;
  bool retval.72;

  D.105801 = glfwGetKey (window, 256);
  _1 = D.105801;
  retval.72 = _1 == 1;
  if (retval.72 != 0) goto <D.105798>; else goto <D.105799>;
  <D.105798>:
  glfwSetWindowShouldClose (window, 1);
  goto <D.105800>;
  <D.105799>:
  <D.105800>:
  return;
}



;; Function framebuffer_size_callback (_Z25framebuffer_size_callbackP10GLFWwindowii, funcdef_no=3560, decl_uid=97935, cgraph_uid=901, symbol_order=905)

framebuffer_size_callback (struct GLFWwindow * window, int width, int height)
{
  glViewport (0, 0, width, height);
  return;
}



;; Function __static_initialization_and_destruction_0 (_Z41__static_initialization_and_destruction_0ii, funcdef_no=4260, decl_uid=105355, cgraph_uid=1602, symbol_order=1702)

__static_initialization_and_destruction_0 (int __initialize_p, int __priority)
{
  if (__initialize_p == 1) goto <D.105802>; else goto <D.105803>;
  <D.105802>:
  if (__priority == 65535) goto <D.105804>; else goto <D.105805>;
  <D.105804>:
  std::ios_base::Init::Init (&__ioinit);
  atexit (__tcf_0);
  goto <D.105806>;
  <D.105805>:
  <D.105806>:
  goto <D.105807>;
  <D.105803>:
  <D.105807>:
  return;
}



;; Function __tcf_0 (__tcf_0, funcdef_no=4261, decl_uid=105359, cgraph_uid=1601, symbol_order=1701)

__tcf_0 ()
{
  std::ios_base::Init::~Init (&__ioinit);
  return;
}



;; Function _GLOBAL__sub_I_main (_GLOBAL__sub_I_main, funcdef_no=4262, decl_uid=105363, cgraph_uid=1603, symbol_order=2318)

_GLOBAL__sub_I_main ()
{
  __static_initialization_and_destruction_0 (1, 65535);
  return;
}


