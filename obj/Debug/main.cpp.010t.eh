
;; Function main (main, funcdef_no=3539, decl_uid=97940, cgraph_uid=899, symbol_order=903)

main ()
{
  float & D.105415;
  struct col_type & D.105414;
  float * D.105413;
  int D.105412;
  int D.105411;
  int D.105408;
  long long unsigned int D.105407;
  struct FILE * D.105406;
  struct basic_ostream & D.105405;
  const GLubyte * D.105404;
  struct basic_ostream & D.105403;
  struct basic_ostream & D.105402;
  unsigned int D.105401;
  struct basic_ostream & D.105400;
  struct GLFWwindow * D.105399;
  unsigned int viewLoc;
  unsigned int modelLoc;
  struct mat4 projection;
  struct mat4 view;
  struct mat4 model;
  int validarNumerico;
  unsigned int VAO;
  unsigned int VBO;
  float vertices[0:D.105380] [value-expr: *vertices.3];
  struct FILE * arqin;
  char * pch;
  char linha[100];
  char c;
  int i;
  int linhas;
  struct Shader ourShader;
  struct GLFWwindow * window;
  void * saved_stack.31;
  struct allocator D.100889;
  const struct string D.100890;
  struct vec3 D.100870;
  struct vec3 D.100851;
  bool retval.20;
  bool retval.4;
  float[0:D.105380] * vertices.3;
  sizetype D.105384;
  bitsizetype D.105383;
  sizetype D.105382;
  bitsizetype D.105381;
  sizetype D.105380;
  ssizetype D.105379;
  bool retval.1;
  bool retval.0;
  int D.105366;

  saved_stack.31 = __builtin_stack_save ();
  glfwInit ();
  glfwWindowHint (139266, 3);
  glfwWindowHint (139267, 3);
  glfwWindowHint (139272, 204801);
  D.105399 = glfwCreateWindow (800, 600, "OPenGL : TDE 2 - 3D", 0B, 0B);
  window = D.105399;
  if (window == 0B) goto <D.105364>; else goto <D.105365>;
  <D.105364>:
  D.105400 = std::operator<< <std::char_traits<char> > (&cout, "Failed to create GLFW window");
  _1 = D.105400;
  std::basic_ostream<char>::operator<< (_1, endl);
  glfwTerminate ();
  D.105366 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.105422>;
  <D.105365>:
  glfwMakeContextCurrent (window);
  glfwSetFramebufferSizeCallback (window, framebuffer_size_callback);
  D.105401 = glewInit ();
  _2 = D.105401;
  retval.0 = _2 != 0;
  if (retval.0 != 0) goto <D.105368>; else goto <D.105369>;
  <D.105368>:
  D.105402 = std::operator<< <std::char_traits<char> > (&cout, "Ocorreu um erro iniciando GLEW!");
  _3 = D.105402;
  std::basic_ostream<char>::operator<< (_3, endl);
  goto <D.105370>;
  <D.105369>:
  D.105403 = std::operator<< <std::char_traits<char> > (&cout, "GLEW OK!");
  _4 = D.105403;
  std::basic_ostream<char>::operator<< (_4, endl);
  D.105404 = glGetString (7938);
  _5 = D.105404;
  D.105405 = std::operator<< <std::char_traits<char> > (&cout, _5);
  _6 = D.105405;
  std::basic_ostream<char>::operator<< (_6, endl);
  <D.105370>:
  glEnable (2929);
  Shader::Shader (&ourShader, "vertex.glsl", "fragment.glsl", 0B);
  linhas = 1;
  i = 0;
  D.105406 = fopen ("casa.csv", "rt");
  arqin = D.105406;
  if (arqin == 0B) goto <D.105371>; else goto <D.105372>;
  <D.105371>:
  printf ("Erro na abertura de %s %d\n", "casa.csv", 8);
  exit (0);
  <D.105372>:
  <D.105373>:
  D.105407 = fread (&c, 1, 1, arqin);
  _7 = D.105407;
  retval.1 = _7 != 0;
  if (retval.1 != 0) goto <D.105375>; else goto <D.100891>;
  <D.105375>:
  c.2_8 = c;
  if (c.2_8 == 10) goto <D.105376>; else goto <D.105377>;
  <D.105376>:
  linhas = linhas + 1;
  goto <D.105378>;
  <D.105377>:
  <D.105378>:
  goto <D.105373>;
  <D.100891>:
  printf ("Linhas: %d \n", linhas);
  _9 = linhas * 8;
  _10 = (ssizetype) _9;
  D.105379 = _10 + -1;
  D.105380 = (sizetype) D.105379;
  _12 = (sizetype) D.105379;
  _13 = _12 + 1;
  _14 = (bitsizetype) _13;
  D.105381 = _14 * 32;
  _16 = (sizetype) D.105379;
  _17 = _16 + 1;
  D.105382 = _17 * 4;
  _19 = (sizetype) D.105379;
  _20 = _19 + 1;
  _21 = (bitsizetype) _20;
  D.105383 = _21 * 32;
  _23 = (sizetype) D.105379;
  _24 = _23 + 1;
  D.105384 = _24 * 4;
  vertices.3 = __builtin_alloca_with_align (D.105384, 32);
  fclose (arqin);
  i = 0;
  fopen ("casa.csv", "rt");
  <D.105386>:
  _26 = feof (arqin);
  retval.4 = _26 == 0;
  if (retval.4 != 0) goto <D.105388>; else goto <D.100893>;
  <D.105388>:
  fgets (&linha, 100, arqin);
  pch = strtok (&linha, ";");
  <D.105389>:
  if (pch == 0B) goto <D.100895>; else goto <D.105390>;
  <D.105390>:
  validarNumerico = strcmp (pch, "\n");
  if (validarNumerico != 0) goto <D.105391>; else goto <D.105392>;
  <D.105391>:
  _27 = atof (pch);
  vertices.5_28 = vertices.3;
  _29 = (long long unsigned int) i;
  _30 = _29 * 4;
  _31 = vertices.5_28 + _30;
  _32 = (float) _27;
  *_31 = _32;
  _33 = *vertices.3[i];
  _34 = (double) _33;
  printf ("vertices[%d]: %f\n ", i, _34);
  i = i + 1;
  goto <D.105393>;
  <D.105392>:
  <D.105393>:
  pch = strtok (0B, ";");
  goto <D.105389>;
  <D.100895>:
  goto <D.105386>;
  <D.100893>:
  fclose (arqin);
  __glewGenVertexArrays.6_35 = __glewGenVertexArrays;
  __glewGenVertexArrays.6_35 (1, &VAO);
  __glewGenBuffers.7_36 = __glewGenBuffers;
  __glewGenBuffers.7_36 (1, &VBO);
  __glewBindVertexArray.8_37 = __glewBindVertexArray;
  VAO.9_38 = VAO;
  __glewBindVertexArray.8_37 (VAO.9_38);
  __glewBindBuffer.10_39 = __glewBindBuffer;
  VBO.11_40 = VBO;
  __glewBindBuffer.10_39 (34962, VBO.11_40);
  __glewBufferData.12_41 = __glewBufferData;
  vertices.13_42 = vertices.3;
  _43 = (sizetype) D.105379;
  _44 = _43 + 1;
  _45 = _44 * 4;
  _46 = (long long int) _45;
  __glewBufferData.12_41 (34962, _46, vertices.13_42, 35044);
  __glewVertexAttribPointer.14_47 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.14_47 (0, 3, 5126, 0, 32, 0B);
  __glewEnableVertexAttribArray.15_48 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.15_48 (0);
  __glewVertexAttribPointer.16_49 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.16_49 (1, 3, 5126, 0, 32, 12B);
  __glewEnableVertexAttribArray.17_50 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.17_50 (1);
  __glewVertexAttribPointer.18_51 = __glewVertexAttribPointer;
  __glewVertexAttribPointer.18_51 (2, 2, 5126, 0, 32, 12B);
  __glewEnableVertexAttribArray.19_52 = __glewEnableVertexAttribArray;
  __glewEnableVertexAttribArray.19_52 (2);
  <D.105394>:
  D.105408 = glfwWindowShouldClose (window);
  _53 = D.105408;
  retval.20 = _53 == 0;
  if (retval.20 != 0) goto <D.105396>; else goto <D.100897>;
  <D.105396>:
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
  glm::vec<3, float, (glm::qualifier)0>::vec (&D.100851, 1.00000001490116119384765625e-1, 0.0, 0.0);
  _54 = glm::radians<float> (5.5e+1);
  model = glm::rotate<float, (glm::qualifier)0> (&model, _54, &D.100851);
  D.100851 = {CLOBBER};
  glm::vec<3, float, (glm::qualifier)0>::vec (&D.100870, 0.0, 0.0, -3.0e+0);
  view = glm::translate<float, (glm::qualifier)0> (&view, &D.100870);
  D.100870 = {CLOBBER};
  _55 = glm::radians<float> (4.5e+1);
  projection = glm::perspective<float> (_55, 1.33333337306976318359375e+0, 1.00000001490116119384765625e-1, 1.0e+2);
  __glewGetUniformLocation.21_56 = __glewGetUniformLocation;
  _57 = ourShader.ID;
  D.105411 = __glewGetUniformLocation.21_56 (_57, "model");
  _58 = D.105411;
  modelLoc = (unsigned int) _58;
  __glewGetUniformLocation.22_59 = __glewGetUniformLocation;
  _60 = ourShader.ID;
  D.105412 = __glewGetUniformLocation.22_59 (_60, "view");
  _61 = D.105412;
  viewLoc = (unsigned int) _61;
  __glewUniformMatrix4fv.23_62 = __glewUniformMatrix4fv;
  D.105413 = glm::value_ptr<float, (glm::qualifier)0> (&model);
  _63 = D.105413;
  modelLoc.24_64 = (int) modelLoc;
  __glewUniformMatrix4fv.23_62 (modelLoc.24_64, 1, 0, _63);
  __glewUniformMatrix4fv.25_65 = __glewUniformMatrix4fv;
  D.105414 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&view, 0);
  _66 = D.105414;
  D.105415 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_66, 0);
  _67 = D.105415;
  viewLoc.26_68 = (int) viewLoc;
  __glewUniformMatrix4fv.25_65 (viewLoc.26_68, 1, 0, _67);
  std::allocator<char>::allocator (&D.100889);
  std::__cxx11::basic_string<char>::basic_string (&D.100890, "projection", &D.100889);
  Shader::setMat4 (&ourShader, &D.100890, &projection);
  std::__cxx11::basic_string<char>::~basic_string (&D.100890);
  D.100890 = {CLOBBER};
  std::allocator<char>::~allocator (&D.100889);
  D.100889 = {CLOBBER};
  __glewBindVertexArray.27_69 = __glewBindVertexArray;
  VAO.28_70 = VAO;
  __glewBindVertexArray.27_69 (VAO.28_70);
  glDrawArrays (4, 0, 36);
  glfwSwapBuffers (window);
  glfwPollEvents ();
  model = {CLOBBER};
  view = {CLOBBER};
  projection = {CLOBBER};
  goto <D.105394>;
  <D.100897>:
  __glewDeleteVertexArrays.29_71 = __glewDeleteVertexArrays;
  __glewDeleteVertexArrays.29_71 (1, &VAO);
  __glewDeleteBuffers.30_72 = __glewDeleteBuffers;
  __glewDeleteBuffers.30_72 (1, &VBO);
  glfwTerminate ();
  D.105366 = 0;
  goto <D.105422>;
  <D.105422>:
  __builtin_stack_restore (saved_stack.31);
  ourShader = {CLOBBER};
  c = {CLOBBER};
  linha = {CLOBBER};
  VBO = {CLOBBER};
  VAO = {CLOBBER};
  goto <D.105398>;
  D.105366 = 0;
  goto <D.105398>;
  <D.105398>:
  return D.105366;
  <D.105409>:
  D.100851 = {CLOBBER};
  resx 3
  <D.105410>:
  D.100870 = {CLOBBER};
  resx 5
  <D.105416>:
  std::__cxx11::basic_string<char>::~basic_string (&D.100890);
  resx 10
  <D.105417>:
  D.100890 = {CLOBBER};
  resx 9
  <D.105418>:
  std::allocator<char>::~allocator (&D.100889);
  resx 8
  <D.105419>:
  D.100889 = {CLOBBER};
  resx 7
  <D.105420>:
  model = {CLOBBER};
  view = {CLOBBER};
  projection = {CLOBBER};
  resx 2
  <D.105421>:
  __builtin_stack_restore (saved_stack.31);
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
  unsigned int D.105465;
  unsigned int D.105459;
  unsigned int D.105454;
  unsigned int D.105449;
  struct basic_ostream & D.105444;
  struct __filebuf_type * D.105438;
  struct __filebuf_type * D.105437;
  struct __filebuf_type * D.105436;
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
  D.105436 = std::basic_ifstream<char>::rdbuf (&vShaderFile);
  _6 = D.105436;
  std::basic_ostream<char>::operator<< (&vShaderStream.D.94702.D.89313, _6);
  D.105437 = std::basic_ifstream<char>::rdbuf (&fShaderFile);
  _7 = D.105437;
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
  if (geometryPath != 0B) goto <D.105424>; else goto <D.105425>;
  <D.105424>:
  std::basic_ifstream<char>::open (&gShaderFile, geometryPath, 8);
  _8 = std::operator| (16, 8);
  std::__cxx11::basic_stringstream<char>::basic_stringstream (&gShaderStream, _8);
  D.105438 = std::basic_ifstream<char>::rdbuf (&gShaderFile);
  _9 = D.105438;
  std::basic_ostream<char>::operator<< (&gShaderStream.D.94702.D.89313, _9);
  std::basic_ifstream<char>::close (&gShaderFile);
  D.95530 = std::__cxx11::basic_stringstream<char>::str (&gShaderStream); [return slot optimization]
  std::__cxx11::basic_string<char>::operator= (&geometryCode, &D.95530);
  std::__cxx11::basic_string<char>::~basic_string (&D.95530);
  D.95530 = {CLOBBER};
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&gShaderStream);
  gShaderStream = {CLOBBER};
  goto <D.105426>;
  <D.105425>:
  <D.105426>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&fShaderStream);
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&vShaderStream);
  vShaderStream = {CLOBBER};
  fShaderStream = {CLOBBER};
  <D.105447>:
  _12 = std::__cxx11::basic_string<char>::c_str (&vertexCode);
  vShaderCode = _12;
  _13 = std::__cxx11::basic_string<char>::c_str (&fragmentCode);
  fShaderCode = _13;
  __glewCreateShader.32_14 = __glewCreateShader;
  D.105449 = __glewCreateShader.32_14 (35633);
  vertex = D.105449;
  __glewShaderSource.33_15 = __glewShaderSource;
  __glewShaderSource.33_15 (vertex, 1, &vShaderCode, 0B);
  __glewCompileShader.34_16 = __glewCompileShader;
  __glewCompileShader.34_16 (vertex);
  std::allocator<char>::allocator (&D.95534);
  std::__cxx11::basic_string<char>::basic_string (&D.95533, "VERTEX", &D.95534);
  Shader::checkCompileErrors (this, vertex, &D.95533);
  std::__cxx11::basic_string<char>::~basic_string (&D.95533);
  D.95533 = {CLOBBER};
  std::allocator<char>::~allocator (&D.95534);
  D.95534 = {CLOBBER};
  __glewCreateShader.35_17 = __glewCreateShader;
  D.105454 = __glewCreateShader.35_17 (35632);
  fragment = D.105454;
  __glewShaderSource.36_18 = __glewShaderSource;
  __glewShaderSource.36_18 (fragment, 1, &fShaderCode, 0B);
  __glewCompileShader.37_19 = __glewCompileShader;
  __glewCompileShader.37_19 (fragment);
  std::allocator<char>::allocator (&D.95536);
  std::__cxx11::basic_string<char>::basic_string (&D.95535, "FRAGMENT", &D.95536);
  Shader::checkCompileErrors (this, fragment, &D.95535);
  std::__cxx11::basic_string<char>::~basic_string (&D.95535);
  D.95535 = {CLOBBER};
  std::allocator<char>::~allocator (&D.95536);
  D.95536 = {CLOBBER};
  if (geometryPath != 0B) goto <D.105427>; else goto <D.105428>;
  <D.105427>:
  _20 = std::__cxx11::basic_string<char>::c_str (&geometryCode);
  gShaderCode = _20;
  __glewCreateShader.38_21 = __glewCreateShader;
  D.105459 = __glewCreateShader.38_21 (36313);
  geometry = D.105459;
  __glewShaderSource.39_22 = __glewShaderSource;
  __glewShaderSource.39_22 (geometry, 1, &gShaderCode, 0B);
  __glewCompileShader.40_23 = __glewCompileShader;
  __glewCompileShader.40_23 (geometry);
  std::allocator<char>::allocator (&D.95539);
  std::__cxx11::basic_string<char>::basic_string (&D.95538, "GEOMETRY", &D.95539);
  Shader::checkCompileErrors (this, geometry, &D.95538);
  std::__cxx11::basic_string<char>::~basic_string (&D.95538);
  D.95538 = {CLOBBER};
  std::allocator<char>::~allocator (&D.95539);
  D.95539 = {CLOBBER};
  gShaderCode = {CLOBBER};
  goto <D.105429>;
  <D.105428>:
  <D.105429>:
  __glewCreateProgram.41_24 = __glewCreateProgram;
  D.105465 = __glewCreateProgram.41_24 ();
  _25 = D.105465;
  this->ID = _25;
  __glewAttachShader.42_26 = __glewAttachShader;
  _27 = this->ID;
  __glewAttachShader.42_26 (_27, vertex);
  __glewAttachShader.43_28 = __glewAttachShader;
  _29 = this->ID;
  __glewAttachShader.43_28 (_29, fragment);
  if (geometryPath != 0B) goto <D.105430>; else goto <D.105431>;
  <D.105430>:
  __glewAttachShader.44_30 = __glewAttachShader;
  _31 = this->ID;
  __glewAttachShader.44_30 (_31, geometry);
  goto <D.105432>;
  <D.105431>:
  <D.105432>:
  __glewLinkProgram.45_32 = __glewLinkProgram;
  _33 = this->ID;
  __glewLinkProgram.45_32 (_33);
  std::allocator<char>::allocator (&D.95541);
  std::__cxx11::basic_string<char>::basic_string (&D.95540, "PROGRAM", &D.95541);
  _34 = this->ID;
  Shader::checkCompileErrors (this, _34, &D.95540);
  std::__cxx11::basic_string<char>::~basic_string (&D.95540);
  D.95540 = {CLOBBER};
  std::allocator<char>::~allocator (&D.95541);
  D.95541 = {CLOBBER};
  __glewDeleteShader.46_35 = __glewDeleteShader;
  __glewDeleteShader.46_35 (vertex);
  __glewDeleteShader.47_36 = __glewDeleteShader;
  __glewDeleteShader.47_36 (fragment);
  if (geometryPath != 0B) goto <D.105433>; else goto <D.105434>;
  <D.105433>:
  __glewDeleteShader.48_37 = __glewDeleteShader;
  __glewDeleteShader.48_37 (geometry);
  goto <D.105435>;
  <D.105434>:
  <D.105435>:
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
  <D.105439>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&gShaderStream);
  resx 17
  <D.105440>:
  gShaderStream = {CLOBBER};
  resx 16
  <D.105441>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&fShaderStream);
  resx 11
  <D.105442>:
  std::__cxx11::basic_stringstream<char>::~basic_stringstream (&vShaderStream);
  resx 10
  <D.105443>:
  vShaderStream = {CLOBBER};
  fShaderStream = {CLOBBER};
  resx 9
  <D.105448>:
  eh_dispatch 8
  resx 8
  <D.105446>:
  _10 = __builtin_eh_pointer (8);
  D.95532 = __cxa_begin_catch (_10);
  e = D.95532;
  D.105444 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::SHADER::FILE_NOT_SUCCESFULLY_READ");
  _11 = D.105444;
  std::basic_ostream<char>::operator<< (_11, endl);
  __cxa_end_catch ();
  goto <D.105447>;
  <D.105445>:
  __cxa_end_catch ();
  resx 25
  <D.105450>:
  std::__cxx11::basic_string<char>::~basic_string (&D.95533);
  resx 30
  <D.105451>:
  D.95533 = {CLOBBER};
  resx 29
  <D.105452>:
  std::allocator<char>::~allocator (&D.95534);
  resx 28
  <D.105453>:
  D.95534 = {CLOBBER};
  resx 27
  <D.105455>:
  std::__cxx11::basic_string<char>::~basic_string (&D.95535);
  resx 38
  <D.105456>:
  D.95535 = {CLOBBER};
  resx 37
  <D.105457>:
  std::allocator<char>::~allocator (&D.95536);
  resx 36
  <D.105458>:
  D.95536 = {CLOBBER};
  resx 35
  <D.105460>:
  std::__cxx11::basic_string<char>::~basic_string (&D.95538);
  resx 47
  <D.105461>:
  D.95538 = {CLOBBER};
  resx 46
  <D.105462>:
  std::allocator<char>::~allocator (&D.95539);
  resx 45
  <D.105463>:
  D.95539 = {CLOBBER};
  resx 44
  <D.105464>:
  gShaderCode = {CLOBBER};
  resx 43
  <D.105466>:
  std::__cxx11::basic_string<char>::~basic_string (&D.95540);
  resx 56
  <D.105467>:
  D.95540 = {CLOBBER};
  resx 55
  <D.105468>:
  std::allocator<char>::~allocator (&D.95541);
  resx 54
  <D.105469>:
  D.95541 = {CLOBBER};
  resx 53
  <D.105470>:
  std::basic_ifstream<char>::~basic_ifstream (&gShaderFile);
  resx 7
  <D.105471>:
  std::basic_ifstream<char>::~basic_ifstream (&fShaderFile);
  resx 6
  <D.105472>:
  std::basic_ifstream<char>::~basic_ifstream (&vShaderFile);
  resx 5
  <D.105473>:
  std::__cxx11::basic_string<char>::~basic_string (&geometryCode);
  resx 4
  <D.105474>:
  std::__cxx11::basic_string<char>::~basic_string (&fragmentCode);
  resx 3
  <D.105475>:
  std::__cxx11::basic_string<char>::~basic_string (&vertexCode);
  resx 2
  <D.105476>:
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
  char * D.105477;
  struct allocator D.103059;

  MEM[(struct  &)this] = {CLOBBER};
  _1 = &this->_M_dataplus;
  std::allocator<char>::allocator (&D.103059);
  D.105477 = std::__cxx11::basic_string<char>::_M_local_data (this);
  _2 = D.105477;
  std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (_1, _2, &D.103059);
  std::allocator<char>::~allocator (&D.103059);
  D.103059 = {CLOBBER};
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



;; Function std::move<std::allocator<char>&> (_ZSt4moveIRSaIcEEONSt16remove_referenceIT_E4typeEOS3_, funcdef_no=3929, decl_uid=102020, cgraph_uid=1270, symbol_order=1274)

std::move<std::allocator<char>&> (struct allocator & __t)
{
  struct type & D.105478;

  D.105478 = __t;
  goto <D.105479>;
  <D.105479>:
  return D.105478;
}



;; Function std::operator| (_ZStorSt12_Ios_IostateS_, funcdef_no=2949, decl_uid=80506, cgraph_uid=753, symbol_order=754)

std::operator| (_Ios_Iostate __a, _Ios_Iostate __b)
{
  _Ios_Iostate D.105480;

  D.105480 = __a | __b;
  goto <D.105481>;
  <D.105481>:
  return D.105480;
}



;; Function std::operator| (_ZStorSt13_Ios_OpenmodeS_, funcdef_no=2942, decl_uid=80471, cgraph_uid=746, symbol_order=747)

std::operator| (_Ios_Openmode __a, _Ios_Openmode __b)
{
  _Ios_Openmode D.105482;

  D.105482 = __a | __b;
  goto <D.105483>;
  <D.105483>:
  return D.105482;
}



;; Function Shader::checkCompileErrors (_ZN6Shader18checkCompileErrorsEjNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, funcdef_no=3538, decl_uid=95314, cgraph_uid=879, symbol_order=881)

Shader::checkCompileErrors (struct Shader * const this, GLuint shader, struct string & restrict type)
{
  struct basic_ostream & D.105504;
  struct basic_ostream & D.105503;
  struct basic_ostream & D.105502;
  struct basic_ostream & D.105501;
  struct basic_ostream & D.105500;
  struct basic_ostream & D.105499;
  struct basic_ostream & D.105498;
  struct basic_ostream & D.105497;
  struct basic_ostream & D.105496;
  struct basic_ostream & D.105495;
  bool D.105494;
  GLchar infoLog[1024];
  GLint success;
  bool retval.49;

  D.105494 = std::operator!=<char, std::char_traits<char>, std::allocator<char> > (type, "PROGRAM");
  retval.49 = D.105494;
  if (retval.49 != 0) goto <D.105485>; else goto <D.105486>;
  <D.105485>:
  __glewGetShaderiv.50_1 = __glewGetShaderiv;
  __glewGetShaderiv.50_1 (shader, 35713, &success);
  success.51_2 = success;
  if (success.51_2 == 0) goto <D.105487>; else goto <D.105488>;
  <D.105487>:
  __glewGetShaderInfoLog.52_3 = __glewGetShaderInfoLog;
  __glewGetShaderInfoLog.52_3 (shader, 1024, 0B, &infoLog);
  D.105495 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::SHADER_COMPILATION_ERROR of type: ");
  _4 = D.105495;
  D.105496 = std::operator<< <char, std::char_traits<char>, std::allocator<char> > (_4, type);
  _5 = D.105496;
  D.105497 = std::operator<< <std::char_traits<char> > (_5, "\n");
  _6 = D.105497;
  D.105498 = std::operator<< <std::char_traits<char> > (_6, &infoLog);
  _7 = D.105498;
  D.105499 = std::operator<< <std::char_traits<char> > (_7, "\n -- --------------------------------------------------- -- ");
  _8 = D.105499;
  std::basic_ostream<char>::operator<< (_8, endl);
  goto <D.105489>;
  <D.105488>:
  <D.105489>:
  goto <D.105490>;
  <D.105486>:
  __glewGetProgramiv.53_9 = __glewGetProgramiv;
  __glewGetProgramiv.53_9 (shader, 35714, &success);
  success.54_10 = success;
  if (success.54_10 == 0) goto <D.105491>; else goto <D.105492>;
  <D.105491>:
  __glewGetProgramInfoLog.55_11 = __glewGetProgramInfoLog;
  __glewGetProgramInfoLog.55_11 (shader, 1024, 0B, &infoLog);
  D.105500 = std::operator<< <std::char_traits<char> > (&cout, "ERROR::PROGRAM_LINKING_ERROR of type: ");
  _12 = D.105500;
  D.105501 = std::operator<< <char, std::char_traits<char>, std::allocator<char> > (_12, type);
  _13 = D.105501;
  D.105502 = std::operator<< <std::char_traits<char> > (_13, "\n");
  _14 = D.105502;
  D.105503 = std::operator<< <std::char_traits<char> > (_14, &infoLog);
  _15 = D.105503;
  D.105504 = std::operator<< <std::char_traits<char> > (_15, "\n -- --------------------------------------------------- -- ");
  _16 = D.105504;
  std::basic_ostream<char>::operator<< (_16, endl);
  goto <D.105493>;
  <D.105492>:
  <D.105493>:
  <D.105490>:
  success = {CLOBBER};
  infoLog = {CLOBBER};
  return;
  <D.105505>:
  success = {CLOBBER};
  infoLog = {CLOBBER};
  resx 1
}



;; Function std::operator!=<char, std::char_traits<char>, std::allocator<char> > (_ZStneIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, funcdef_no=3901, decl_uid=97879, cgraph_uid=1242, symbol_order=1246)

std::operator!=<char, std::char_traits<char>, std::allocator<char> > (const struct basic_string & __lhs, const char * __rhs)
{
  bool D.105506;

  _1 = std::operator==<char, std::char_traits<char>, std::allocator<char> > (__lhs, __rhs);
  D.105506 = ~_1;
  goto <D.105507>;
  <D.105507>:
  return D.105506;
}



;; Function std::operator==<char, std::char_traits<char>, std::allocator<char> > (_ZSteqIcSt11char_traitsIcESaIcEEbRKNSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_, funcdef_no=4071, decl_uid=103153, cgraph_uid=1412, symbol_order=1416)

std::operator==<char, std::char_traits<char>, std::allocator<char> > (const struct basic_string & __lhs, const char * __rhs)
{
  bool D.105508;

  _1 = std::__cxx11::basic_string<char>::compare (__lhs, __rhs);
  D.105508 = _1 == 0;
  goto <D.105509>;
  <D.105509>:
  return D.105508;
}



;; Function Shader::use (_ZN6Shader3useEv, funcdef_no=3519, decl_uid=95256, cgraph_uid=860, symbol_order=862)

Shader::use (struct Shader * const this)
{
  __glewUseProgram.56_1 = __glewUseProgram;
  _2 = this->ID;
  __glewUseProgram.56_1 (_2);
  return;
}



;; Function glm::rotate<float, (glm::qualifier)0> (_ZN3glm6rotateIfLNS_9qualifierE0EEENS_3matILi4ELi4ET_XT0_EEERKS4_S3_RKNS_3vecILi3ES3_XT0_EEE, funcdef_no=3904, decl_uid=100852, cgraph_uid=1246, symbol_order=1250)

glm::rotate<float, (glm::qualifier)0> (const struct mat & m, float angle, const struct vec & v)
{
  struct col_type & D.105601;
  const struct col_type & D.105600;
  struct col_type & D.105595;
  const struct col_type & D.105594;
  float & D.105593;
  struct col_type & D.105592;
  const struct col_type & D.105591;
  float & D.105590;
  struct col_type & D.105589;
  const struct col_type & D.105588;
  float & D.105587;
  struct col_type & D.105586;
  struct col_type & D.105581;
  const struct col_type & D.105580;
  float & D.105579;
  struct col_type & D.105578;
  const struct col_type & D.105577;
  float & D.105576;
  struct col_type & D.105575;
  const struct col_type & D.105574;
  float & D.105573;
  struct col_type & D.105572;
  struct col_type & D.105567;
  const struct col_type & D.105566;
  float & D.105565;
  struct col_type & D.105564;
  const struct col_type & D.105563;
  float & D.105562;
  struct col_type & D.105561;
  const struct col_type & D.105560;
  float & D.105559;
  struct col_type & D.105558;
  float & D.105557;
  struct col_type & D.105556;
  float & D.105555;
  float & D.105554;
  float & D.105553;
  struct col_type & D.105552;
  float & D.105551;
  float & D.105550;
  float & D.105549;
  float & D.105548;
  struct col_type & D.105547;
  float & D.105546;
  float & D.105545;
  float & D.105544;
  float & D.105543;
  struct col_type & D.105542;
  float & D.105541;
  float & D.105540;
  float & D.105539;
  float & D.105538;
  struct col_type & D.105537;
  float & D.105536;
  float & D.105535;
  float & D.105534;
  struct col_type & D.105533;
  float & D.105532;
  float & D.105531;
  float & D.105530;
  float & D.105529;
  struct col_type & D.105528;
  float & D.105527;
  float & D.105526;
  float & D.105525;
  float & D.105524;
  struct col_type & D.105523;
  float & D.105522;
  float & D.105521;
  float & D.105520;
  float & D.105519;
  struct col_type & D.105518;
  float & D.105517;
  float & D.105516;
  struct mat Result [value-expr: <retval>];
  struct mat Rotate;
  struct vec temp;
  struct vec axis;
  const float s;
  const float c;
  const float a;
  struct col_type & D.105514;
  struct col_type & D.105513;
  struct vec D.103200;
  struct vec D.103201;
  struct vec D.103202;
  struct vec D.103203;
  struct col_type & D.105512;
  struct vec D.103195;
  struct vec D.103196;
  struct vec D.103197;
  struct vec D.103198;
  struct col_type & D.105511;
  struct vec D.103187;
  struct vec D.103188;
  struct vec D.103192;
  struct vec D.103193;

  a = angle;
  c = std::cos (a);
  s = std::sin (a);
  axis = glm::normalize<3, float, (glm::qualifier)0> (v); [return slot optimization]
  _1 = 1.0e+0 - c;
  temp = glm::operator*<float, (glm::qualifier)0> (_1, &axis); [return slot optimization]
  D.105516 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 0);
  _2 = D.105516;
  _3 = *_2;
  D.105517 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _4 = D.105517;
  _5 = *_4;
  _6 = _3 * _5;
  D.105518 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _7 = D.105518;
  D.105519 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_7, 0);
  _8 = D.105519;
  _9 = c + _6;
  *_8 = _9;
  D.105520 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 0);
  _10 = D.105520;
  _11 = *_10;
  D.105521 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _12 = D.105521;
  _13 = *_12;
  _14 = _11 * _13;
  D.105522 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _15 = D.105522;
  _16 = *_15;
  _17 = s * _16;
  D.105523 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _18 = D.105523;
  D.105524 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_18, 1);
  _19 = D.105524;
  _20 = _14 + _17;
  *_19 = _20;
  D.105525 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 0);
  _21 = D.105525;
  _22 = *_21;
  D.105526 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _23 = D.105526;
  _24 = *_23;
  _25 = _22 * _24;
  D.105527 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _26 = D.105527;
  _27 = *_26;
  _28 = s * _27;
  D.105528 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _29 = D.105528;
  D.105529 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_29, 2);
  _30 = D.105529;
  _31 = _25 - _28;
  *_30 = _31;
  D.105530 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 1);
  _32 = D.105530;
  _33 = *_32;
  D.105531 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _34 = D.105531;
  _35 = *_34;
  _36 = _33 * _35;
  D.105532 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _37 = D.105532;
  _38 = *_37;
  _39 = s * _38;
  D.105533 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _40 = D.105533;
  D.105534 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_40, 0);
  _41 = D.105534;
  _42 = _36 - _39;
  *_41 = _42;
  D.105535 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 1);
  _43 = D.105535;
  _44 = *_43;
  D.105536 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _45 = D.105536;
  _46 = *_45;
  _47 = _44 * _46;
  D.105537 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _48 = D.105537;
  D.105538 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_48, 1);
  _49 = D.105538;
  _50 = c + _47;
  *_49 = _50;
  D.105539 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 1);
  _51 = D.105539;
  _52 = *_51;
  D.105540 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _53 = D.105540;
  _54 = *_53;
  _55 = _52 * _54;
  D.105541 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _56 = D.105541;
  _57 = *_56;
  _58 = s * _57;
  D.105542 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _59 = D.105542;
  D.105543 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_59, 2);
  _60 = D.105543;
  _61 = _55 + _58;
  *_60 = _61;
  D.105544 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 2);
  _62 = D.105544;
  _63 = *_62;
  D.105545 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _64 = D.105545;
  _65 = *_64;
  _66 = _63 * _65;
  D.105546 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _67 = D.105546;
  _68 = *_67;
  _69 = s * _68;
  D.105547 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _70 = D.105547;
  D.105548 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_70, 0);
  _71 = D.105548;
  _72 = _66 + _69;
  *_71 = _72;
  D.105549 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 2);
  _73 = D.105549;
  _74 = *_73;
  D.105550 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 1);
  _75 = D.105550;
  _76 = *_75;
  _77 = _74 * _76;
  D.105551 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 0);
  _78 = D.105551;
  _79 = *_78;
  _80 = s * _79;
  D.105552 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _81 = D.105552;
  D.105553 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_81, 1);
  _82 = D.105553;
  _83 = _77 - _80;
  *_82 = _83;
  D.105554 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&temp, 2);
  _84 = D.105554;
  _85 = *_84;
  D.105555 = glm::vec<3, float, (glm::qualifier)0>::operator[] (&axis, 2);
  _86 = D.105555;
  _87 = *_86;
  _88 = _85 * _87;
  D.105556 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _89 = D.105556;
  D.105557 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_89, 2);
  _90 = D.105557;
  _91 = c + _88;
  *_90 = _91;
  D.105558 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _92 = D.105558;
  D.105559 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_92, 2);
  _93 = D.105559;
  D.105560 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 2);
  _94 = D.105560;
  D.103193 = glm::operator*<float, (glm::qualifier)0> (_94, _93); [return slot optimization]
  D.105561 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _95 = D.105561;
  D.105562 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_95, 1);
  _96 = D.105562;
  D.105563 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 1);
  _97 = D.105563;
  D.103188 = glm::operator*<float, (glm::qualifier)0> (_97, _96); [return slot optimization]
  D.105564 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 0);
  _98 = D.105564;
  D.105565 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_98, 0);
  _99 = D.105565;
  D.105566 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _100 = D.105566;
  D.103187 = glm::operator*<float, (glm::qualifier)0> (_100, _99); [return slot optimization]
  D.103192 = glm::operator+<float, (glm::qualifier)0> (&D.103187, &D.103188); [return slot optimization]
  D.105567 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 0);
  D.105511 = D.105567;
  *D.105511 = glm::operator+<float, (glm::qualifier)0> (&D.103192, &D.103193);
  D.103192 = {CLOBBER};
  D.103187 = {CLOBBER};
  D.103188 = {CLOBBER};
  D.103193 = {CLOBBER};
  D.105572 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _101 = D.105572;
  D.105573 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_101, 2);
  _102 = D.105573;
  D.105574 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 2);
  _103 = D.105574;
  D.103198 = glm::operator*<float, (glm::qualifier)0> (_103, _102); [return slot optimization]
  D.105575 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _104 = D.105575;
  D.105576 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_104, 1);
  _105 = D.105576;
  D.105577 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 1);
  _106 = D.105577;
  D.103196 = glm::operator*<float, (glm::qualifier)0> (_106, _105); [return slot optimization]
  D.105578 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 1);
  _107 = D.105578;
  D.105579 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_107, 0);
  _108 = D.105579;
  D.105580 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _109 = D.105580;
  D.103195 = glm::operator*<float, (glm::qualifier)0> (_109, _108); [return slot optimization]
  D.103197 = glm::operator+<float, (glm::qualifier)0> (&D.103195, &D.103196); [return slot optimization]
  D.105581 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 1);
  D.105512 = D.105581;
  *D.105512 = glm::operator+<float, (glm::qualifier)0> (&D.103197, &D.103198);
  D.103197 = {CLOBBER};
  D.103195 = {CLOBBER};
  D.103196 = {CLOBBER};
  D.103198 = {CLOBBER};
  D.105586 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _110 = D.105586;
  D.105587 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_110, 2);
  _111 = D.105587;
  D.105588 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 2);
  _112 = D.105588;
  D.103203 = glm::operator*<float, (glm::qualifier)0> (_112, _111); [return slot optimization]
  D.105589 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _113 = D.105589;
  D.105590 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_113, 1);
  _114 = D.105590;
  D.105591 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 1);
  _115 = D.105591;
  D.103201 = glm::operator*<float, (glm::qualifier)0> (_115, _114); [return slot optimization]
  D.105592 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&Rotate, 2);
  _116 = D.105592;
  D.105593 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_116, 0);
  _117 = D.105593;
  D.105594 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _118 = D.105594;
  D.103200 = glm::operator*<float, (glm::qualifier)0> (_118, _117); [return slot optimization]
  D.103202 = glm::operator+<float, (glm::qualifier)0> (&D.103200, &D.103201); [return slot optimization]
  D.105595 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 2);
  D.105513 = D.105595;
  *D.105513 = glm::operator+<float, (glm::qualifier)0> (&D.103202, &D.103203);
  D.103202 = {CLOBBER};
  D.103200 = {CLOBBER};
  D.103201 = {CLOBBER};
  D.103203 = {CLOBBER};
  D.105600 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 3);
  _119 = D.105600;
  D.105601 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 3);
  D.105514 = D.105601;
  *D.105514 = MEM[(const struct vec &)_119];
  goto <D.105603>;
  <D.105603>:
  axis = {CLOBBER};
  temp = {CLOBBER};
  Rotate = {CLOBBER};
  goto <D.105515>;
  <D.105515>:
  return <retval>;
  <D.105568>:
  D.103192 = {CLOBBER};
  resx 5
  <D.105569>:
  D.103187 = {CLOBBER};
  resx 4
  <D.105570>:
  D.103188 = {CLOBBER};
  resx 3
  <D.105571>:
  D.103193 = {CLOBBER};
  resx 2
  <D.105582>:
  D.103197 = {CLOBBER};
  resx 13
  <D.105583>:
  D.103195 = {CLOBBER};
  resx 12
  <D.105584>:
  D.103196 = {CLOBBER};
  resx 11
  <D.105585>:
  D.103198 = {CLOBBER};
  resx 10
  <D.105596>:
  D.103202 = {CLOBBER};
  resx 21
  <D.105597>:
  D.103200 = {CLOBBER};
  resx 20
  <D.105598>:
  D.103201 = {CLOBBER};
  resx 19
  <D.105599>:
  D.103203 = {CLOBBER};
  resx 18
  <D.105602>:
  axis = {CLOBBER};
  temp = {CLOBBER};
  Rotate = {CLOBBER};
  resx 1
}



;; Function std::cos (_ZSt3cosf, funcdef_no=66, decl_uid=23268, cgraph_uid=42, symbol_order=42)

std::cos (float __x)
{
  float D.105604;

  D.105604 = __builtin_cosf (__x);
  goto <D.105605>;
  <D.105605>:
  return D.105604;
}



;; Function std::sin (_ZSt3sinf, funcdef_no=101, decl_uid=23427, cgraph_uid=66, symbol_order=66)

std::sin (float __x)
{
  float D.105606;

  D.105606 = __builtin_sinf (__x);
  goto <D.105607>;
  <D.105607>:
  return D.105606;
}



;; Function glm::normalize<3, float, (glm::qualifier)0> (_ZN3glm9normalizeILi3EfLNS_9qualifierE0EEENS_3vecIXT_ET0_XT1_EEERKS4_, funcdef_no=4072, decl_uid=103171, cgraph_uid=1413, symbol_order=1417)

glm::normalize<3, float, (glm::qualifier)0> (const struct vec & x)
{
  <retval> = glm::detail::compute_normalize<3, float, (glm::qualifier)0, false>::call (x); [return slot optimization]
  goto <D.105609>;
  <D.105609>:
  return <retval>;
}



;; Function glm::detail::compute_normalize<3, float, (glm::qualifier)0, false>::call (_ZN3glm6detail17compute_normalizeILi3EfLNS_9qualifierE0ELb0EE4callERKNS_3vecILi3EfLS2_0EEE, funcdef_no=4136, decl_uid=103781, cgraph_uid=1477, symbol_order=1481)

glm::detail::compute_normalize<3, float, (glm::qualifier)0, false>::call (const struct vec & v)
{
  float D.105612;

  D.105612 = glm::dot<3, float, (glm::qualifier)0> (v, v);
  _1 = D.105612;
  _2 = glm::inversesqrt<float> (_1);
  <retval> = glm::operator*<float, (glm::qualifier)0> (v, _2); [return slot optimization]
  goto <D.105611>;
  <D.105611>:
  return <retval>;
}



;; Function glm::dot<3, float, (glm::qualifier)0> (_ZN3glm3dotILi3EfLNS_9qualifierE0EEET0_RKNS_3vecIXT_ES2_XT1_EEES6_, funcdef_no=4179, decl_uid=104331, cgraph_uid=1520, symbol_order=1524)

glm::dot<3, float, (glm::qualifier)0> (const struct vec & x, const struct vec & y)
{
  float D.105615;
  float D.105613;

  D.105615 = glm::detail::compute_dot<glm::vec<3, float, (glm::qualifier)0>, float, false>::call (x, y);
  D.105613 = D.105615;
  goto <D.105614>;
  <D.105614>:
  return D.105613;
}



;; Function glm::detail::compute_dot<glm::vec<3, float, (glm::qualifier)0>, float, false>::call (_ZN3glm6detail11compute_dotINS_3vecILi3EfLNS_9qualifierE0EEEfLb0EE4callERKS4_S7_, funcdef_no=4222, decl_uid=105136, cgraph_uid=1564, symbol_order=1568)

glm::detail::compute_dot<glm::vec<3, float, (glm::qualifier)0>, float, false>::call (const struct vec & a, const struct vec & b)
{
  struct vec tmp;
  float D.105616;

  tmp = glm::operator*<float, (glm::qualifier)0> (a, b); [return slot optimization]
  _1 = tmp.D.95554.x;
  _2 = tmp.D.95560.y;
  _3 = _1 + _2;
  _4 = tmp.D.95566.z;
  D.105616 = _3 + _4;
  goto <D.105618>;
  <D.105618>:
  tmp = {CLOBBER};
  goto <D.105617>;
  <D.105617>:
  return D.105616;
}



;; Function glm::operator*<float, (glm::qualifier)0> (_ZN3glmmlIfLNS_9qualifierE0EEENS_3vecILi3ET_XT0_EEERKS4_S6_, funcdef_no=4223, decl_uid=105269, cgraph_uid=1563, symbol_order=1567)

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
  goto <D.105620>;
  <D.105620>:
  return <retval>;
}



;; Function glm::inversesqrt<float> (_ZN3glm11inversesqrtIfEET_S1_, funcdef_no=4180, decl_uid=104334, cgraph_uid=1521, symbol_order=1525)

glm::inversesqrt<float> (float x)
{
  float D.105621;

  _1 = std::sqrt (x);
  D.105621 = 1.0e+0 / _1;
  goto <D.105622>;
  <D.105622>:
  return D.105621;
}



;; Function std::sqrt (_ZSt4sqrtf, funcdef_no=107, decl_uid=23451, cgraph_uid=70, symbol_order=70)

std::sqrt (float __x)
{
  float D.105623;

  D.105623 = __builtin_sqrtf (__x);
  goto <D.105624>;
  <D.105624>:
  return D.105623;
}



;; Function glm::operator*<float, (glm::qualifier)0> (_ZN3glmmlIfLNS_9qualifierE0EEENS_3vecILi3ET_XT0_EEERKS4_S3_, funcdef_no=4181, decl_uid=104336, cgraph_uid=1522, symbol_order=1526)

glm::operator*<float, (glm::qualifier)0> (const struct vec & v, float scalar)
{
  _1 = v->D.95566.z;
  _2 = scalar * _1;
  _3 = v->D.95560.y;
  _4 = scalar * _3;
  _5 = v->D.95554.x;
  _6 = scalar * _5;
  glm::vec<3, float, (glm::qualifier)0>::vec (&<retval>, _6, _4, _2);
  goto <D.105626>;
  <D.105626>:
  return <retval>;
}



;; Function glm::operator*<float, (glm::qualifier)0> (_ZN3glmmlIfLNS_9qualifierE0EEENS_3vecILi3ET_XT0_EEES3_RKS4_, funcdef_no=4073, decl_uid=103175, cgraph_uid=1414, symbol_order=1418)

glm::operator*<float, (glm::qualifier)0> (float scalar, const struct vec & v)
{
  _1 = v->D.95566.z;
  _2 = scalar * _1;
  _3 = v->D.95560.y;
  _4 = scalar * _3;
  _5 = v->D.95554.x;
  _6 = scalar * _5;
  glm::vec<3, float, (glm::qualifier)0>::vec (&<retval>, _6, _4, _2);
  goto <D.105628>;
  <D.105628>:
  return <retval>;
}



;; Function glm::vec<3, float, (glm::qualifier)0>::operator[] (_ZN3glm3vecILi3EfLNS_9qualifierE0EEixEi, funcdef_no=3905, decl_uid=95573, cgraph_uid=1245, symbol_order=1249)

glm::vec<3, float, (glm::qualifier)0>::operator[] (struct vec * const this, length_type i)
{
  float & D.105635;
  bool iftmp.57;

  if (i >= 0) goto <D.105634>; else goto <D.105630>;
  <D.105634>:
  _1 = glm::vec<3, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105631>; else goto <D.105630>;
  <D.105630>:
  _assert ("i >= 0 && i < this->length()", "C:/glm/glm/detail/type_vec3.inl", 170);
  if (0 != 0) goto <D.105631>; else goto <D.105632>;
  <D.105631>:
  iftmp.57 = 1;
  goto <D.105633>;
  <D.105632>:
  iftmp.57 = 0;
  <D.105633>:
  switch (i) <default: <D.103181>, case 0: <D.103182>, case 1: <D.103183>, case 2: <D.103184>>
  <D.103181>:
  <D.103182>:
  D.105635 = &this->D.95554.x;
  goto <D.105636>;
  <D.103183>:
  D.105635 = &this->D.95560.y;
  goto <D.105636>;
  <D.103184>:
  D.105635 = &this->D.95566.z;
  goto <D.105636>;
  <D.105636>:
  return D.105635;
}



;; Function glm::vec<3, float, (glm::qualifier)0>::length (_ZN3glm3vecILi3EfLNS_9qualifierE0EE6lengthEv, funcdef_no=3898, decl_uid=95572, cgraph_uid=1238, symbol_order=1242)

glm::vec<3, float, (glm::qualifier)0>::length ()
{
  length_type D.105637;

  D.105637 = 3;
  goto <D.105638>;
  <D.105638>:
  return D.105637;
}



;; Function glm::operator*<float, (glm::qualifier)0> (_ZN3glmmlIfLNS_9qualifierE0EEENS_3vecILi4ET_XT0_EEERKS4_RKS3_, funcdef_no=1543, decl_uid=53303, cgraph_uid=398, symbol_order=398)

glm::operator*<float, (glm::qualifier)0> (const struct vec & v, const float & scalar)
{
  struct vec & D.105641;
  struct vec D.53349;

  _1 = *scalar;
  D.53349 = *v;
  D.105641 = glm::vec<4, float, (glm::qualifier)0>::operator*=<float> (&D.53349, _1);
  _2 = D.105641;
  <retval> = MEM[(const struct vec &)_2];
  goto <D.105643>;
  <D.105643>:
  D.53349 = {CLOBBER};
  goto <D.105640>;
  <D.105640>:
  return <retval>;
  <D.105642>:
  D.53349 = {CLOBBER};
  resx 1
}



;; Function glm::vec<4, float, (glm::qualifier)0>::operator*=<float> (_ZN3glm3vecILi4EfLNS_9qualifierE0EEmLIfEERS2_T_, funcdef_no=1544, decl_uid=53350, cgraph_uid=397, symbol_order=397)

glm::vec<4, float, (glm::qualifier)0>::operator*=<float> (struct vec * const this, float scalar)
{
  struct vec D.53360;
  struct vec & D.105644;

  glm::vec<4, float, (glm::qualifier)0>::vec (&D.53360, scalar);
  *this = glm::detail::compute_vec4_mul<float, (glm::qualifier)0, false>::call (this, &D.53360);
  D.105644 = this;
  goto <D.105647>;
  <D.105647>:
  D.53360 = {CLOBBER};
  goto <D.105645>;
  <D.105645>:
  return D.105644;
  <D.105646>:
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
  goto <D.105649>;
  <D.105649>:
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



;; Function glm::operator+<float, (glm::qualifier)0> (_ZN3glmplIfLNS_9qualifierE0EEENS_3vecILi4ET_XT0_EEERKS4_S6_, funcdef_no=3907, decl_uid=103189, cgraph_uid=1249, symbol_order=1253)

glm::operator+<float, (glm::qualifier)0> (const struct vec & v1, const struct vec & v2)
{
  struct vec & D.105652;
  struct vec D.103213;

  D.103213 = *v1;
  D.105652 = glm::vec<4, float, (glm::qualifier)0>::operator+=<float> (&D.103213, v2);
  _1 = D.105652;
  <retval> = MEM[(const struct vec &)_1];
  goto <D.105654>;
  <D.105654>:
  D.103213 = {CLOBBER};
  goto <D.105651>;
  <D.105651>:
  return <retval>;
  <D.105653>:
  D.103213 = {CLOBBER};
  resx 1
}



;; Function glm::vec<4, float, (glm::qualifier)0>::operator+=<float> (_ZN3glm3vecILi4EfLNS_9qualifierE0EEpLIfEERS2_RKNS0_ILi4ET_LS1_0EEE, funcdef_no=3908, decl_uid=103214, cgraph_uid=1248, symbol_order=1252)

glm::vec<4, float, (glm::qualifier)0>::operator+=<float> (struct vec * const this, const struct vec & v)
{
  struct vec D.103227;
  struct vec & D.105655;

  D.103227 = *v;
  *this = glm::detail::compute_vec4_add<float, (glm::qualifier)0, false>::call (this, &D.103227);
  D.105655 = this;
  goto <D.105657>;
  <D.105657>:
  D.103227 = {CLOBBER};
  goto <D.105656>;
  <D.105656>:
  return D.105655;
}



;; Function glm::detail::compute_vec4_add<float, (glm::qualifier)0, false>::call (_ZN3glm6detail16compute_vec4_addIfLNS_9qualifierE0ELb0EE4callERKNS_3vecILi4EfLS2_0EEES7_, funcdef_no=3909, decl_uid=103223, cgraph_uid=1247, symbol_order=1251)

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
  goto <D.105659>;
  <D.105659>:
  return <retval>;
}



;; Function glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (_ZNK3glm3matILi4ELi4EfLNS_9qualifierE0EEixEi, funcdef_no=3536, decl_uid=97337, cgraph_uid=877, symbol_order=879)

glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (const struct mat * const this, length_type i)
{
  const struct col_type & D.105665;
  bool iftmp.58;

  _1 = glm::mat<4, 4, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105661>; else goto <D.105664>;
  <D.105664>:
  _assert ("i < this->length()", "C:/glm/glm/detail/type_mat4x4.inl", 298);
  if (0 != 0) goto <D.105661>; else goto <D.105662>;
  <D.105661>:
  iftmp.58 = 1;
  goto <D.105663>;
  <D.105662>:
  iftmp.58 = 0;
  <D.105663>:
  D.105665 = &this->value[i];
  goto <D.105666>;
  <D.105666>:
  return D.105665;
}



;; Function glm::mat<4, 4, float, (glm::qualifier)0>::length (_ZN3glm3matILi4ELi4EfLNS_9qualifierE0EE6lengthEv, funcdef_no=3537, decl_uid=97333, cgraph_uid=876, symbol_order=878)

glm::mat<4, 4, float, (glm::qualifier)0>::length ()
{
  length_type D.105667;

  D.105667 = 4;
  goto <D.105668>;
  <D.105668>:
  return D.105667;
}



;; Function glm::vec<3, float, (glm::qualifier)0>::vec (_ZN3glm3vecILi3EfLNS_9qualifierE0EEC1Efff, funcdef_no=3558, decl_uid=96468, cgraph_uid=898, symbol_order=902)

glm::vec<3, float, (glm::qualifier)0>::vec (struct vec * const this, float _x, float _y, float _z)
{
  MEM[(struct  &)this] = {CLOBBER};
  this->D.95554.x = _x;
  this->D.95560.y = _y;
  this->D.95566.z = _z;
  return;
}



;; Function glm::translate<float, (glm::qualifier)0> (_ZN3glm9translateIfLNS_9qualifierE0EEENS_3matILi4ELi4ET_XT0_EEERKS4_RKNS_3vecILi3ES3_XT0_EEE, funcdef_no=3906, decl_uid=100871, cgraph_uid=1250, symbol_order=1254)

glm::translate<float, (glm::qualifier)0> (const struct mat & m, const struct vec & v)
{
  struct col_type & D.105679;
  const struct col_type & D.105678;
  const float & D.105677;
  const struct col_type & D.105676;
  const float & D.105675;
  const struct col_type & D.105674;
  const float & D.105673;
  const struct col_type & D.105672;
  struct mat Result [value-expr: <retval>];
  struct col_type & D.105670;
  struct vec D.103208;
  struct vec D.103209;
  struct vec D.103210;
  struct vec D.103211;
  struct vec D.103232;

  <retval> = *m;
  D.105672 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 3);
  _1 = D.105672;
  D.105673 = glm::vec<3, float, (glm::qualifier)0>::operator[] (v, 2);
  _2 = D.105673;
  D.105674 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 2);
  _3 = D.105674;
  D.103211 = glm::operator*<float, (glm::qualifier)0> (_3, _2); [return slot optimization]
  D.105675 = glm::vec<3, float, (glm::qualifier)0>::operator[] (v, 1);
  _4 = D.105675;
  D.105676 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 1);
  _5 = D.105676;
  D.103209 = glm::operator*<float, (glm::qualifier)0> (_5, _4); [return slot optimization]
  D.105677 = glm::vec<3, float, (glm::qualifier)0>::operator[] (v, 0);
  _6 = D.105677;
  D.105678 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _7 = D.105678;
  D.103208 = glm::operator*<float, (glm::qualifier)0> (_7, _6); [return slot optimization]
  D.103210 = glm::operator+<float, (glm::qualifier)0> (&D.103208, &D.103209); [return slot optimization]
  D.103232 = glm::operator+<float, (glm::qualifier)0> (&D.103210, &D.103211); [return slot optimization]
  D.105679 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 3);
  D.105670 = D.105679;
  *D.105670 = glm::operator+<float, (glm::qualifier)0> (&D.103232, _1);
  D.103232 = {CLOBBER};
  D.103210 = {CLOBBER};
  D.103208 = {CLOBBER};
  D.103209 = {CLOBBER};
  D.103211 = {CLOBBER};
  goto <D.105671>;
  <D.105671>:
  return <retval>;
  <D.105680>:
  D.103232 = {CLOBBER};
  resx 5
  <D.105681>:
  D.103210 = {CLOBBER};
  resx 4
  <D.105682>:
  D.103208 = {CLOBBER};
  resx 3
  <D.105683>:
  D.103209 = {CLOBBER};
  resx 2
  <D.105684>:
  D.103211 = {CLOBBER};
  resx 1
}



;; Function glm::vec<3, float, (glm::qualifier)0>::operator[] (_ZNK3glm3vecILi3EfLNS_9qualifierE0EEixEi, funcdef_no=3897, decl_uid=95576, cgraph_uid=1239, symbol_order=1243)

glm::vec<3, float, (glm::qualifier)0>::operator[] (const struct vec * const this, length_type i)
{
  const float & D.105691;
  bool iftmp.59;

  if (i >= 0) goto <D.105690>; else goto <D.105686>;
  <D.105690>:
  _1 = glm::vec<3, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105687>; else goto <D.105686>;
  <D.105686>:
  _assert ("i >= 0 && i < this->length()", "C:/glm/glm/detail/type_vec3.inl", 186);
  if (0 != 0) goto <D.105687>; else goto <D.105688>;
  <D.105687>:
  iftmp.59 = 1;
  goto <D.105689>;
  <D.105688>:
  iftmp.59 = 0;
  <D.105689>:
  switch (i) <default: <D.103139>, case 0: <D.103140>, case 1: <D.103141>, case 2: <D.103142>>
  <D.103139>:
  <D.103140>:
  D.105691 = &this->D.95554.x;
  goto <D.105692>;
  <D.103141>:
  D.105691 = &this->D.95560.y;
  goto <D.105692>;
  <D.103142>:
  D.105691 = &this->D.95566.z;
  goto <D.105692>;
  <D.105692>:
  return D.105691;
}



;; Function glm::radians<float> (_ZN3glm7radiansIfEET_S1_, funcdef_no=3555, decl_uid=100834, cgraph_uid=895, symbol_order=899)

glm::radians<float> (float degrees)
{
  float D.105693;

  D.105693 = degrees * 1.745329238474369049072265625e-2;
  goto <D.105694>;
  <D.105694>:
  return D.105693;
}



;; Function glm::perspective<float> (_ZN3glm11perspectiveIfEENS_3matILi4ELi4ET_LNS_9qualifierE0EEES2_S2_S2_S2_, funcdef_no=3910, decl_uid=100875, cgraph_uid=1251, symbol_order=1255)

glm::perspective<float> (float fovy, float aspect, float zNear, float zFar)
{
  <retval> = glm::perspectiveRH_NO<float> (fovy, aspect, zNear, zFar); [return slot optimization]
  goto <D.105696>;
  <D.105696>:
  return <retval>;
}



;; Function glm::perspectiveRH_NO<float> (_ZN3glm16perspectiveRH_NOIfEENS_3matILi4ELi4ET_LNS_9qualifierE0EEES2_S2_S2_S2_, funcdef_no=4074, decl_uid=103236, cgraph_uid=1415, symbol_order=1419)

glm::perspectiveRH_NO<float> (float fovy, float aspect, float zNear, float zFar)
{
  float & D.105714;
  struct col_type & D.105713;
  float & D.105712;
  struct col_type & D.105711;
  float & D.105710;
  struct col_type & D.105709;
  float & D.105708;
  struct col_type & D.105707;
  float & D.105706;
  struct col_type & D.105705;
  float D.105704;
  struct mat Result [value-expr: <retval>];
  const float tanHalfFovy;
  bool iftmp.60;

  _1 = std::numeric_limits<float>::epsilon ();
  _2 = aspect - _1;
  D.105704 = glm::abs<float> (_2);
  _3 = D.105704;
  if (_3 > 0.0) goto <D.105699>; else goto <D.105702>;
  <D.105702>:
  _assert ("abs(aspect - std::numeric_limits<T>::epsilon()) > static_cast<T>(0)", "C:/glm/glm/ext/matrix_clip_space.inl", 251);
  if (0 != 0) goto <D.105699>; else goto <D.105700>;
  <D.105699>:
  iftmp.60 = 1;
  goto <D.105701>;
  <D.105700>:
  iftmp.60 = 0;
  <D.105701>:
  _4 = fovy / 2.0e+0;
  _5 = std::tan (_4);
  tanHalfFovy = _5;
  <retval> = {};
  tanHalfFovy.61_6 = tanHalfFovy;
  _7 = aspect * tanHalfFovy.61_6;
  D.105705 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 0);
  _8 = D.105705;
  D.105706 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_8, 0);
  _9 = D.105706;
  _10 = 1.0e+0 / _7;
  *_9 = _10;
  tanHalfFovy.62_11 = tanHalfFovy;
  D.105707 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 1);
  _12 = D.105707;
  D.105708 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_12, 1);
  _13 = D.105708;
  _14 = 1.0e+0 / tanHalfFovy.62_11;
  *_13 = _14;
  _15 = zFar + zNear;
  _16 = -_15;
  _17 = zFar - zNear;
  D.105709 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 2);
  _18 = D.105709;
  D.105710 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_18, 2);
  _19 = D.105710;
  _20 = _16 / _17;
  *_19 = _20;
  D.105711 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 2);
  _21 = D.105711;
  D.105712 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_21, 3);
  _22 = D.105712;
  *_22 = -1.0e+0;
  _23 = zFar * 2.0e+0;
  _24 = zNear * _23;
  _25 = -_24;
  _26 = zFar - zNear;
  D.105713 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (&<retval>, 3);
  _27 = D.105713;
  D.105714 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_27, 2);
  _28 = D.105714;
  _29 = _25 / _26;
  *_28 = _29;
  goto <D.105716>;
  <D.105716>:
  tanHalfFovy = {CLOBBER};
  goto <D.105703>;
  <D.105703>:
  return <retval>;
  <D.105715>:
  tanHalfFovy = {CLOBBER};
  resx 1
}



;; Function std::numeric_limits<float>::epsilon (_ZNSt14numeric_limitsIfE7epsilonEv, funcdef_no=440, decl_uid=28156, cgraph_uid=336, symbol_order=336)

std::numeric_limits<float>::epsilon ()
{
  float D.105717;

  D.105717 = 1.1920928955078125e-7;
  goto <D.105718>;
  <D.105718>:
  return D.105717;
}



;; Function glm::abs<float> (_ZN3glm3absIfEET_S1_, funcdef_no=1755, decl_uid=59499, cgraph_uid=425, symbol_order=425)

glm::abs<float> (float x)
{
  float D.105719;

  D.105719 = glm::detail::compute_abs<float, true>::call (x);
  goto <D.105720>;
  <D.105720>:
  return D.105719;
}



;; Function glm::detail::compute_abs<float, true>::call (_ZN3glm6detail11compute_absIfLb1EE4callEf, funcdef_no=3606, decl_uid=59504, cgraph_uid=947, symbol_order=951)

glm::detail::compute_abs<float, true>::call (float x)
{
  float iftmp.63;
  float D.105721;

  if (x >= 0.0) goto <D.105723>; else goto <D.105724>;
  <D.105723>:
  iftmp.63 = x;
  goto <D.105725>;
  <D.105724>:
  iftmp.63 = -x;
  <D.105725>:
  D.105721 = iftmp.63;
  goto <D.105726>;
  <D.105726>:
  return D.105721;
}



;; Function std::tan (_ZSt3tanf, funcdef_no=110, decl_uid=23463, cgraph_uid=72, symbol_order=72)

std::tan (float __x)
{
  float D.105727;

  D.105727 = __builtin_tanf (__x);
  goto <D.105728>;
  <D.105728>:
  return D.105727;
}



;; Function glm::value_ptr<float, (glm::qualifier)0> (_ZN3glm9value_ptrIfLNS_9qualifierE0EEEPT_RNS_3matILi4ELi4ES2_XT0_EEE, funcdef_no=3911, decl_uid=100883, cgraph_uid=1252, symbol_order=1256)

glm::value_ptr<float, (glm::qualifier)0> (struct mat & m)
{
  struct col_type & D.105731;
  float * D.105729;

  D.105731 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (m, 0);
  _1 = D.105731;
  D.105729 = &_1->D.51351.x;
  goto <D.105730>;
  <D.105730>:
  return D.105729;
}



;; Function glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (_ZN3glm3matILi4ELi4EfLNS_9qualifierE0EEixEi, funcdef_no=3912, decl_uid=97334, cgraph_uid=1253, symbol_order=1257)

glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (struct mat * const this, length_type i)
{
  struct col_type & D.105737;
  bool iftmp.64;

  _1 = glm::mat<4, 4, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105733>; else goto <D.105736>;
  <D.105736>:
  _assert ("i < this->length()", "C:/glm/glm/detail/type_mat4x4.inl", 291);
  if (0 != 0) goto <D.105733>; else goto <D.105734>;
  <D.105733>:
  iftmp.64 = 1;
  goto <D.105735>;
  <D.105734>:
  iftmp.64 = 0;
  <D.105735>:
  D.105737 = &this->value[i];
  goto <D.105738>;
  <D.105738>:
  return D.105737;
}



;; Function glm::vec<4, float, (glm::qualifier)0>::operator[] (_ZN3glm3vecILi4EfLNS_9qualifierE0EEixEi, funcdef_no=3913, decl_uid=51376, cgraph_uid=1254, symbol_order=1258)

glm::vec<4, float, (glm::qualifier)0>::operator[] (struct vec * const this, length_type i)
{
  float & D.105745;
  bool iftmp.65;

  if (i >= 0) goto <D.105744>; else goto <D.105740>;
  <D.105744>:
  _1 = glm::vec<4, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105741>; else goto <D.105740>;
  <D.105740>:
  _assert ("i >= 0 && i < this->length()", "C:/glm/glm/detail/type_vec4.inl", 479);
  if (0 != 0) goto <D.105741>; else goto <D.105742>;
  <D.105741>:
  iftmp.65 = 1;
  goto <D.105743>;
  <D.105742>:
  iftmp.65 = 0;
  <D.105743>:
  switch (i) <default: <D.103245>, case 0: <D.103246>, case 1: <D.103247>, case 2: <D.103248>, case 3: <D.103249>>
  <D.103245>:
  <D.103246>:
  D.105745 = &this->D.51351.x;
  goto <D.105746>;
  <D.103247>:
  D.105745 = &this->D.51357.y;
  goto <D.105746>;
  <D.103248>:
  D.105745 = &this->D.51363.z;
  goto <D.105746>;
  <D.103249>:
  D.105745 = &this->D.51369.w;
  goto <D.105746>;
  <D.105746>:
  return D.105745;
}



;; Function glm::vec<4, float, (glm::qualifier)0>::length (_ZN3glm3vecILi4EfLNS_9qualifierE0EE6lengthEv, funcdef_no=3900, decl_uid=51375, cgraph_uid=1240, symbol_order=1244)

glm::vec<4, float, (glm::qualifier)0>::length ()
{
  length_type D.105747;

  D.105747 = 4;
  goto <D.105748>;
  <D.105748>:
  return D.105747;
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
  char * D.105753;
  const char * iftmp.66;

  MEM[(struct  &)this] = {CLOBBER};
  _1 = &this->_M_dataplus;
  D.105753 = std::__cxx11::basic_string<char>::_M_local_data (this);
  _2 = D.105753;
  std::__cxx11::basic_string<char>::_Alloc_hider::_Alloc_hider (_1, _2, __a);
  if (__s != 0B) goto <D.105750>; else goto <D.105751>;
  <D.105750>:
  _3 = std::char_traits<char>::length (__s);
  iftmp.66 = __s + _3;
  goto <D.105752>;
  <D.105751>:
  iftmp.66 = __s + 18446744073709551615;
  <D.105752>:
  std::__cxx11::basic_string<char>::_M_construct<const char*> (this, __s, iftmp.66);
  return;
  <D.105754>:
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
  size_t D.105755;

  D.105755 = __builtin_strlen (__s);
  goto <D.105756>;
  <D.105756>:
  return D.105755;
}



;; Function std::__cxx11::basic_string<char>::_M_construct<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_, funcdef_no=3965, decl_uid=102619, cgraph_uid=1306, symbol_order=1310)

std::__cxx11::basic_string<char>::_M_construct<const char*> (struct basic_string * const this, const char * __beg, const char * __end)
{
  struct __false_type D.105757;
  struct _Integral D.103459;

  std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (this, __beg, __end, D.105757);
  D.103459 = {CLOBBER};
  return;
  <D.105758>:
  D.103459 = {CLOBBER};
  resx 1
}



;; Function std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE16_M_construct_auxIPKcEEvT_S8_St12__false_type, funcdef_no=4092, decl_uid=103493, cgraph_uid=1433, symbol_order=1437)

std::__cxx11::basic_string<char>::_M_construct_aux<const char*> (struct basic_string * const this, const char * __beg, const char * __end, struct __false_type D.103497)
{
  struct forward_iterator_tag D.105759;
  struct _Tag D.104022;
  struct forward_iterator_tag D.104042;

  _1 = &D.104022;
  std::__cxx11::basic_string<char>::_M_construct<const char*> (this, __beg, __end, D.105759);
  D.104022 = {CLOBBER};
  return;
  <D.105760>:
  D.104022 = {CLOBBER};
  resx 1
}



;; Function std::__cxx11::basic_string<char>::_M_construct<const char*> (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, funcdef_no=4150, decl_uid=104032, cgraph_uid=1491, symbol_order=1495)

std::__cxx11::basic_string<char>::_M_construct<const char*> (struct basic_string * const this, const char * __beg, const char * __end, struct forward_iterator_tag D.104036)
{
  char * D.105774;
  char * D.105773;
  long long int D.105772;
  size_type __dnew;
  bool iftmp.68;
  bool retval.67;

  _1 = __gnu_cxx::__is_null_pointer<const char> (__beg);
  if (_1 != 0) goto <D.105765>; else goto <D.105763>;
  <D.105765>:
  if (__beg != __end) goto <D.105766>; else goto <D.105763>;
  <D.105766>:
  iftmp.68 = 1;
  goto <D.105764>;
  <D.105763>:
  iftmp.68 = 0;
  <D.105764>:
  retval.67 = iftmp.68;
  if (retval.67 != 0) goto <D.105767>; else goto <D.105768>;
  <D.105767>:
  std::__throw_logic_error ("basic_string::_M_construct null not valid");
  <D.105768>:
  D.105772 = std::distance<const char*> (__beg, __end);
  _2 = D.105772;
  _3 = (long long unsigned int) _2;
  __dnew = _3;
  __dnew.69_4 = __dnew;
  if (__dnew.69_4 > 15) goto <D.105769>; else goto <D.105770>;
  <D.105769>:
  D.105773 = std::__cxx11::basic_string<char>::_M_create (this, &__dnew, 0);
  _5 = D.105773;
  std::__cxx11::basic_string<char>::_M_data (this, _5);
  __dnew.70_6 = __dnew;
  std::__cxx11::basic_string<char>::_M_capacity (this, __dnew.70_6);
  goto <D.105771>;
  <D.105770>:
  <D.105771>:
  D.105774 = std::__cxx11::basic_string<char>::_M_data (this);
  _7 = D.105774;
  std::__cxx11::basic_string<char>::_S_copy_chars (_7, __beg, __end);
  __dnew.71_9 = __dnew;
  std::__cxx11::basic_string<char>::_M_set_length (this, __dnew.71_9);
  __dnew = {CLOBBER};
  return;
  <D.105777>:
  eh_dispatch 2
  resx 2
  <D.105776>:
  _8 = __builtin_eh_pointer (2);
  __cxa_begin_catch (_8);
  std::__cxx11::basic_string<char>::_M_dispose (this);
  __cxa_rethrow ();
  <D.105775>:
  __cxa_end_catch ();
  resx 3
  <D.105778>:
  __dnew = {CLOBBER};
  resx 1
}



;; Function __gnu_cxx::__is_null_pointer<const char> (_ZN9__gnu_cxx17__is_null_pointerIKcEEbPT_, funcdef_no=4189, decl_uid=104392, cgraph_uid=1530, symbol_order=1534)

__gnu_cxx::__is_null_pointer<const char> (const char * __ptr)
{
  bool D.105779;

  D.105779 = __ptr == 0B;
  goto <D.105780>;
  <D.105780>:
  return D.105779;
}



;; Function std::distance<const char*> (_ZSt8distanceIPKcENSt15iterator_traitsIT_E15difference_typeES3_S3_, funcdef_no=4190, decl_uid=104395, cgraph_uid=1532, symbol_order=1536)

std::distance<const char*> (const char * __first, const char * __last)
{
  struct random_access_iterator_tag D.105782;
  struct iterator_category D.105182;
  difference_type D.105781;

  std::__iterator_category<const char*> (&__first);
  __first.72_1 = __first;
  D.105781 = std::__distance<const char*> (__first.72_1, __last, D.105782);
  goto <D.105784>;
  <D.105784>:
  D.105182 = {CLOBBER};
  goto <D.105783>;
  <D.105783>:
  return D.105781;
}



;; Function std::__iterator_category<const char*> (_ZSt19__iterator_categoryIPKcENSt15iterator_traitsIT_E17iterator_categoryERKS3_, funcdef_no=4191, decl_uid=105180, cgraph_uid=1531, symbol_order=1535)

std::__iterator_category<const char*> (const char * const & D.105181)
{
  struct iterator_category D.105785;

  goto <D.105786>;
  <D.105786>:
  return D.105785;
}



;; Function std::__distance<const char*> (_ZSt10__distanceIPKcENSt15iterator_traitsIT_E15difference_typeES3_S3_St26random_access_iterator_tag, funcdef_no=4234, decl_uid=105183, cgraph_uid=1575, symbol_order=1579)

std::__distance<const char*> (const char * __first, const char * __last, struct random_access_iterator_tag D.105186)
{
  difference_type D.105787;

  D.105787 = __last - __first;
  goto <D.105788>;
  <D.105788>:
  return D.105787;
}



;; Function std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev, funcdef_no=3685, decl_uid=73082, cgraph_uid=1025, symbol_order=1029)

std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (struct _Alloc_hider * const this)
{
  std::allocator<char>::~allocator (this);
  MEM[(struct  &)this] = {CLOBBER};
  <D.102009>:
  return;
}



;; Function Shader::setMat4 (_ZNK6Shader7setMat4ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERKN3glm3matILi4ELi4EfLNS8_9qualifierE0EEE, funcdef_no=3535, decl_uid=95310, cgraph_uid=878, symbol_order=880)

Shader::setMat4 (const struct Shader * const this, const struct string & name, const struct mat4 & mat)
{
  int D.105791;
  const float & D.105790;
  const struct col_type & D.105789;

  __glewUniformMatrix4fv.73_1 = __glewUniformMatrix4fv;
  D.105789 = glm::mat<4, 4, float, (glm::qualifier)0>::operator[] (mat, 0);
  _2 = D.105789;
  D.105790 = glm::vec<4, float, (glm::qualifier)0>::operator[] (_2, 0);
  _3 = D.105790;
  __glewGetUniformLocation.74_4 = __glewGetUniformLocation;
  _5 = std::__cxx11::basic_string<char>::c_str (name);
  _6 = this->ID;
  D.105791 = __glewGetUniformLocation.74_4 (_6, _5);
  _7 = D.105791;
  __glewUniformMatrix4fv.73_1 (_7, 1, 0, _3);
  return;
}



;; Function glm::vec<4, float, (glm::qualifier)0>::operator[] (_ZNK3glm3vecILi4EfLNS_9qualifierE0EEixEi, funcdef_no=3899, decl_uid=51379, cgraph_uid=1241, symbol_order=1245)

glm::vec<4, float, (glm::qualifier)0>::operator[] (const struct vec * const this, length_type i)
{
  const float & D.105798;
  bool iftmp.75;

  if (i >= 0) goto <D.105797>; else goto <D.105793>;
  <D.105797>:
  _1 = glm::vec<4, float, (glm::qualifier)0>::length ();
  if (i < _1) goto <D.105794>; else goto <D.105793>;
  <D.105793>:
  _assert ("i >= 0 && i < this->length()", "C:/glm/glm/detail/type_vec4.inl", 497);
  if (0 != 0) goto <D.105794>; else goto <D.105795>;
  <D.105794>:
  iftmp.75 = 1;
  goto <D.105796>;
  <D.105795>:
  iftmp.75 = 0;
  <D.105796>:
  switch (i) <default: <D.103146>, case 0: <D.103147>, case 1: <D.103148>, case 2: <D.103149>, case 3: <D.103150>>
  <D.103146>:
  <D.103147>:
  D.105798 = &this->D.51351.x;
  goto <D.105799>;
  <D.103148>:
  D.105798 = &this->D.51357.y;
  goto <D.105799>;
  <D.103149>:
  D.105798 = &this->D.51363.z;
  goto <D.105799>;
  <D.103150>:
  D.105798 = &this->D.51369.w;
  goto <D.105799>;
  <D.105799>:
  return D.105798;
}



;; Function std::__cxx11::basic_string<char>::~basic_string (_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED2Ev, funcdef_no=3686, decl_uid=72988, cgraph_uid=1027, symbol_order=1031)

std::__cxx11::basic_string<char>::~basic_string (struct basic_string * const this)
{
  std::__cxx11::basic_string<char>::_M_dispose (this);
  _1 = &this->_M_dataplus;
  std::__cxx11::basic_string<char>::_Alloc_hider::~_Alloc_hider (_1);
  MEM[(struct  &)this] = {CLOBBER};
  <D.102012>:
  return;
}



;; Function std::allocator<char>::~allocator (_ZNSaIcED2Ev, funcdef_no=3788, decl_uid=66534, cgraph_uid=1129, symbol_order=1133)

std::allocator<char>::~allocator (struct allocator * const this)
{
  __gnu_cxx::new_allocator<char>::~new_allocator (this);
  <D.102615>:
  return;
}



;; Function __gnu_cxx::new_allocator<char>::~new_allocator (_ZN9__gnu_cxx13new_allocatorIcED2Ev, funcdef_no=3960, decl_uid=66469, cgraph_uid=1301, symbol_order=1305)

__gnu_cxx::new_allocator<char>::~new_allocator (struct new_allocator * const this)
{
  <D.103420>:
  return;
}



;; Function processInput (_Z12processInputP10GLFWwindow, funcdef_no=3559, decl_uid=97937, cgraph_uid=900, symbol_order=904)

processInput (struct GLFWwindow * window)
{
  int D.105804;
  bool retval.76;

  D.105804 = glfwGetKey (window, 256);
  _1 = D.105804;
  retval.76 = _1 == 1;
  if (retval.76 != 0) goto <D.105801>; else goto <D.105802>;
  <D.105801>:
  glfwSetWindowShouldClose (window, 1);
  goto <D.105803>;
  <D.105802>:
  <D.105803>:
  return;
}



;; Function framebuffer_size_callback (_Z25framebuffer_size_callbackP10GLFWwindowii, funcdef_no=3560, decl_uid=97935, cgraph_uid=901, symbol_order=905)

framebuffer_size_callback (struct GLFWwindow * window, int width, int height)
{
  glViewport (0, 0, width, height);
  return;
}



;; Function __static_initialization_and_destruction_0 (_Z41__static_initialization_and_destruction_0ii, funcdef_no=4260, decl_uid=105354, cgraph_uid=1602, symbol_order=1702)

__static_initialization_and_destruction_0 (int __initialize_p, int __priority)
{
  if (__initialize_p == 1) goto <D.105805>; else goto <D.105806>;
  <D.105805>:
  if (__priority == 65535) goto <D.105807>; else goto <D.105808>;
  <D.105807>:
  std::ios_base::Init::Init (&__ioinit);
  atexit (__tcf_0);
  goto <D.105809>;
  <D.105808>:
  <D.105809>:
  goto <D.105810>;
  <D.105806>:
  <D.105810>:
  return;
}



;; Function __tcf_0 (__tcf_0, funcdef_no=4261, decl_uid=105358, cgraph_uid=1601, symbol_order=1701)

__tcf_0 ()
{
  std::ios_base::Init::~Init (&__ioinit);
  return;
}



;; Function _GLOBAL__sub_I_main (_GLOBAL__sub_I_main, funcdef_no=4262, decl_uid=105362, cgraph_uid=1603, symbol_order=2318)

_GLOBAL__sub_I_main ()
{
  __static_initialization_and_destruction_0 (1, 65535);
  return;
}


