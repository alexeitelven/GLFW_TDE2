
;; Function stbi__sse2_available (_ZL20stbi__sse2_availablev, funcdef_no=770, decl_uid=10013, cgraph_uid=676, symbol_order=676)

stbi__sse2_available ()
{
  int D.13428;

  D.13428 = 1;
  goto <D.13429>;
  <D.13429>:
  return D.13428;
}



;; Function stbi__start_mem (_ZL15stbi__start_memP13stbi__contextPKhi, funcdef_no=771, decl_uid=10037, cgraph_uid=677, symbol_order=677)

stbi__start_mem (struct stbi__context * s, const stbi_uc * buffer, int len)
{
  s->io.read = 0B;
  s->read_from_callbacks = 0;
  s->callback_already_read = 0;
  s->img_buffer_original = buffer;
  _1 = s->img_buffer_original;
  s->img_buffer = _1;
  _2 = (sizetype) len;
  _3 = buffer + _2;
  s->img_buffer_original_end = _3;
  _4 = s->img_buffer_original_end;
  s->img_buffer_end = _4;
  return;
}



;; Function stbi__start_callbacks (_ZL21stbi__start_callbacksP13stbi__contextP17stbi_io_callbacksPv, funcdef_no=772, decl_uid=10042, cgraph_uid=678, symbol_order=678)

stbi__start_callbacks (struct stbi__context * s, struct stbi_io_callbacks * c, void * user)
{
  s->io = MEM[(const struct stbi_io_callbacks &)c];
  s->io_user_data = user;
  s->buflen = 128;
  s->read_from_callbacks = 1;
  s->callback_already_read = 0;
  _1 = &s->buffer_start;
  s->img_buffer_original = _1;
  _2 = s->img_buffer_original;
  s->img_buffer = _2;
  stbi__refill_buffer (s);
  _3 = s->img_buffer_end;
  s->img_buffer_original_end = _3;
  return;
}



;; Function stbi__stdio_read (_ZL16stbi__stdio_readPvPci, funcdef_no=773, decl_uid=10053, cgraph_uid=679, symbol_order=679)

stbi__stdio_read (void * user, char * data, int size)
{
  long long unsigned int D.13432;
  int D.13430;

  _1 = (long long unsigned int) size;
  D.13432 = fread (data, 1, _1, user);
  _2 = D.13432;
  D.13430 = (int) _2;
  goto <D.13431>;
  <D.13431>:
  return D.13430;
}



;; Function stbi__stdio_skip (_ZL16stbi__stdio_skipPvi, funcdef_no=774, decl_uid=10057, cgraph_uid=680, symbol_order=680)

stbi__stdio_skip (void * user, int n)
{
  int D.13436;
  int ch;

  fseek (user, n, 1);
  D.13436 = fgetc (user);
  ch = D.13436;
  if (ch != -1) goto <D.13433>; else goto <D.13434>;
  <D.13433>:
  ungetc (ch, user);
  goto <D.13435>;
  <D.13434>:
  <D.13435>:
  return;
}



;; Function stbi__stdio_eof (_ZL15stbi__stdio_eofPv, funcdef_no=775, decl_uid=10061, cgraph_uid=681, symbol_order=681)

stbi__stdio_eof (void * user)
{
  bool iftmp.0;
  int D.13437;

  _1 = feof (user);
  if (_1 != 0) goto <D.13439>; else goto <D.13442>;
  <D.13442>:
  _2 = ferror (user);
  if (_2 != 0) goto <D.13439>; else goto <D.13440>;
  <D.13439>:
  iftmp.0 = 1;
  goto <D.13441>;
  <D.13440>:
  iftmp.0 = 0;
  <D.13441>:
  D.13437 = (int) iftmp.0;
  goto <D.13443>;
  <D.13443>:
  return D.13437;
}



;; Function stbi__start_file (_ZL16stbi__start_fileP13stbi__contextP6_iobuf, funcdef_no=776, decl_uid=10099, cgraph_uid=682, symbol_order=683)

stbi__start_file (struct stbi__context * s, struct FILE * f)
{
  stbi__start_callbacks (s, &stbi__stdio_callbacks, f);
  return;
}



;; Function stbi__rewind (_ZL12stbi__rewindP13stbi__context, funcdef_no=777, decl_uid=10102, cgraph_uid=683, symbol_order=684)

stbi__rewind (struct stbi__context * s)
{
  _1 = s->img_buffer_original;
  s->img_buffer = _1;
  _2 = s->img_buffer_original_end;
  s->img_buffer_end = _2;
  return;
}



;; Function stbi_failure_reason (stbi_failure_reason, funcdef_no=778, decl_uid=5072, cgraph_uid=684, symbol_order=686)

stbi_failure_reason ()
{
  const char * D.13444;

  D.13444 = stbi__g_failure_reason;
  goto <D.13445>;
  <D.13445>:
  return D.13444;
}



;; Function stbi__err (_ZL9stbi__errPKc, funcdef_no=779, decl_uid=10256, cgraph_uid=685, symbol_order=687)

stbi__err (const char * str)
{
  int D.13446;

  stbi__g_failure_reason = str;
  D.13446 = 0;
  goto <D.13447>;
  <D.13447>:
  return D.13446;
}



;; Function stbi__malloc (_ZL12stbi__mallocy, funcdef_no=780, decl_uid=10259, cgraph_uid=686, symbol_order=688)

stbi__malloc (size_t size)
{
  void * D.13448;

  D.13448 = malloc (size);
  goto <D.13449>;
  <D.13449>:
  return D.13448;
}



;; Function stbi__addsizes_valid (_ZL20stbi__addsizes_validii, funcdef_no=781, decl_uid=10263, cgraph_uid=687, symbol_order=689)

stbi__addsizes_valid (int a, int b)
{
  int D.13452;

  if (b < 0) goto <D.13450>; else goto <D.13451>;
  <D.13450>:
  D.13452 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13453>;
  <D.13451>:
  _1 = 2147483647 - b;
  _2 = a <= _1;
  D.13452 = (int) _2;
  goto <D.13453>;
  <D.13453>:
  return D.13452;
}



;; Function stbi__mul2sizes_valid (_ZL21stbi__mul2sizes_validii, funcdef_no=782, decl_uid=10267, cgraph_uid=688, symbol_order=690)

stbi__mul2sizes_valid (int a, int b)
{
  int D.13457;

  if (a < 0) goto <D.13454>; else goto <D.13456>;
  <D.13456>:
  if (b < 0) goto <D.13454>; else goto <D.13455>;
  <D.13454>:
  D.13457 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13460>;
  <D.13455>:
  if (b == 0) goto <D.13458>; else goto <D.13459>;
  <D.13458>:
  D.13457 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13460>;
  <D.13459>:
  _1 = 2147483647 / b;
  _2 = a <= _1;
  D.13457 = (int) _2;
  goto <D.13460>;
  <D.13460>:
  return D.13457;
}



;; Function stbi__mad2sizes_valid (_ZL21stbi__mad2sizes_validiii, funcdef_no=783, decl_uid=10272, cgraph_uid=689, symbol_order=691)

stbi__mad2sizes_valid (int a, int b, int add)
{
  bool iftmp.1;
  int D.13461;

  _1 = stbi__mul2sizes_valid (a, b);
  if (_1 != 0) goto <D.13465>; else goto <D.13463>;
  <D.13465>:
  _2 = a * b;
  _3 = stbi__addsizes_valid (_2, add);
  if (_3 != 0) goto <D.13466>; else goto <D.13463>;
  <D.13466>:
  iftmp.1 = 1;
  goto <D.13464>;
  <D.13463>:
  iftmp.1 = 0;
  <D.13464>:
  D.13461 = (int) iftmp.1;
  goto <D.13467>;
  <D.13467>:
  return D.13461;
}



;; Function stbi__mad3sizes_valid (_ZL21stbi__mad3sizes_validiiii, funcdef_no=784, decl_uid=10278, cgraph_uid=690, symbol_order=692)

stbi__mad3sizes_valid (int a, int b, int c, int add)
{
  bool iftmp.2;
  int D.13468;

  _1 = stbi__mul2sizes_valid (a, b);
  if (_1 != 0) goto <D.13472>; else goto <D.13470>;
  <D.13472>:
  _2 = a * b;
  _3 = stbi__mul2sizes_valid (_2, c);
  if (_3 != 0) goto <D.13473>; else goto <D.13470>;
  <D.13473>:
  _4 = a * b;
  _5 = c * _4;
  _6 = stbi__addsizes_valid (_5, add);
  if (_6 != 0) goto <D.13474>; else goto <D.13470>;
  <D.13474>:
  iftmp.2 = 1;
  goto <D.13471>;
  <D.13470>:
  iftmp.2 = 0;
  <D.13471>:
  D.13468 = (int) iftmp.2;
  goto <D.13475>;
  <D.13475>:
  return D.13468;
}



;; Function stbi__mad4sizes_valid (_ZL21stbi__mad4sizes_validiiiii, funcdef_no=785, decl_uid=10285, cgraph_uid=691, symbol_order=693)

stbi__mad4sizes_valid (int a, int b, int c, int d, int add)
{
  bool iftmp.3;
  int D.13476;

  _1 = stbi__mul2sizes_valid (a, b);
  if (_1 != 0) goto <D.13480>; else goto <D.13478>;
  <D.13480>:
  _2 = a * b;
  _3 = stbi__mul2sizes_valid (_2, c);
  if (_3 != 0) goto <D.13481>; else goto <D.13478>;
  <D.13481>:
  _4 = a * b;
  _5 = c * _4;
  _6 = stbi__mul2sizes_valid (_5, d);
  if (_6 != 0) goto <D.13482>; else goto <D.13478>;
  <D.13482>:
  _7 = a * b;
  _8 = c * _7;
  _9 = d * _8;
  _10 = stbi__addsizes_valid (_9, add);
  if (_10 != 0) goto <D.13483>; else goto <D.13478>;
  <D.13483>:
  iftmp.3 = 1;
  goto <D.13479>;
  <D.13478>:
  iftmp.3 = 0;
  <D.13479>:
  D.13476 = (int) iftmp.3;
  goto <D.13484>;
  <D.13484>:
  return D.13476;
}



;; Function stbi__malloc_mad2 (_ZL17stbi__malloc_mad2iii, funcdef_no=786, decl_uid=10290, cgraph_uid=692, symbol_order=694)

stbi__malloc_mad2 (int a, int b, int add)
{
  void * D.13488;
  bool retval.4;

  _1 = stbi__mad2sizes_valid (a, b, add);
  retval.4 = _1 == 0;
  if (retval.4 != 0) goto <D.13486>; else goto <D.13487>;
  <D.13486>:
  D.13488 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13489>;
  <D.13487>:
  _2 = a * b;
  _3 = add + _2;
  _4 = (long long unsigned int) _3;
  D.13488 = stbi__malloc (_4);
  goto <D.13489>;
  <D.13489>:
  return D.13488;
}



;; Function stbi__malloc_mad3 (_ZL17stbi__malloc_mad3iiii, funcdef_no=787, decl_uid=10296, cgraph_uid=693, symbol_order=695)

stbi__malloc_mad3 (int a, int b, int c, int add)
{
  void * D.13493;
  bool retval.5;

  _1 = stbi__mad3sizes_valid (a, b, c, add);
  retval.5 = _1 == 0;
  if (retval.5 != 0) goto <D.13491>; else goto <D.13492>;
  <D.13491>:
  D.13493 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13494>;
  <D.13492>:
  _2 = a * b;
  _3 = c * _2;
  _4 = add + _3;
  _5 = (long long unsigned int) _4;
  D.13493 = stbi__malloc (_5);
  goto <D.13494>;
  <D.13494>:
  return D.13493;
}



;; Function stbi__malloc_mad4 (_ZL17stbi__malloc_mad4iiiii, funcdef_no=788, decl_uid=10303, cgraph_uid=694, symbol_order=696)

stbi__malloc_mad4 (int a, int b, int c, int d, int add)
{
  void * D.13498;
  bool retval.6;

  _1 = stbi__mad4sizes_valid (a, b, c, d, add);
  retval.6 = _1 == 0;
  if (retval.6 != 0) goto <D.13496>; else goto <D.13497>;
  <D.13496>:
  D.13498 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13499>;
  <D.13497>:
  _2 = a * b;
  _3 = c * _2;
  _4 = d * _3;
  _5 = add + _4;
  _6 = (long long unsigned int) _5;
  D.13498 = stbi__malloc (_6);
  goto <D.13499>;
  <D.13499>:
  return D.13498;
}



;; Function stbi_image_free (stbi_image_free, funcdef_no=789, decl_uid=5074, cgraph_uid=695, symbol_order=697)

stbi_image_free (void * retval_from_stbi_load)
{
  free (retval_from_stbi_load);
  return;
}



;; Function stbi_set_flip_vertically_on_load (stbi_set_flip_vertically_on_load, funcdef_no=790, decl_uid=5112, cgraph_uid=696, symbol_order=699)

stbi_set_flip_vertically_on_load (int flag_true_if_should_flip)
{
  stbi__vertically_flip_on_load_global = flag_true_if_should_flip;
  return;
}



;; Function stbi_set_flip_vertically_on_load_thread (stbi_set_flip_vertically_on_load_thread, funcdef_no=791, decl_uid=5114, cgraph_uid=697, symbol_order=702)

stbi_set_flip_vertically_on_load_thread (int flag_true_if_should_flip)
{
  stbi__vertically_flip_on_load_local = flag_true_if_should_flip;
  stbi__vertically_flip_on_load_set = 1;
  return;
}



;; Function stbi__load_main (_ZL15stbi__load_mainP13stbi__contextPiS1_S1_iP17stbi__result_infoi, funcdef_no=792, decl_uid=10334, cgraph_uid=698, symbol_order=703)

stbi__load_main (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri, int bpc)
{
  void * D.13550;
  int D.13549;
  float * D.13548;
  int D.13547;
  void * D.13546;
  int D.13545;
  void * D.13544;
  int D.13543;
  void * D.13542;
  int D.13541;
  void * D.13540;
  int D.13539;
  void * D.13538;
  int D.13537;
  void * D.13536;
  int D.13535;
  void * D.13534;
  int D.13533;
  float * hdr;
  bool retval.16;
  int iftmp.15;
  bool retval.14;
  bool retval.13;
  bool retval.12;
  bool retval.11;
  bool retval.10;
  bool retval.9;
  bool retval.8;
  void * D.13503;
  bool retval.7;

  memset (ri, 0, 12);
  ri->bits_per_channel = 8;
  ri->channel_order = 0;
  ri->num_channels = 0;
  D.13533 = stbi__jpeg_test (s);
  _1 = D.13533;
  retval.7 = _1 != 0;
  if (retval.7 != 0) goto <D.13501>; else goto <D.13502>;
  <D.13501>:
  D.13534 = stbi__jpeg_load (s, x, y, comp, req_comp, ri);
  D.13503 = D.13534;
  goto <D.13532>;
  <D.13502>:
  D.13535 = stbi__png_test (s);
  _2 = D.13535;
  retval.8 = _2 != 0;
  if (retval.8 != 0) goto <D.13505>; else goto <D.13506>;
  <D.13505>:
  D.13536 = stbi__png_load (s, x, y, comp, req_comp, ri);
  D.13503 = D.13536;
  goto <D.13532>;
  <D.13506>:
  D.13537 = stbi__bmp_test (s);
  _3 = D.13537;
  retval.9 = _3 != 0;
  if (retval.9 != 0) goto <D.13508>; else goto <D.13509>;
  <D.13508>:
  D.13538 = stbi__bmp_load (s, x, y, comp, req_comp, ri);
  D.13503 = D.13538;
  goto <D.13532>;
  <D.13509>:
  D.13539 = stbi__gif_test (s);
  _4 = D.13539;
  retval.10 = _4 != 0;
  if (retval.10 != 0) goto <D.13511>; else goto <D.13512>;
  <D.13511>:
  D.13540 = stbi__gif_load (s, x, y, comp, req_comp, ri);
  D.13503 = D.13540;
  goto <D.13532>;
  <D.13512>:
  D.13541 = stbi__psd_test (s);
  _5 = D.13541;
  retval.11 = _5 != 0;
  if (retval.11 != 0) goto <D.13514>; else goto <D.13515>;
  <D.13514>:
  D.13542 = stbi__psd_load (s, x, y, comp, req_comp, ri, bpc);
  D.13503 = D.13542;
  goto <D.13532>;
  <D.13515>:
  D.13543 = stbi__pic_test (s);
  _6 = D.13543;
  retval.12 = _6 != 0;
  if (retval.12 != 0) goto <D.13517>; else goto <D.13518>;
  <D.13517>:
  D.13544 = stbi__pic_load (s, x, y, comp, req_comp, ri);
  D.13503 = D.13544;
  goto <D.13532>;
  <D.13518>:
  D.13545 = stbi__pnm_test (s);
  _7 = D.13545;
  retval.13 = _7 != 0;
  if (retval.13 != 0) goto <D.13520>; else goto <D.13521>;
  <D.13520>:
  D.13546 = stbi__pnm_load (s, x, y, comp, req_comp, ri);
  D.13503 = D.13546;
  goto <D.13532>;
  <D.13521>:
  D.13547 = stbi__hdr_test (s);
  _8 = D.13547;
  retval.14 = _8 != 0;
  if (retval.14 != 0) goto <D.13523>; else goto <D.13524>;
  <D.13523>:
  D.13548 = stbi__hdr_load (s, x, y, comp, req_comp, ri);
  hdr = D.13548;
  if (req_comp == 0) goto <D.13526>; else goto <D.13527>;
  <D.13526>:
  iftmp.15 = *comp;
  goto <D.13528>;
  <D.13527>:
  iftmp.15 = req_comp;
  <D.13528>:
  _9 = *y;
  _10 = *x;
  D.13503 = stbi__hdr_to_ldr (hdr, _10, _9, iftmp.15);
  goto <D.13532>;
  <D.13524>:
  D.13549 = stbi__tga_test (s);
  _11 = D.13549;
  retval.16 = _11 != 0;
  if (retval.16 != 0) goto <D.13530>; else goto <D.13531>;
  <D.13530>:
  D.13550 = stbi__tga_load (s, x, y, comp, req_comp, ri);
  D.13503 = D.13550;
  goto <D.13532>;
  <D.13531>:
  stbi__err ("unknown image type");
  D.13503 = 0B;
  goto <D.13532>;
  <D.13532>:
  return D.13503;
}



;; Function stbi__convert_16_to_8 (_ZL21stbi__convert_16_to_8Ptiii, funcdef_no=793, decl_uid=10371, cgraph_uid=699, symbol_order=704)

stbi__convert_16_to_8 (stbi__uint16 * orig, int w, int h, int channels)
{
  stbi_uc * reduced;
  int img_len;
  int i;
  stbi_uc * D.13553;

  _1 = w * h;
  img_len = channels * _1;
  _2 = (long long unsigned int) img_len;
  reduced = stbi__malloc (_2);
  if (reduced == 0B) goto <D.13551>; else goto <D.13552>;
  <D.13551>:
  stbi__err ("outofmem");
  D.13553 = 0B;
  goto <D.13556>;
  <D.13552>:
  i = 0;
  <D.13554>:
  if (i >= img_len) goto <D.10376>; else goto <D.13555>;
  <D.13555>:
  _3 = (long long unsigned int) i;
  _4 = _3 * 2;
  _5 = orig + _4;
  _6 = *_5;
  _7 = _6 >> 8;
  _8 = (sizetype) i;
  _9 = reduced + _8;
  _10 = (unsigned char) _7;
  *_9 = _10;
  i = i + 1;
  goto <D.13554>;
  <D.10376>:
  free (orig);
  D.13553 = reduced;
  goto <D.13556>;
  <D.13556>:
  return D.13553;
}



;; Function stbi__convert_8_to_16 (_ZL21stbi__convert_8_to_16Phiii, funcdef_no=794, decl_uid=10382, cgraph_uid=700, symbol_order=705)

stbi__convert_8_to_16 (stbi_uc * orig, int w, int h, int channels)
{
  stbi__uint16 * enlarged;
  int img_len;
  int i;
  stbi__uint16 * D.13559;

  _1 = w * h;
  img_len = channels * _1;
  _2 = img_len * 2;
  _3 = (long long unsigned int) _2;
  enlarged = stbi__malloc (_3);
  if (enlarged == 0B) goto <D.13557>; else goto <D.13558>;
  <D.13557>:
  stbi__err ("outofmem");
  D.13559 = 0B;
  goto <D.13562>;
  <D.13558>:
  i = 0;
  <D.13560>:
  if (i >= img_len) goto <D.10387>; else goto <D.13561>;
  <D.13561>:
  _4 = (sizetype) i;
  _5 = orig + _4;
  _6 = *_5;
  _7 = (short unsigned int) _6;
  _8 = _7 << 8;
  _9 = (sizetype) i;
  _10 = orig + _9;
  _11 = *_10;
  _12 = (short unsigned int) _11;
  _13 = (long long unsigned int) i;
  _14 = _13 * 2;
  _15 = enlarged + _14;
  _16 = _8 + _12;
  *_15 = _16;
  i = i + 1;
  goto <D.13560>;
  <D.10387>:
  free (orig);
  D.13559 = enlarged;
  goto <D.13562>;
  <D.13562>:
  return D.13559;
}



;; Function stbi__vertical_flip (_ZL19stbi__vertical_flipPviii, funcdef_no=795, decl_uid=10393, cgraph_uid=701, symbol_order=706)

stbi__vertical_flip (void * image, int w, int h, int bytes_per_pixel)
{
  size_t bytes_copy;
  size_t bytes_left;
  stbi_uc * row1;
  stbi_uc * row0;
  stbi_uc * bytes;
  stbi_uc temp[2048];
  size_t bytes_per_row;
  int row;

  _1 = (long long unsigned int) w;
  _2 = (long long unsigned int) bytes_per_pixel;
  bytes_per_row = _1 * _2;
  bytes = image;
  row = 0;
  <D.13563>:
  _3 = h >> 1;
  if (row >= _3) goto <D.10403>; else goto <D.13564>;
  <D.13564>:
  _4 = (long long unsigned int) row;
  _5 = bytes_per_row * _4;
  row0 = bytes + _5;
  _6 = h - row;
  _7 = _6 + -1;
  _8 = (long long unsigned int) _7;
  _9 = bytes_per_row * _8;
  row1 = bytes + _9;
  bytes_left = bytes_per_row;
  <D.13565>:
  if (bytes_left == 0) goto <D.10405>; else goto <D.13566>;
  <D.13566>:
  bytes_copy = MIN_EXPR <bytes_left, 2048>;
  memcpy (&temp, row0, bytes_copy);
  memcpy (row0, row1, bytes_copy);
  memcpy (row1, &temp, bytes_copy);
  row0 = row0 + bytes_copy;
  row1 = row1 + bytes_copy;
  bytes_left = bytes_left - bytes_copy;
  goto <D.13565>;
  <D.10405>:
  row = row + 1;
  goto <D.13563>;
  <D.10403>:
  temp = {CLOBBER};
  return;
}



;; Function stbi__vertical_flip_slices (_ZL26stbi__vertical_flip_slicesPviiii, funcdef_no=796, decl_uid=10412, cgraph_uid=702, symbol_order=707)

stbi__vertical_flip_slices (void * image, int w, int h, int z, int bytes_per_pixel)
{
  stbi_uc * bytes;
  int slice_size;
  int slice;

  _1 = w * h;
  slice_size = bytes_per_pixel * _1;
  bytes = image;
  slice = 0;
  <D.13567>:
  if (slice >= z) goto <D.10417>; else goto <D.13568>;
  <D.13568>:
  stbi__vertical_flip (bytes, w, h, bytes_per_pixel);
  _2 = (sizetype) slice_size;
  bytes = bytes + _2;
  slice = slice + 1;
  goto <D.13567>;
  <D.10417>:
  return;
}



;; Function stbi__load_and_postprocess_8bit (_ZL31stbi__load_and_postprocess_8bitP13stbi__contextPiS1_S1_i, funcdef_no=797, decl_uid=10424, cgraph_uid=703, symbol_order=708)

stbi__load_and_postprocess_8bit (struct stbi__context * s, int * x, int * y, int * comp, int req_comp)
{
  void * D.13597;
  int channels;
  void * result;
  struct stbi__result_info ri;
  int iftmp.23;
  bool iftmp.19;
  int iftmp.18;
  bool iftmp.17;
  unsigned char * D.13571;

  D.13597 = stbi__load_main (s, x, y, comp, req_comp, &ri, 8);
  result = D.13597;
  if (result == 0B) goto <D.13569>; else goto <D.13570>;
  <D.13569>:
  D.13571 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13599>;
  <D.13570>:
  _1 = ri.bits_per_channel;
  if (_1 == 8) goto <D.13573>; else goto <D.13576>;
  <D.13576>:
  _2 = ri.bits_per_channel;
  if (_2 == 16) goto <D.13573>; else goto <D.13577>;
  <D.13577>:
  _assert ("ri.bits_per_channel == 8 || ri.bits_per_channel == 16", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 1210);
  if (0 != 0) goto <D.13573>; else goto <D.13574>;
  <D.13573>:
  iftmp.17 = 1;
  goto <D.13575>;
  <D.13574>:
  iftmp.17 = 0;
  <D.13575>:
  _3 = ri.bits_per_channel;
  if (_3 != 8) goto <D.13578>; else goto <D.13579>;
  <D.13578>:
  if (req_comp == 0) goto <D.13581>; else goto <D.13582>;
  <D.13581>:
  iftmp.18 = *comp;
  goto <D.13583>;
  <D.13582>:
  iftmp.18 = req_comp;
  <D.13583>:
  _4 = *y;
  _5 = *x;
  result = stbi__convert_16_to_8 (result, _5, _4, iftmp.18);
  ri.bits_per_channel = 8;
  goto <D.13584>;
  <D.13579>:
  <D.13584>:
  stbi__vertically_flip_on_load_set.20_6 = stbi__vertically_flip_on_load_set;
  if (stbi__vertically_flip_on_load_set.20_6 != 0) goto <D.13586>; else goto <D.13587>;
  <D.13586>:
  stbi__vertically_flip_on_load_local.21_7 = stbi__vertically_flip_on_load_local;
  iftmp.19 = stbi__vertically_flip_on_load_local.21_7 != 0;
  goto <D.13588>;
  <D.13587>:
  stbi__vertically_flip_on_load_global.22_8 = stbi__vertically_flip_on_load_global;
  iftmp.19 = stbi__vertically_flip_on_load_global.22_8 != 0;
  <D.13588>:
  if (iftmp.19 != 0) goto <D.13589>; else goto <D.13590>;
  <D.13589>:
  if (req_comp == 0) goto <D.13592>; else goto <D.13593>;
  <D.13592>:
  iftmp.23 = *comp;
  goto <D.13594>;
  <D.13593>:
  iftmp.23 = req_comp;
  <D.13594>:
  channels = iftmp.23;
  _9 = *y;
  _10 = *x;
  stbi__vertical_flip (result, _10, _9, channels);
  goto <D.13595>;
  <D.13590>:
  <D.13595>:
  D.13571 = result;
  goto <D.13599>;
  <D.13599>:
  ri = {CLOBBER};
  goto <D.13596>;
  <D.13596>:
  return D.13571;
  <D.13598>:
  ri = {CLOBBER};
  resx 1
}



;; Function stbi__load_and_postprocess_16bit (_ZL32stbi__load_and_postprocess_16bitP13stbi__contextPiS1_S1_i, funcdef_no=798, decl_uid=10443, cgraph_uid=704, symbol_order=709)

stbi__load_and_postprocess_16bit (struct stbi__context * s, int * x, int * y, int * comp, int req_comp)
{
  void * D.13629;
  int channels;
  void * result;
  struct stbi__result_info ri;
  int iftmp.30;
  bool iftmp.26;
  int iftmp.25;
  bool iftmp.24;
  stbi__uint16 * D.13603;

  D.13629 = stbi__load_main (s, x, y, comp, req_comp, &ri, 16);
  result = D.13629;
  if (result == 0B) goto <D.13601>; else goto <D.13602>;
  <D.13601>:
  D.13603 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13631>;
  <D.13602>:
  _1 = ri.bits_per_channel;
  if (_1 == 8) goto <D.13605>; else goto <D.13608>;
  <D.13608>:
  _2 = ri.bits_per_channel;
  if (_2 == 16) goto <D.13605>; else goto <D.13609>;
  <D.13609>:
  _assert ("ri.bits_per_channel == 8 || ri.bits_per_channel == 16", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 1236);
  if (0 != 0) goto <D.13605>; else goto <D.13606>;
  <D.13605>:
  iftmp.24 = 1;
  goto <D.13607>;
  <D.13606>:
  iftmp.24 = 0;
  <D.13607>:
  _3 = ri.bits_per_channel;
  if (_3 != 16) goto <D.13610>; else goto <D.13611>;
  <D.13610>:
  if (req_comp == 0) goto <D.13613>; else goto <D.13614>;
  <D.13613>:
  iftmp.25 = *comp;
  goto <D.13615>;
  <D.13614>:
  iftmp.25 = req_comp;
  <D.13615>:
  _4 = *y;
  _5 = *x;
  result = stbi__convert_8_to_16 (result, _5, _4, iftmp.25);
  ri.bits_per_channel = 16;
  goto <D.13616>;
  <D.13611>:
  <D.13616>:
  stbi__vertically_flip_on_load_set.27_6 = stbi__vertically_flip_on_load_set;
  if (stbi__vertically_flip_on_load_set.27_6 != 0) goto <D.13618>; else goto <D.13619>;
  <D.13618>:
  stbi__vertically_flip_on_load_local.28_7 = stbi__vertically_flip_on_load_local;
  iftmp.26 = stbi__vertically_flip_on_load_local.28_7 != 0;
  goto <D.13620>;
  <D.13619>:
  stbi__vertically_flip_on_load_global.29_8 = stbi__vertically_flip_on_load_global;
  iftmp.26 = stbi__vertically_flip_on_load_global.29_8 != 0;
  <D.13620>:
  if (iftmp.26 != 0) goto <D.13621>; else goto <D.13622>;
  <D.13621>:
  if (req_comp == 0) goto <D.13624>; else goto <D.13625>;
  <D.13624>:
  iftmp.30 = *comp;
  goto <D.13626>;
  <D.13625>:
  iftmp.30 = req_comp;
  <D.13626>:
  channels = iftmp.30;
  _9 = (long long unsigned int) channels;
  _10 = (unsigned int) _9;
  _11 = _10 * 2;
  _12 = (int) _11;
  _13 = *y;
  _14 = *x;
  stbi__vertical_flip (result, _14, _13, _12);
  goto <D.13627>;
  <D.13622>:
  <D.13627>:
  D.13603 = result;
  goto <D.13631>;
  <D.13631>:
  ri = {CLOBBER};
  goto <D.13628>;
  <D.13628>:
  return D.13603;
  <D.13630>:
  ri = {CLOBBER};
  resx 1
}



;; Function stbi__float_postprocess (_ZL23stbi__float_postprocessPfPiS0_S0_i, funcdef_no=799, decl_uid=10453, cgraph_uid=705, symbol_order=710)

stbi__float_postprocess (float * result, int * x, int * y, int * comp, int req_comp)
{
  int channels;
  int iftmp.35;
  bool iftmp.31;

  stbi__vertically_flip_on_load_set.32_1 = stbi__vertically_flip_on_load_set;
  if (stbi__vertically_flip_on_load_set.32_1 != 0) goto <D.13633>; else goto <D.13634>;
  <D.13633>:
  stbi__vertically_flip_on_load_local.33_2 = stbi__vertically_flip_on_load_local;
  iftmp.31 = stbi__vertically_flip_on_load_local.33_2 != 0;
  goto <D.13635>;
  <D.13634>:
  stbi__vertically_flip_on_load_global.34_3 = stbi__vertically_flip_on_load_global;
  iftmp.31 = stbi__vertically_flip_on_load_global.34_3 != 0;
  <D.13635>:
  if (iftmp.31 != 0) goto <D.13636>; else goto <D.13637>;
  <D.13636>:
  if (result != 0B) goto <D.13638>; else goto <D.13639>;
  <D.13638>:
  if (req_comp == 0) goto <D.13641>; else goto <D.13642>;
  <D.13641>:
  iftmp.35 = *comp;
  goto <D.13643>;
  <D.13642>:
  iftmp.35 = req_comp;
  <D.13643>:
  channels = iftmp.35;
  _4 = (long long unsigned int) channels;
  _5 = (unsigned int) _4;
  _6 = _5 * 4;
  _7 = (int) _6;
  _8 = *y;
  _9 = *x;
  stbi__vertical_flip (result, _9, _8, _7);
  goto <D.13644>;
  <D.13639>:
  <D.13644>:
  <D.13637>:
  return;
}



;; Function stbi__fopen (_ZL11stbi__fopenPKcS0_, funcdef_no=800, decl_uid=10458, cgraph_uid=706, symbol_order=711)

stbi__fopen (const char * filename, const char * mode)
{
  struct FILE * D.13647;
  struct FILE * f;
  struct FILE * D.13645;

  D.13647 = fopen (filename, mode);
  f = D.13647;
  D.13645 = f;
  goto <D.13646>;
  <D.13646>:
  return D.13645;
}



;; Function stbi_load (stbi_load, funcdef_no=801, decl_uid=4986, cgraph_uid=707, symbol_order=712)

stbi_load (const char * filename, int * x, int * y, int * comp, int req_comp)
{
  unsigned char * D.13653;
  struct FILE * D.13652;
  unsigned char * result;
  struct FILE * f;
  stbi_uc * D.13650;

  D.13652 = stbi__fopen (filename, "rb");
  f = D.13652;
  if (f == 0B) goto <D.13648>; else goto <D.13649>;
  <D.13648>:
  stbi__err ("can\'t fopen");
  D.13650 = 0B;
  goto <D.13651>;
  <D.13649>:
  D.13653 = stbi_load_from_file (f, x, y, comp, req_comp);
  result = D.13653;
  fclose (f);
  D.13650 = result;
  goto <D.13651>;
  <D.13651>:
  return D.13650;
}



;; Function stbi_load_from_file (stbi_load_from_file, funcdef_no=802, decl_uid=4992, cgraph_uid=708, symbol_order=713)

stbi_load_from_file (struct FILE * f, int * x, int * y, int * comp, int req_comp)
{
  unsigned char * D.13659;
  struct stbi__context s;
  unsigned char * result;
  stbi_uc * D.13657;

  stbi__start_file (&s, f);
  D.13659 = stbi__load_and_postprocess_8bit (&s, x, y, comp, req_comp);
  result = D.13659;
  if (result != 0B) goto <D.13654>; else goto <D.13655>;
  <D.13654>:
  _1 = s.img_buffer_end;
  _2 = s.img_buffer;
  _3 = _1 - _2;
  _4 = (int) _3;
  _5 = -_4;
  fseek (f, _5, 1);
  goto <D.13656>;
  <D.13655>:
  <D.13656>:
  D.13657 = result;
  goto <D.13661>;
  <D.13661>:
  s = {CLOBBER};
  goto <D.13658>;
  <D.13658>:
  return D.13657;
  <D.13660>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_load_from_file_16 (stbi_load_from_file_16, funcdef_no=803, decl_uid=5027, cgraph_uid=709, symbol_order=714)

stbi_load_from_file_16 (struct FILE * f, int * x, int * y, int * comp, int req_comp)
{
  stbi__uint16 * D.13667;
  struct stbi__context s;
  stbi__uint16 * result;
  stbi__uint16 * D.13665;

  stbi__start_file (&s, f);
  D.13667 = stbi__load_and_postprocess_16bit (&s, x, y, comp, req_comp);
  result = D.13667;
  if (result != 0B) goto <D.13662>; else goto <D.13663>;
  <D.13662>:
  _1 = s.img_buffer_end;
  _2 = s.img_buffer;
  _3 = _1 - _2;
  _4 = (int) _3;
  _5 = -_4;
  fseek (f, _5, 1);
  goto <D.13664>;
  <D.13663>:
  <D.13664>:
  D.13665 = result;
  goto <D.13669>;
  <D.13669>:
  s = {CLOBBER};
  goto <D.13666>;
  <D.13666>:
  return D.13665;
  <D.13668>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_load_16 (stbi_load_16, funcdef_no=804, decl_uid=5021, cgraph_uid=710, symbol_order=715)

stbi_load_16 (const char * filename, int * x, int * y, int * comp, int req_comp)
{
  stbi__uint16 * D.13675;
  struct FILE * D.13674;
  stbi__uint16 * result;
  struct FILE * f;
  stbi_us * D.13672;

  D.13674 = stbi__fopen (filename, "rb");
  f = D.13674;
  if (f == 0B) goto <D.13670>; else goto <D.13671>;
  <D.13670>:
  stbi__err ("can\'t fopen");
  D.13672 = 0B;
  goto <D.13673>;
  <D.13671>:
  D.13675 = stbi_load_from_file_16 (f, x, y, comp, req_comp);
  result = D.13675;
  fclose (f);
  D.13672 = result;
  goto <D.13673>;
  <D.13673>:
  return D.13672;
}



;; Function stbi_load_16_from_memory (stbi_load_16_from_memory, funcdef_no=805, decl_uid=5008, cgraph_uid=711, symbol_order=716)

stbi_load_16_from_memory (const stbi_uc * buffer, int len, int * x, int * y, int * channels_in_file, int desired_channels)
{
  stbi_us * D.13678;
  struct stbi__context s;
  stbi_us * D.13676;

  stbi__start_mem (&s, buffer, len);
  D.13678 = stbi__load_and_postprocess_16bit (&s, x, y, channels_in_file, desired_channels);
  D.13676 = D.13678;
  goto <D.13680>;
  <D.13680>:
  s = {CLOBBER};
  goto <D.13677>;
  <D.13677>:
  return D.13676;
  <D.13679>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_load_16_from_callbacks (stbi_load_16_from_callbacks, funcdef_no=806, decl_uid=5015, cgraph_uid=712, symbol_order=717)

stbi_load_16_from_callbacks (const struct stbi_io_callbacks * clbk, void * user, int * x, int * y, int * channels_in_file, int desired_channels)
{
  stbi_us * D.13683;
  struct stbi__context s;
  stbi_us * D.13681;

  stbi__start_callbacks (&s, clbk, user);
  D.13683 = stbi__load_and_postprocess_16bit (&s, x, y, channels_in_file, desired_channels);
  D.13681 = D.13683;
  goto <D.13685>;
  <D.13685>:
  s = {CLOBBER};
  goto <D.13682>;
  <D.13682>:
  return D.13681;
  <D.13684>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_load_from_memory (stbi_load_from_memory, funcdef_no=807, decl_uid=4973, cgraph_uid=713, symbol_order=718)

stbi_load_from_memory (const stbi_uc * buffer, int len, int * x, int * y, int * comp, int req_comp)
{
  stbi_uc * D.13688;
  struct stbi__context s;
  stbi_uc * D.13686;

  stbi__start_mem (&s, buffer, len);
  D.13688 = stbi__load_and_postprocess_8bit (&s, x, y, comp, req_comp);
  D.13686 = D.13688;
  goto <D.13690>;
  <D.13690>:
  s = {CLOBBER};
  goto <D.13687>;
  <D.13687>:
  return D.13686;
  <D.13689>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_load_from_callbacks (stbi_load_from_callbacks, funcdef_no=808, decl_uid=4980, cgraph_uid=714, symbol_order=719)

stbi_load_from_callbacks (const struct stbi_io_callbacks * clbk, void * user, int * x, int * y, int * comp, int req_comp)
{
  stbi_uc * D.13693;
  struct stbi__context s;
  stbi_uc * D.13691;

  stbi__start_callbacks (&s, clbk, user);
  D.13693 = stbi__load_and_postprocess_8bit (&s, x, y, comp, req_comp);
  D.13691 = D.13693;
  goto <D.13695>;
  <D.13695>:
  s = {CLOBBER};
  goto <D.13692>;
  <D.13692>:
  return D.13691;
  <D.13694>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_load_gif_from_memory (stbi_load_gif_from_memory, funcdef_no=809, decl_uid=5001, cgraph_uid=715, symbol_order=720)

stbi_load_gif_from_memory (const stbi_uc * buffer, int len, int * * delays, int * x, int * y, int * z, int * comp, int req_comp)
{
  unsigned char * D.13705;
  struct stbi__context s;
  unsigned char * result;
  stbi_uc * D.13703;
  bool iftmp.36;

  stbi__start_mem (&s, buffer, len);
  D.13705 = stbi__load_gif_main (&s, delays, x, y, z, comp, req_comp);
  result = D.13705;
  stbi__vertically_flip_on_load_set.37_1 = stbi__vertically_flip_on_load_set;
  if (stbi__vertically_flip_on_load_set.37_1 != 0) goto <D.13697>; else goto <D.13698>;
  <D.13697>:
  stbi__vertically_flip_on_load_local.38_2 = stbi__vertically_flip_on_load_local;
  iftmp.36 = stbi__vertically_flip_on_load_local.38_2 != 0;
  goto <D.13699>;
  <D.13698>:
  stbi__vertically_flip_on_load_global.39_3 = stbi__vertically_flip_on_load_global;
  iftmp.36 = stbi__vertically_flip_on_load_global.39_3 != 0;
  <D.13699>:
  if (iftmp.36 != 0) goto <D.13700>; else goto <D.13701>;
  <D.13700>:
  _4 = *comp;
  _5 = *z;
  _6 = *y;
  _7 = *x;
  stbi__vertical_flip_slices (result, _7, _6, _5, _4);
  goto <D.13702>;
  <D.13701>:
  <D.13702>:
  D.13703 = result;
  goto <D.13707>;
  <D.13707>:
  s = {CLOBBER};
  goto <D.13704>;
  <D.13704>:
  return D.13703;
  <D.13706>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi__loadf_main (_ZL16stbi__loadf_mainP13stbi__contextPiS1_S1_i, funcdef_no=810, decl_uid=10583, cgraph_uid=716, symbol_order=721)

stbi__loadf_main (struct stbi__context * s, int * x, int * y, int * comp, int req_comp)
{
  unsigned char * D.13726;
  float * D.13723;
  int D.13722;
  float * hdr_data;
  struct stbi__result_info ri;
  unsigned char * data;
  int iftmp.41;
  float * D.13714;
  bool retval.40;

  D.13722 = stbi__hdr_test (s);
  _1 = D.13722;
  retval.40 = _1 != 0;
  if (retval.40 != 0) goto <D.13709>; else goto <D.13710>;
  <D.13709>:
  D.13723 = stbi__hdr_load (s, x, y, comp, req_comp, &ri);
  hdr_data = D.13723;
  if (hdr_data != 0B) goto <D.13711>; else goto <D.13712>;
  <D.13711>:
  stbi__float_postprocess (hdr_data, x, y, comp, req_comp);
  goto <D.13713>;
  <D.13712>:
  <D.13713>:
  D.13714 = hdr_data;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13725>;
  <D.13725>:
  ri = {CLOBBER};
  goto <D.13721>;
  <D.13710>:
  D.13726 = stbi__load_and_postprocess_8bit (s, x, y, comp, req_comp);
  data = D.13726;
  if (data != 0B) goto <D.13715>; else goto <D.13716>;
  <D.13715>:
  if (req_comp == 0) goto <D.13718>; else goto <D.13719>;
  <D.13718>:
  iftmp.41 = *comp;
  goto <D.13720>;
  <D.13719>:
  iftmp.41 = req_comp;
  <D.13720>:
  _2 = *y;
  _3 = *x;
  D.13714 = stbi__ldr_to_hdr (data, _3, _2, iftmp.41);
  goto <D.13721>;
  <D.13716>:
  stbi__err ("unknown image type");
  D.13714 = 0B;
  goto <D.13721>;
  <D.13721>:
  return D.13714;
  <D.13724>:
  ri = {CLOBBER};
  resx 1
}



;; Function stbi_loadf_from_memory (stbi_loadf_from_memory, funcdef_no=811, decl_uid=5034, cgraph_uid=717, symbol_order=722)

stbi_loadf_from_memory (const stbi_uc * buffer, int len, int * x, int * y, int * comp, int req_comp)
{
  float * D.13729;
  struct stbi__context s;
  float * D.13727;

  stbi__start_mem (&s, buffer, len);
  D.13729 = stbi__loadf_main (&s, x, y, comp, req_comp);
  D.13727 = D.13729;
  goto <D.13731>;
  <D.13731>:
  s = {CLOBBER};
  goto <D.13728>;
  <D.13728>:
  return D.13727;
  <D.13730>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_loadf_from_callbacks (stbi_loadf_from_callbacks, funcdef_no=812, decl_uid=5041, cgraph_uid=718, symbol_order=723)

stbi_loadf_from_callbacks (const struct stbi_io_callbacks * clbk, void * user, int * x, int * y, int * comp, int req_comp)
{
  float * D.13734;
  struct stbi__context s;
  float * D.13732;

  stbi__start_callbacks (&s, clbk, user);
  D.13734 = stbi__loadf_main (&s, x, y, comp, req_comp);
  D.13732 = D.13734;
  goto <D.13736>;
  <D.13736>:
  s = {CLOBBER};
  goto <D.13733>;
  <D.13733>:
  return D.13732;
  <D.13735>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_loadf (stbi_loadf, funcdef_no=813, decl_uid=5047, cgraph_uid=719, symbol_order=724)

stbi_loadf (const char * filename, int * x, int * y, int * comp, int req_comp)
{
  float * D.13742;
  struct FILE * D.13741;
  struct FILE * f;
  float * result;
  float * D.13739;

  D.13741 = stbi__fopen (filename, "rb");
  f = D.13741;
  if (f == 0B) goto <D.13737>; else goto <D.13738>;
  <D.13737>:
  stbi__err ("can\'t fopen");
  D.13739 = 0B;
  goto <D.13740>;
  <D.13738>:
  D.13742 = stbi_loadf_from_file (f, x, y, comp, req_comp);
  result = D.13742;
  fclose (f);
  D.13739 = result;
  goto <D.13740>;
  <D.13740>:
  return D.13739;
}



;; Function stbi_loadf_from_file (stbi_loadf_from_file, funcdef_no=814, decl_uid=5053, cgraph_uid=720, symbol_order=725)

stbi_loadf_from_file (struct FILE * f, int * x, int * y, int * comp, int req_comp)
{
  float * D.13745;
  struct stbi__context s;
  float * D.13743;

  stbi__start_file (&s, f);
  D.13745 = stbi__loadf_main (&s, x, y, comp, req_comp);
  D.13743 = D.13745;
  goto <D.13747>;
  <D.13747>:
  s = {CLOBBER};
  goto <D.13744>;
  <D.13744>:
  return D.13743;
  <D.13746>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_is_hdr_from_memory (stbi_is_hdr_from_memory, funcdef_no=815, decl_uid=5067, cgraph_uid=721, symbol_order=726)

stbi_is_hdr_from_memory (const stbi_uc * buffer, int len)
{
  int D.13750;
  struct stbi__context s;
  int D.13748;

  stbi__start_mem (&s, buffer, len);
  D.13750 = stbi__hdr_test (&s);
  D.13748 = D.13750;
  goto <D.13752>;
  <D.13752>:
  s = {CLOBBER};
  goto <D.13749>;
  <D.13749>:
  return D.13748;
  <D.13751>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_is_hdr (stbi_is_hdr, funcdef_no=816, decl_uid=5069, cgraph_uid=722, symbol_order=727)

stbi_is_hdr (const char * filename)
{
  int D.13759;
  struct FILE * D.13758;
  int result;
  struct FILE * f;
  int D.13756;

  D.13758 = stbi__fopen (filename, "rb");
  f = D.13758;
  result = 0;
  if (f != 0B) goto <D.13753>; else goto <D.13754>;
  <D.13753>:
  D.13759 = stbi_is_hdr_from_file (f);
  result = D.13759;
  fclose (f);
  goto <D.13755>;
  <D.13754>:
  <D.13755>:
  D.13756 = result;
  goto <D.13757>;
  <D.13757>:
  return D.13756;
}



;; Function stbi_is_hdr_from_file (stbi_is_hdr_from_file, funcdef_no=817, decl_uid=5071, cgraph_uid=723, symbol_order=728)

stbi_is_hdr_from_file (struct FILE * f)
{
  int D.13763;
  long int D.13762;
  struct stbi__context s;
  int res;
  long int pos;
  int D.13760;

  D.13762 = ftell (f);
  pos = D.13762;
  stbi__start_file (&s, f);
  D.13763 = stbi__hdr_test (&s);
  res = D.13763;
  fseek (f, pos, 0);
  D.13760 = res;
  goto <D.13765>;
  <D.13765>:
  s = {CLOBBER};
  goto <D.13761>;
  <D.13761>:
  return D.13760;
  <D.13764>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_is_hdr_from_callbacks (stbi_is_hdr_from_callbacks, funcdef_no=818, decl_uid=5064, cgraph_uid=724, symbol_order=729)

stbi_is_hdr_from_callbacks (const struct stbi_io_callbacks * clbk, void * user)
{
  int D.13768;
  struct stbi__context s;
  int D.13766;

  stbi__start_callbacks (&s, clbk, user);
  D.13768 = stbi__hdr_test (&s);
  D.13766 = D.13768;
  goto <D.13770>;
  <D.13770>:
  s = {CLOBBER};
  goto <D.13767>;
  <D.13767>:
  return D.13766;
  <D.13769>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_ldr_to_hdr_gamma (stbi_ldr_to_hdr_gamma, funcdef_no=819, decl_uid=5059, cgraph_uid=725, symbol_order=732)

stbi_ldr_to_hdr_gamma (float gamma)
{
  stbi__l2h_gamma = gamma;
  return;
}



;; Function stbi_ldr_to_hdr_scale (stbi_ldr_to_hdr_scale, funcdef_no=820, decl_uid=5061, cgraph_uid=726, symbol_order=733)

stbi_ldr_to_hdr_scale (float scale)
{
  stbi__l2h_scale = scale;
  return;
}



;; Function stbi_hdr_to_ldr_gamma (stbi_hdr_to_ldr_gamma, funcdef_no=821, decl_uid=5055, cgraph_uid=727, symbol_order=736)

stbi_hdr_to_ldr_gamma (float gamma)
{
  _1 = 1.0e+0 / gamma;
  stbi__h2l_gamma_i = _1;
  return;
}



;; Function stbi_hdr_to_ldr_scale (stbi_hdr_to_ldr_scale, funcdef_no=822, decl_uid=5057, cgraph_uid=728, symbol_order=737)

stbi_hdr_to_ldr_scale (float scale)
{
  _1 = 1.0e+0 / scale;
  stbi__h2l_scale_i = _1;
  return;
}



;; Function stbi__refill_buffer (_ZL19stbi__refill_bufferP13stbi__context, funcdef_no=823, decl_uid=10033, cgraph_uid=729, symbol_order=738)

stbi__refill_buffer (struct stbi__context * s)
{
  int D.13774;
  int n;

  _1 = s->io.read;
  _2 = s->buflen;
  _3 = &s->buffer_start;
  _4 = s->io_user_data;
  D.13774 = _1 (_4, _3, _2);
  n = D.13774;
  _5 = s->callback_already_read;
  _6 = s->img_buffer;
  _7 = s->img_buffer_original;
  _8 = _6 - _7;
  _9 = (int) _8;
  _10 = _5 + _9;
  s->callback_already_read = _10;
  if (n == 0) goto <D.13771>; else goto <D.13772>;
  <D.13771>:
  s->read_from_callbacks = 0;
  _11 = &s->buffer_start;
  s->img_buffer = _11;
  _12 = &s->buffer_start;
  _13 = _12 + 1;
  s->img_buffer_end = _13;
  _14 = s->img_buffer;
  *_14 = 0;
  goto <D.13773>;
  <D.13772>:
  _15 = &s->buffer_start;
  s->img_buffer = _15;
  _16 = &s->buffer_start;
  _17 = (sizetype) n;
  _18 = _16 + _17;
  s->img_buffer_end = _18;
  <D.13773>:
  return;
}



;; Function stbi__skip (_ZL10stbi__skipP13stbi__contexti, funcdef_no=826, decl_uid=10676, cgraph_uid=732, symbol_order=741)

stbi__skip (struct stbi__context * s, int n)
{
  int blen;

  if (n == 0) goto <D.13775>; else goto <D.13776>;
  <D.13775>:
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13784>;
  <D.13776>:
  if (n < 0) goto <D.13777>; else goto <D.13778>;
  <D.13777>:
  _1 = s->img_buffer_end;
  s->img_buffer = _1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13784>;
  <D.13778>:
  _2 = s->io.read;
  if (_2 != 0B) goto <D.13779>; else goto <D.13780>;
  <D.13779>:
  _3 = s->img_buffer_end;
  _4 = s->img_buffer;
  _5 = _3 - _4;
  blen = (int) _5;
  if (blen < n) goto <D.13781>; else goto <D.13782>;
  <D.13781>:
  _6 = s->img_buffer_end;
  s->img_buffer = _6;
  _7 = s->io.skip;
  _8 = n - blen;
  _9 = s->io_user_data;
  _7 (_9, _8);
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13784>;
  <D.13782>:
  goto <D.13783>;
  <D.13780>:
  <D.13783>:
  _10 = s->img_buffer;
  _11 = (sizetype) n;
  _12 = _10 + _11;
  s->img_buffer = _12;
  <D.13784>:
  return;
}



;; Function stbi__getn (_ZL10stbi__getnP13stbi__contextPhi, funcdef_no=827, decl_uid=10682, cgraph_uid=733, symbol_order=742)

stbi__getn (struct stbi__context * s, stbi_uc * buffer, int n)
{
  int D.13794;
  int count;
  int res;
  int blen;
  int D.13789;

  _1 = s->io.read;
  if (_1 != 0B) goto <D.13785>; else goto <D.13786>;
  <D.13785>:
  _2 = s->img_buffer_end;
  _3 = s->img_buffer;
  _4 = _2 - _3;
  blen = (int) _4;
  if (blen < n) goto <D.13787>; else goto <D.13788>;
  <D.13787>:
  _5 = (long long unsigned int) blen;
  _6 = s->img_buffer;
  memcpy (buffer, _6, _5);
  _7 = s->io.read;
  _8 = n - blen;
  _9 = (sizetype) blen;
  _10 = buffer + _9;
  _11 = s->io_user_data;
  D.13794 = _7 (_11, _10, _8);
  count = D.13794;
  _12 = n - blen;
  _13 = count == _12;
  res = (int) _13;
  _14 = s->img_buffer_end;
  s->img_buffer = _14;
  D.13789 = res;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13793>;
  <D.13788>:
  goto <D.13790>;
  <D.13786>:
  <D.13790>:
  _15 = s->img_buffer;
  _16 = (sizetype) n;
  _17 = _15 + _16;
  _18 = s->img_buffer_end;
  if (_17 <= _18) goto <D.13791>; else goto <D.13792>;
  <D.13791>:
  _19 = (long long unsigned int) n;
  _20 = s->img_buffer;
  memcpy (buffer, _20, _19);
  _21 = s->img_buffer;
  _22 = (sizetype) n;
  _23 = _21 + _22;
  s->img_buffer = _23;
  D.13789 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13793>;
  <D.13792>:
  D.13789 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13793>;
  <D.13793>:
  return D.13789;
}



;; Function stbi__get16be (_ZL13stbi__get16beP13stbi__context, funcdef_no=828, decl_uid=10688, cgraph_uid=734, symbol_order=743)

stbi__get16be (struct stbi__context * s)
{
  unsigned char D.13798;
  unsigned char D.13797;
  int z;
  int D.13795;

  D.13797 = stbi__get8 (s);
  _1 = D.13797;
  z = (int) _1;
  _2 = z << 8;
  D.13798 = stbi__get8 (s);
  _3 = D.13798;
  _4 = (int) _3;
  D.13795 = _2 + _4;
  goto <D.13796>;
  <D.13796>:
  return D.13795;
}



;; Function stbi__get8 (_ZL10stbi__get8P13stbi__context, funcdef_no=824, decl_uid=10669, cgraph_uid=730, symbol_order=739)

stbi__get8 (struct stbi__context * s)
{
  stbi_uc D.13801;

  _1 = s->img_buffer;
  _2 = s->img_buffer_end;
  if (_1 < _2) goto <D.13799>; else goto <D.13800>;
  <D.13799>:
  _3 = s->img_buffer;
  _4 = _3;
  _5 = _4 + 1;
  s->img_buffer = _5;
  D.13801 = *_4;
  goto <D.13804>;
  <D.13800>:
  _6 = s->read_from_callbacks;
  if (_6 != 0) goto <D.13802>; else goto <D.13803>;
  <D.13802>:
  stbi__refill_buffer (s);
  _7 = s->img_buffer;
  _8 = _7;
  _9 = _8 + 1;
  s->img_buffer = _9;
  D.13801 = *_8;
  goto <D.13804>;
  <D.13803>:
  D.13801 = 0;
  goto <D.13804>;
  <D.13804>:
  return D.13801;
}



;; Function stbi__get32be (_ZL13stbi__get32beP13stbi__context, funcdef_no=829, decl_uid=10692, cgraph_uid=735, symbol_order=744)

stbi__get32be (struct stbi__context * s)
{
  int D.13808;
  int D.13807;
  stbi__uint32 z;
  stbi__uint32 D.13805;

  D.13807 = stbi__get16be (s);
  _1 = D.13807;
  z = (stbi__uint32) _1;
  _2 = z << 16;
  D.13808 = stbi__get16be (s);
  _3 = D.13808;
  _4 = (unsigned int) _3;
  D.13805 = _2 + _4;
  goto <D.13806>;
  <D.13806>:
  return D.13805;
}



;; Function stbi__get16le (_ZL13stbi__get16leP13stbi__context, funcdef_no=830, decl_uid=10696, cgraph_uid=736, symbol_order=745)

stbi__get16le (struct stbi__context * s)
{
  unsigned char D.13812;
  unsigned char D.13811;
  int z;
  int D.13809;

  D.13811 = stbi__get8 (s);
  _1 = D.13811;
  z = (int) _1;
  D.13812 = stbi__get8 (s);
  _2 = D.13812;
  _3 = (int) _2;
  _4 = _3 << 8;
  D.13809 = z + _4;
  goto <D.13810>;
  <D.13810>:
  return D.13809;
}



;; Function stbi__get32le (_ZL13stbi__get32leP13stbi__context, funcdef_no=831, decl_uid=10700, cgraph_uid=737, symbol_order=746)

stbi__get32le (struct stbi__context * s)
{
  int D.13816;
  int D.13815;
  stbi__uint32 z;
  stbi__uint32 D.13813;

  D.13815 = stbi__get16le (s);
  _1 = D.13815;
  z = (stbi__uint32) _1;
  D.13816 = stbi__get16le (s);
  _2 = D.13816;
  _3 = _2 << 16;
  _4 = (unsigned int) _3;
  D.13813 = z + _4;
  goto <D.13814>;
  <D.13814>:
  return D.13813;
}



;; Function stbi__compute_y (_ZL15stbi__compute_yiii, funcdef_no=832, decl_uid=10706, cgraph_uid=738, symbol_order=747)

stbi__compute_y (int r, int g, int b)
{
  stbi_uc D.13817;

  _1 = r * 77;
  _2 = g * 150;
  _3 = _1 + _2;
  _4 = b * 29;
  _5 = _3 + _4;
  _6 = _5 >> 8;
  D.13817 = (stbi_uc) _6;
  goto <D.13818>;
  <D.13818>:
  return D.13817;
}



;; Function stbi__convert_format (_ZL20stbi__convert_formatPhiijj, funcdef_no=833, decl_uid=10713, cgraph_uid=739, symbol_order=748)

stbi__convert_format (unsigned char * data, int img_n, int req_comp, unsigned int x, unsigned int y)
{
  unsigned char * dest;
  unsigned char * src;
  unsigned char * good;
  int j;
  int i;
  bool iftmp.44;
  unsigned char * D.13821;

  req_comp.42_1 = req_comp;
  img_n.43_2 = img_n;
  if (req_comp.42_1 == img_n.43_2) goto <D.13819>; else goto <D.13820>;
  <D.13819>:
  D.13821 = data;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13856>;
  <D.13820>:
  req_comp.45_3 = req_comp;
  if (req_comp.45_3 > 0) goto <D.13827>; else goto <D.13823>;
  <D.13827>:
  req_comp.46_4 = req_comp;
  if (req_comp.46_4 <= 4) goto <D.13824>; else goto <D.13823>;
  <D.13823>:
  _assert ("req_comp >= 1 && req_comp <= 4", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 1701);
  if (0 != 0) goto <D.13824>; else goto <D.13825>;
  <D.13824>:
  iftmp.44 = 1;
  goto <D.13826>;
  <D.13825>:
  iftmp.44 = 0;
  <D.13826>:
  y.47_5 = (int) y;
  x.48_6 = (int) x;
  req_comp.49_7 = req_comp;
  good = stbi__malloc_mad3 (req_comp.49_7, x.48_6, y.47_5, 0);
  if (good == 0B) goto <D.13828>; else goto <D.13829>;
  <D.13828>:
  free (data);
  stbi__err ("outofmem");
  D.13821 = 0B;
  goto <D.13856>;
  <D.13829>:
  j = 0;
  <D.13830>:
  y.50_8 = (int) y;
  if (j >= y.50_8) goto <D.10733>; else goto <D.13831>;
  <D.13831>:
  j.51_9 = (unsigned int) j;
  _10 = x * j.51_9;
  img_n.52_11 = img_n;
  img_n.53_12 = (unsigned int) img_n.52_11;
  _13 = _10 * img_n.53_12;
  _14 = (sizetype) _13;
  src = data + _14;
  j.54_15 = (unsigned int) j;
  _16 = x * j.54_15;
  req_comp.55_17 = req_comp;
  req_comp.56_18 = (unsigned int) req_comp.55_17;
  _19 = _16 * req_comp.56_18;
  _20 = (sizetype) _19;
  dest = good + _20;
  img_n.57_21 = img_n;
  _22 = img_n.57_21 * 8;
  req_comp.58_23 = req_comp;
  _24 = _22 + req_comp.58_23;
  switch (_24) <default: <D.10732>, case 10: <D.10720>, case 11: <D.10721>, case 12: <D.10722>, case 17: <D.10723>, case 19: <D.10724>, case 20: <D.10725>, case 25: <D.10727>, case 26: <D.10728>, case 28: <D.10726>, case 33: <D.10729>, case 34: <D.10730>, case 35: <D.10731>>
  <D.10720>:
  _25 = x + 4294967295;
  i = (int) _25;
  <D.13832>:
  if (i < 0) goto <D.10736>; else goto <D.13833>;
  <D.13833>:
  _26 = *src;
  *dest = _26;
  _27 = dest + 1;
  *_27 = 255;
  i = i + -1;
  src = src + 1;
  dest = dest + 2;
  goto <D.13832>;
  <D.10736>:
  goto <D.10735>;
  <D.10721>:
  _28 = x + 4294967295;
  i = (int) _28;
  <D.13834>:
  if (i < 0) goto <D.10738>; else goto <D.13835>;
  <D.13835>:
  _29 = dest + 2;
  _30 = *src;
  *_29 = _30;
  _31 = dest + 1;
  _32 = *_29;
  *_31 = _32;
  _33 = *_31;
  *dest = _33;
  i = i + -1;
  src = src + 1;
  dest = dest + 3;
  goto <D.13834>;
  <D.10738>:
  goto <D.10735>;
  <D.10722>:
  _34 = x + 4294967295;
  i = (int) _34;
  <D.13836>:
  if (i < 0) goto <D.10740>; else goto <D.13837>;
  <D.13837>:
  _35 = dest + 2;
  _36 = *src;
  *_35 = _36;
  _37 = dest + 1;
  _38 = *_35;
  *_37 = _38;
  _39 = *_37;
  *dest = _39;
  _40 = dest + 3;
  *_40 = 255;
  i = i + -1;
  src = src + 1;
  dest = dest + 4;
  goto <D.13836>;
  <D.10740>:
  goto <D.10735>;
  <D.10723>:
  _41 = x + 4294967295;
  i = (int) _41;
  <D.13838>:
  if (i < 0) goto <D.10742>; else goto <D.13839>;
  <D.13839>:
  _42 = *src;
  *dest = _42;
  i = i + -1;
  src = src + 2;
  dest = dest + 1;
  goto <D.13838>;
  <D.10742>:
  goto <D.10735>;
  <D.10724>:
  _43 = x + 4294967295;
  i = (int) _43;
  <D.13840>:
  if (i < 0) goto <D.10744>; else goto <D.13841>;
  <D.13841>:
  _44 = dest + 2;
  _45 = *src;
  *_44 = _45;
  _46 = dest + 1;
  _47 = *_44;
  *_46 = _47;
  _48 = *_46;
  *dest = _48;
  i = i + -1;
  src = src + 2;
  dest = dest + 3;
  goto <D.13840>;
  <D.10744>:
  goto <D.10735>;
  <D.10725>:
  _49 = x + 4294967295;
  i = (int) _49;
  <D.13842>:
  if (i < 0) goto <D.10746>; else goto <D.13843>;
  <D.13843>:
  _50 = dest + 2;
  _51 = *src;
  *_50 = _51;
  _52 = dest + 1;
  _53 = *_50;
  *_52 = _53;
  _54 = *_52;
  *dest = _54;
  _55 = dest + 3;
  _56 = MEM[(unsigned char *)src + 1B];
  *_55 = _56;
  i = i + -1;
  src = src + 2;
  dest = dest + 4;
  goto <D.13842>;
  <D.10746>:
  goto <D.10735>;
  <D.10726>:
  _57 = x + 4294967295;
  i = (int) _57;
  <D.13844>:
  if (i < 0) goto <D.10748>; else goto <D.13845>;
  <D.13845>:
  _58 = *src;
  *dest = _58;
  _59 = dest + 1;
  _60 = MEM[(unsigned char *)src + 1B];
  *_59 = _60;
  _61 = dest + 2;
  _62 = MEM[(unsigned char *)src + 2B];
  *_61 = _62;
  _63 = dest + 3;
  *_63 = 255;
  i = i + -1;
  src = src + 3;
  dest = dest + 4;
  goto <D.13844>;
  <D.10748>:
  goto <D.10735>;
  <D.10727>:
  _64 = x + 4294967295;
  i = (int) _64;
  <D.13846>:
  if (i < 0) goto <D.10750>; else goto <D.13847>;
  <D.13847>:
  _65 = src + 2;
  _66 = *_65;
  _67 = (int) _66;
  _68 = src + 1;
  _69 = *_68;
  _70 = (int) _69;
  _71 = *src;
  _72 = (int) _71;
  _73 = stbi__compute_y (_72, _70, _67);
  *dest = _73;
  i = i + -1;
  src = src + 3;
  dest = dest + 1;
  goto <D.13846>;
  <D.10750>:
  goto <D.10735>;
  <D.10728>:
  _74 = x + 4294967295;
  i = (int) _74;
  <D.13848>:
  if (i < 0) goto <D.10752>; else goto <D.13849>;
  <D.13849>:
  _75 = src + 2;
  _76 = *_75;
  _77 = (int) _76;
  _78 = src + 1;
  _79 = *_78;
  _80 = (int) _79;
  _81 = *src;
  _82 = (int) _81;
  _83 = stbi__compute_y (_82, _80, _77);
  *dest = _83;
  _84 = dest + 1;
  *_84 = 255;
  i = i + -1;
  src = src + 3;
  dest = dest + 2;
  goto <D.13848>;
  <D.10752>:
  goto <D.10735>;
  <D.10729>:
  _85 = x + 4294967295;
  i = (int) _85;
  <D.13850>:
  if (i < 0) goto <D.10754>; else goto <D.13851>;
  <D.13851>:
  _86 = src + 2;
  _87 = *_86;
  _88 = (int) _87;
  _89 = src + 1;
  _90 = *_89;
  _91 = (int) _90;
  _92 = *src;
  _93 = (int) _92;
  _94 = stbi__compute_y (_93, _91, _88);
  *dest = _94;
  i = i + -1;
  src = src + 4;
  dest = dest + 1;
  goto <D.13850>;
  <D.10754>:
  goto <D.10735>;
  <D.10730>:
  _95 = x + 4294967295;
  i = (int) _95;
  <D.13852>:
  if (i < 0) goto <D.10756>; else goto <D.13853>;
  <D.13853>:
  _96 = src + 2;
  _97 = *_96;
  _98 = (int) _97;
  _99 = src + 1;
  _100 = *_99;
  _101 = (int) _100;
  _102 = *src;
  _103 = (int) _102;
  _104 = stbi__compute_y (_103, _101, _98);
  *dest = _104;
  _105 = dest + 1;
  _106 = MEM[(unsigned char *)src + 3B];
  *_105 = _106;
  i = i + -1;
  src = src + 4;
  dest = dest + 2;
  goto <D.13852>;
  <D.10756>:
  goto <D.10735>;
  <D.10731>:
  _107 = x + 4294967295;
  i = (int) _107;
  <D.13854>:
  if (i < 0) goto <D.10758>; else goto <D.13855>;
  <D.13855>:
  _108 = *src;
  *dest = _108;
  _109 = dest + 1;
  _110 = MEM[(unsigned char *)src + 1B];
  *_109 = _110;
  _111 = dest + 2;
  _112 = MEM[(unsigned char *)src + 2B];
  *_111 = _112;
  i = i + -1;
  src = src + 4;
  dest = dest + 3;
  goto <D.13854>;
  <D.10758>:
  goto <D.10735>;
  <D.10732>:
  _assert ("0", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 1730);
  free (data);
  free (good);
  stbi__err ("unsupported");
  D.13821 = 0B;
  goto <D.13856>;
  <D.10735>:
  j = j + 1;
  goto <D.13830>;
  <D.10733>:
  free (data);
  D.13821 = good;
  goto <D.13856>;
  <D.13856>:
  return D.13821;
}



;; Function stbi__compute_y_16 (_ZL18stbi__compute_y_16iii, funcdef_no=834, decl_uid=10763, cgraph_uid=740, symbol_order=749)

stbi__compute_y_16 (int r, int g, int b)
{
  stbi__uint16 D.13857;

  _1 = r * 77;
  _2 = g * 150;
  _3 = _1 + _2;
  _4 = b * 29;
  _5 = _3 + _4;
  _6 = _5 >> 8;
  D.13857 = (stbi__uint16) _6;
  goto <D.13858>;
  <D.13858>:
  return D.13857;
}



;; Function stbi__convert_format16 (_ZL22stbi__convert_format16Ptiijj, funcdef_no=835, decl_uid=10770, cgraph_uid=741, symbol_order=750)

stbi__convert_format16 (stbi__uint16 * data, int img_n, int req_comp, unsigned int x, unsigned int y)
{
  stbi__uint16 * dest;
  stbi__uint16 * src;
  stbi__uint16 * good;
  int j;
  int i;
  bool iftmp.61;
  stbi__uint16 * D.13861;

  req_comp.59_1 = req_comp;
  img_n.60_2 = img_n;
  if (req_comp.59_1 == img_n.60_2) goto <D.13859>; else goto <D.13860>;
  <D.13859>:
  D.13861 = data;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13896>;
  <D.13860>:
  req_comp.62_3 = req_comp;
  if (req_comp.62_3 > 0) goto <D.13867>; else goto <D.13863>;
  <D.13867>:
  req_comp.63_4 = req_comp;
  if (req_comp.63_4 <= 4) goto <D.13864>; else goto <D.13863>;
  <D.13863>:
  _assert ("req_comp >= 1 && req_comp <= 4", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 1758);
  if (0 != 0) goto <D.13864>; else goto <D.13865>;
  <D.13864>:
  iftmp.61 = 1;
  goto <D.13866>;
  <D.13865>:
  iftmp.61 = 0;
  <D.13866>:
  req_comp.64_5 = req_comp;
  req_comp.65_6 = (unsigned int) req_comp.64_5;
  _7 = x * req_comp.65_6;
  _8 = y * _7;
  _9 = _8 * 2;
  _10 = (long long unsigned int) _9;
  good = stbi__malloc (_10);
  if (good == 0B) goto <D.13868>; else goto <D.13869>;
  <D.13868>:
  free (data);
  stbi__err ("outofmem");
  D.13861 = 0B;
  goto <D.13896>;
  <D.13869>:
  j = 0;
  <D.13870>:
  y.66_11 = (int) y;
  if (j >= y.66_11) goto <D.10790>; else goto <D.13871>;
  <D.13871>:
  j.67_12 = (unsigned int) j;
  _13 = x * j.67_12;
  img_n.68_14 = img_n;
  img_n.69_15 = (unsigned int) img_n.68_14;
  _16 = _13 * img_n.69_15;
  _17 = (long long unsigned int) _16;
  _18 = _17 * 2;
  src = data + _18;
  j.70_19 = (unsigned int) j;
  _20 = x * j.70_19;
  req_comp.71_21 = req_comp;
  req_comp.72_22 = (unsigned int) req_comp.71_21;
  _23 = _20 * req_comp.72_22;
  _24 = (long long unsigned int) _23;
  _25 = _24 * 2;
  dest = good + _25;
  img_n.73_26 = img_n;
  _27 = img_n.73_26 * 8;
  req_comp.74_28 = req_comp;
  _29 = _27 + req_comp.74_28;
  switch (_29) <default: <D.10789>, case 10: <D.10777>, case 11: <D.10778>, case 12: <D.10779>, case 17: <D.10780>, case 19: <D.10781>, case 20: <D.10782>, case 25: <D.10784>, case 26: <D.10785>, case 28: <D.10783>, case 33: <D.10786>, case 34: <D.10787>, case 35: <D.10788>>
  <D.10777>:
  _30 = x + 4294967295;
  i = (int) _30;
  <D.13872>:
  if (i < 0) goto <D.10793>; else goto <D.13873>;
  <D.13873>:
  _31 = *src;
  *dest = _31;
  _32 = dest + 2;
  *_32 = 65535;
  i = i + -1;
  src = src + 2;
  dest = dest + 4;
  goto <D.13872>;
  <D.10793>:
  goto <D.10792>;
  <D.10778>:
  _33 = x + 4294967295;
  i = (int) _33;
  <D.13874>:
  if (i < 0) goto <D.10795>; else goto <D.13875>;
  <D.13875>:
  _34 = dest + 4;
  _35 = *src;
  *_34 = _35;
  _36 = dest + 2;
  _37 = *_34;
  *_36 = _37;
  _38 = *_36;
  *dest = _38;
  i = i + -1;
  src = src + 2;
  dest = dest + 6;
  goto <D.13874>;
  <D.10795>:
  goto <D.10792>;
  <D.10779>:
  _39 = x + 4294967295;
  i = (int) _39;
  <D.13876>:
  if (i < 0) goto <D.10797>; else goto <D.13877>;
  <D.13877>:
  _40 = dest + 4;
  _41 = *src;
  *_40 = _41;
  _42 = dest + 2;
  _43 = *_40;
  *_42 = _43;
  _44 = *_42;
  *dest = _44;
  _45 = dest + 6;
  *_45 = 65535;
  i = i + -1;
  src = src + 2;
  dest = dest + 8;
  goto <D.13876>;
  <D.10797>:
  goto <D.10792>;
  <D.10780>:
  _46 = x + 4294967295;
  i = (int) _46;
  <D.13878>:
  if (i < 0) goto <D.10799>; else goto <D.13879>;
  <D.13879>:
  _47 = *src;
  *dest = _47;
  i = i + -1;
  src = src + 4;
  dest = dest + 2;
  goto <D.13878>;
  <D.10799>:
  goto <D.10792>;
  <D.10781>:
  _48 = x + 4294967295;
  i = (int) _48;
  <D.13880>:
  if (i < 0) goto <D.10801>; else goto <D.13881>;
  <D.13881>:
  _49 = dest + 4;
  _50 = *src;
  *_49 = _50;
  _51 = dest + 2;
  _52 = *_49;
  *_51 = _52;
  _53 = *_51;
  *dest = _53;
  i = i + -1;
  src = src + 4;
  dest = dest + 6;
  goto <D.13880>;
  <D.10801>:
  goto <D.10792>;
  <D.10782>:
  _54 = x + 4294967295;
  i = (int) _54;
  <D.13882>:
  if (i < 0) goto <D.10803>; else goto <D.13883>;
  <D.13883>:
  _55 = dest + 4;
  _56 = *src;
  *_55 = _56;
  _57 = dest + 2;
  _58 = *_55;
  *_57 = _58;
  _59 = *_57;
  *dest = _59;
  _60 = dest + 6;
  _61 = MEM[(stbi__uint16 *)src + 2B];
  *_60 = _61;
  i = i + -1;
  src = src + 4;
  dest = dest + 8;
  goto <D.13882>;
  <D.10803>:
  goto <D.10792>;
  <D.10783>:
  _62 = x + 4294967295;
  i = (int) _62;
  <D.13884>:
  if (i < 0) goto <D.10805>; else goto <D.13885>;
  <D.13885>:
  _63 = *src;
  *dest = _63;
  _64 = dest + 2;
  _65 = MEM[(stbi__uint16 *)src + 2B];
  *_64 = _65;
  _66 = dest + 4;
  _67 = MEM[(stbi__uint16 *)src + 4B];
  *_66 = _67;
  _68 = dest + 6;
  *_68 = 65535;
  i = i + -1;
  src = src + 6;
  dest = dest + 8;
  goto <D.13884>;
  <D.10805>:
  goto <D.10792>;
  <D.10784>:
  _69 = x + 4294967295;
  i = (int) _69;
  <D.13886>:
  if (i < 0) goto <D.10807>; else goto <D.13887>;
  <D.13887>:
  _70 = src + 4;
  _71 = *_70;
  _72 = (int) _71;
  _73 = src + 2;
  _74 = *_73;
  _75 = (int) _74;
  _76 = *src;
  _77 = (int) _76;
  _78 = stbi__compute_y_16 (_77, _75, _72);
  *dest = _78;
  i = i + -1;
  src = src + 6;
  dest = dest + 2;
  goto <D.13886>;
  <D.10807>:
  goto <D.10792>;
  <D.10785>:
  _79 = x + 4294967295;
  i = (int) _79;
  <D.13888>:
  if (i < 0) goto <D.10809>; else goto <D.13889>;
  <D.13889>:
  _80 = src + 4;
  _81 = *_80;
  _82 = (int) _81;
  _83 = src + 2;
  _84 = *_83;
  _85 = (int) _84;
  _86 = *src;
  _87 = (int) _86;
  _88 = stbi__compute_y_16 (_87, _85, _82);
  *dest = _88;
  _89 = dest + 2;
  *_89 = 65535;
  i = i + -1;
  src = src + 6;
  dest = dest + 4;
  goto <D.13888>;
  <D.10809>:
  goto <D.10792>;
  <D.10786>:
  _90 = x + 4294967295;
  i = (int) _90;
  <D.13890>:
  if (i < 0) goto <D.10811>; else goto <D.13891>;
  <D.13891>:
  _91 = src + 4;
  _92 = *_91;
  _93 = (int) _92;
  _94 = src + 2;
  _95 = *_94;
  _96 = (int) _95;
  _97 = *src;
  _98 = (int) _97;
  _99 = stbi__compute_y_16 (_98, _96, _93);
  *dest = _99;
  i = i + -1;
  src = src + 8;
  dest = dest + 2;
  goto <D.13890>;
  <D.10811>:
  goto <D.10792>;
  <D.10787>:
  _100 = x + 4294967295;
  i = (int) _100;
  <D.13892>:
  if (i < 0) goto <D.10813>; else goto <D.13893>;
  <D.13893>:
  _101 = src + 4;
  _102 = *_101;
  _103 = (int) _102;
  _104 = src + 2;
  _105 = *_104;
  _106 = (int) _105;
  _107 = *src;
  _108 = (int) _107;
  _109 = stbi__compute_y_16 (_108, _106, _103);
  *dest = _109;
  _110 = dest + 2;
  _111 = MEM[(stbi__uint16 *)src + 6B];
  *_110 = _111;
  i = i + -1;
  src = src + 8;
  dest = dest + 4;
  goto <D.13892>;
  <D.10813>:
  goto <D.10792>;
  <D.10788>:
  _112 = x + 4294967295;
  i = (int) _112;
  <D.13894>:
  if (i < 0) goto <D.10815>; else goto <D.13895>;
  <D.13895>:
  _113 = *src;
  *dest = _113;
  _114 = dest + 2;
  _115 = MEM[(stbi__uint16 *)src + 2B];
  *_114 = _115;
  _116 = dest + 4;
  _117 = MEM[(stbi__uint16 *)src + 4B];
  *_116 = _117;
  i = i + -1;
  src = src + 8;
  dest = dest + 6;
  goto <D.13894>;
  <D.10815>:
  goto <D.10792>;
  <D.10789>:
  _assert ("0", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 1787);
  free (data);
  free (good);
  stbi__err ("unsupported");
  D.13861 = 0B;
  goto <D.13896>;
  <D.10792>:
  j = j + 1;
  goto <D.13870>;
  <D.10790>:
  free (data);
  D.13861 = good;
  goto <D.13896>;
  <D.13896>:
  return D.13861;
}



;; Function stbi__ldr_to_hdr (_ZL16stbi__ldr_to_hdrPhiii, funcdef_no=836, decl_uid=10312, cgraph_uid=742, symbol_order=751)

stbi__ldr_to_hdr (stbi_uc * data, int x, int y, int comp)
{
  float * output;
  int n;
  int k;
  int i;
  float * D.13899;

  if (data == 0B) goto <D.13897>; else goto <D.13898>;
  <D.13897>:
  D.13899 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13914>;
  <D.13898>:
  output = stbi__malloc_mad4 (x, y, comp, 4, 0);
  if (output == 0B) goto <D.13900>; else goto <D.13901>;
  <D.13900>:
  free (data);
  stbi__err ("outofmem");
  D.13899 = 0B;
  goto <D.13914>;
  <D.13901>:
  _1 = comp & 1;
  if (_1 != 0) goto <D.13902>; else goto <D.13903>;
  <D.13902>:
  n = comp;
  goto <D.13904>;
  <D.13903>:
  n = comp + -1;
  <D.13904>:
  i = 0;
  <D.13905>:
  _2 = x * y;
  if (i >= _2) goto <D.10834>; else goto <D.13906>;
  <D.13906>:
  k = 0;
  <D.13907>:
  if (k >= n) goto <D.10836>; else goto <D.13908>;
  <D.13908>:
  stbi__l2h_gamma.75_3 = stbi__l2h_gamma;
  _4 = i * comp;
  _5 = k + _4;
  _6 = (sizetype) _5;
  _7 = data + _6;
  _8 = *_7;
  _9 = (int) _8;
  _10 = (float) _9;
  _11 = _10 / 2.55e+2;
  _12 = std::pow (_11, stbi__l2h_gamma.75_3);
  stbi__l2h_scale.76_13 = stbi__l2h_scale;
  _14 = i * comp;
  _15 = k + _14;
  _16 = (long long unsigned int) _15;
  _17 = _16 * 4;
  _18 = output + _17;
  _19 = _12 * stbi__l2h_scale.76_13;
  *_18 = _19;
  k = k + 1;
  goto <D.13907>;
  <D.10836>:
  i = i + 1;
  goto <D.13905>;
  <D.10834>:
  if (n < comp) goto <D.13909>; else goto <D.13910>;
  <D.13909>:
  i = 0;
  <D.13911>:
  _20 = x * y;
  if (i >= _20) goto <D.10838>; else goto <D.13912>;
  <D.13912>:
  _21 = i * comp;
  _22 = n + _21;
  _23 = (sizetype) _22;
  _24 = data + _23;
  _25 = *_24;
  _26 = (int) _25;
  _27 = (float) _26;
  _28 = i * comp;
  _29 = n + _28;
  _30 = (long long unsigned int) _29;
  _31 = _30 * 4;
  _32 = output + _31;
  _33 = _27 / 2.55e+2;
  *_32 = _33;
  i = i + 1;
  goto <D.13911>;
  <D.10838>:
  goto <D.13913>;
  <D.13910>:
  <D.13913>:
  free (data);
  D.13899 = output;
  goto <D.13914>;
  <D.13914>:
  return D.13899;
}



;; Function std::pow (_ZSt3powff, funcdef_no=107, decl_uid=7096, cgraph_uid=65, symbol_order=65)

std::pow (float __x, float __y)
{
  float D.13915;

  D.13915 = __builtin_powf (__x, __y);
  goto <D.13916>;
  <D.13916>:
  return D.13915;
}



;; Function stbi__hdr_to_ldr (_ZL16stbi__hdr_to_ldrPfiii, funcdef_no=837, decl_uid=10317, cgraph_uid=743, symbol_order=752)

stbi__hdr_to_ldr (float * data, int x, int y, int comp)
{
  float z;
  float z;
  stbi_uc * output;
  int n;
  int k;
  int i;
  stbi_uc * D.13919;

  if (data == 0B) goto <D.13917>; else goto <D.13918>;
  <D.13917>:
  D.13919 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13944>;
  <D.13918>:
  output = stbi__malloc_mad3 (x, y, comp, 0);
  if (output == 0B) goto <D.13920>; else goto <D.13921>;
  <D.13920>:
  free (data);
  stbi__err ("outofmem");
  D.13919 = 0B;
  goto <D.13944>;
  <D.13921>:
  _1 = comp & 1;
  if (_1 != 0) goto <D.13922>; else goto <D.13923>;
  <D.13922>:
  n = comp;
  goto <D.13924>;
  <D.13923>:
  n = comp + -1;
  <D.13924>:
  i = 0;
  <D.13925>:
  _2 = x * y;
  if (i >= _2) goto <D.10852>; else goto <D.13926>;
  <D.13926>:
  k = 0;
  <D.13927>:
  if (k >= n) goto <D.10854>; else goto <D.13928>;
  <D.13928>:
  stbi__h2l_gamma_i.77_3 = stbi__h2l_gamma_i;
  _4 = i * comp;
  _5 = k + _4;
  _6 = (long long unsigned int) _5;
  _7 = _6 * 4;
  _8 = data + _7;
  _9 = *_8;
  stbi__h2l_scale_i.78_10 = stbi__h2l_scale_i;
  _11 = _9 * stbi__h2l_scale_i.78_10;
  _12 = std::pow (_11, stbi__h2l_gamma_i.77_3);
  _13 = _12 * 2.55e+2;
  _14 = _13 + 5.0e-1;
  z = _14;
  z.79_15 = z;
  if (z.79_15 < 0.0) goto <D.13929>; else goto <D.13930>;
  <D.13929>:
  z = 0.0;
  goto <D.13931>;
  <D.13930>:
  <D.13931>:
  z.80_16 = z;
  if (z.80_16 > 2.55e+2) goto <D.13932>; else goto <D.13933>;
  <D.13932>:
  z = 2.55e+2;
  goto <D.13934>;
  <D.13933>:
  <D.13934>:
  z.81_17 = z;
  _18 = (int) z.81_17;
  _19 = i * comp;
  _20 = k + _19;
  _21 = (sizetype) _20;
  _22 = output + _21;
  _23 = (unsigned char) _18;
  *_22 = _23;
  z = {CLOBBER};
  k = k + 1;
  goto <D.13927>;
  <D.10854>:
  if (k < comp) goto <D.13935>; else goto <D.13936>;
  <D.13935>:
  _24 = i * comp;
  _25 = k + _24;
  _26 = (long long unsigned int) _25;
  _27 = _26 * 4;
  _28 = data + _27;
  _29 = *_28;
  _30 = _29 * 2.55e+2;
  _31 = _30 + 5.0e-1;
  z = _31;
  z.82_32 = z;
  if (z.82_32 < 0.0) goto <D.13937>; else goto <D.13938>;
  <D.13937>:
  z = 0.0;
  goto <D.13939>;
  <D.13938>:
  <D.13939>:
  z.83_33 = z;
  if (z.83_33 > 2.55e+2) goto <D.13940>; else goto <D.13941>;
  <D.13940>:
  z = 2.55e+2;
  goto <D.13942>;
  <D.13941>:
  <D.13942>:
  z.84_34 = z;
  _35 = (int) z.84_34;
  _36 = i * comp;
  _37 = k + _36;
  _38 = (sizetype) _37;
  _39 = output + _38;
  _40 = (unsigned char) _35;
  *_39 = _40;
  z = {CLOBBER};
  goto <D.13943>;
  <D.13936>:
  <D.13943>:
  i = i + 1;
  goto <D.13925>;
  <D.10852>:
  free (data);
  D.13919 = output;
  goto <D.13944>;
  <D.13944>:
  return D.13919;
}



;; Function stbi__build_huffman (_ZL19stbi__build_huffmanP13stbi__huffmanPi, funcdef_no=838, decl_uid=10936, cgraph_uid=744, symbol_order=753)

stbi__build_huffman (struct stbi__huffman * h, int * count)
{
  int m;
  int c;
  int s;
  unsigned int code;
  int k;
  int j;
  int i;
  int D.13957;

  k = 0;
  i = 0;
  <D.13945>:
  if (i > 15) goto <D.10945>; else goto <D.13946>;
  <D.13946>:
  j = 0;
  <D.13947>:
  _1 = (long long unsigned int) i;
  _2 = _1 * 4;
  _3 = count + _2;
  _4 = *_3;
  if (j >= _4) goto <D.10947>; else goto <D.13948>;
  <D.13948>:
  _5 = (unsigned char) i;
  k.85_6 = k;
  k = k.85_6 + 1;
  _7 = _5 + 1;
  h->size[k.85_6] = _7;
  j = j + 1;
  goto <D.13947>;
  <D.10947>:
  i = i + 1;
  goto <D.13945>;
  <D.10945>:
  h->size[k] = 0;
  code = 0;
  k = 0;
  j = 1;
  <D.13949>:
  if (j > 16) goto <D.10949>; else goto <D.13950>;
  <D.13950>:
  k.86_8 = (unsigned int) k;
  _9 = k.86_8 - code;
  _10 = (int) _9;
  h->delta[j] = _10;
  _11 = h->size[k];
  _12 = (int) _11;
  if (j == _12) goto <D.13951>; else goto <D.13952>;
  <D.13951>:
  <D.13953>:
  _13 = h->size[k];
  _14 = (int) _13;
  if (j != _14) goto <D.10951>; else goto <D.13954>;
  <D.13954>:
  code.87_15 = code;
  code = code.87_15 + 1;
  k.88_16 = k;
  k = k.88_16 + 1;
  _17 = (short unsigned int) code.87_15;
  h->code[k.88_16] = _17;
  goto <D.13953>;
  <D.10951>:
  _18 = code + 4294967295;
  _19 = _18 >> j;
  if (_19 != 0) goto <D.13955>; else goto <D.13956>;
  <D.13955>:
  D.13957 = stbi__err ("bad code lengths");
  goto <D.13966>;
  <D.13956>:
  goto <D.13958>;
  <D.13952>:
  <D.13958>:
  _20 = 16 - j;
  _21 = code << _20;
  h->maxcode[j] = _21;
  code = code << 1;
  j = j + 1;
  goto <D.13949>;
  <D.10949>:
  h->maxcode[j] = 4294967295;
  _22 = &h->fast;
  memset (_22, 255, 512);
  i = 0;
  <D.13959>:
  if (i >= k) goto <D.10953>; else goto <D.13960>;
  <D.13960>:
  _23 = h->size[i];
  s = (int) _23;
  if (s <= 9) goto <D.13961>; else goto <D.13962>;
  <D.13961>:
  _24 = h->code[i];
  _25 = (int) _24;
  _26 = 9 - s;
  c = _25 << _26;
  _27 = 9 - s;
  m = 1 << _27;
  j = 0;
  <D.13963>:
  if (j >= m) goto <D.10955>; else goto <D.13964>;
  <D.13964>:
  _28 = c + j;
  _29 = (unsigned char) i;
  h->fast[_28] = _29;
  j = j + 1;
  goto <D.13963>;
  <D.10955>:
  goto <D.13965>;
  <D.13962>:
  <D.13965>:
  i = i + 1;
  goto <D.13959>;
  <D.10953>:
  D.13957 = 1;
  goto <D.13966>;
  <D.13966>:
  return D.13957;
}



;; Function stbi__build_fast_ac (_ZL19stbi__build_fast_acPsP13stbi__huffman, funcdef_no=839, decl_uid=10959, cgraph_uid=745, symbol_order=754)

stbi__build_fast_ac (stbi__int16 * fast_ac, struct stbi__huffman * h)
{
  int m;
  int k;
  int len;
  int magbits;
  int run;
  int rs;
  stbi_uc fast;
  int i;

  i = 0;
  <D.13967>:
  if (i > 511) goto <D.10969>; else goto <D.13968>;
  <D.13968>:
  fast = h->fast[i];
  _1 = (long long unsigned int) i;
  _2 = _1 * 2;
  _3 = fast_ac + _2;
  *_3 = 0;
  if (fast != 255) goto <D.13969>; else goto <D.13970>;
  <D.13969>:
  _4 = (int) fast;
  _5 = h->values[_4];
  rs = (int) _5;
  _6 = rs >> 4;
  run = _6 & 15;
  magbits = rs & 15;
  _7 = (int) fast;
  _8 = h->size[_7];
  len = (int) _8;
  if (magbits != 0) goto <D.13971>; else goto <D.13972>;
  <D.13971>:
  _9 = len + magbits;
  if (_9 <= 9) goto <D.13973>; else goto <D.13974>;
  <D.13973>:
  _10 = i << len;
  _11 = _10 & 511;
  _12 = 9 - magbits;
  k = _11 >> _12;
  _13 = magbits + -1;
  m = 1 << _13;
  if (k < m) goto <D.13975>; else goto <D.13976>;
  <D.13975>:
  _14 = 4294967295 << magbits;
  k.89_15 = (unsigned int) k;
  _16 = _14 + k.89_15;
  _17 = _16 + 1;
  k = (int) _17;
  goto <D.13977>;
  <D.13976>:
  <D.13977>:
  if (k >= -128) goto <D.13978>; else goto <D.13979>;
  <D.13978>:
  if (k <= 127) goto <D.13980>; else goto <D.13981>;
  <D.13980>:
  _18 = k * 16;
  _19 = run + _18;
  _20 = (unsigned short) _19;
  _21 = _20 * 16;
  _22 = (unsigned short) len;
  _23 = (unsigned short) magbits;
  _24 = _22 + _23;
  _25 = _21 + _24;
  _26 = (long long unsigned int) i;
  _27 = _26 * 2;
  _28 = fast_ac + _27;
  _29 = (short int) _25;
  *_28 = _29;
  goto <D.13982>;
  <D.13981>:
  <D.13982>:
  <D.13979>:
  goto <D.13983>;
  <D.13974>:
  <D.13983>:
  <D.13972>:
  goto <D.13984>;
  <D.13970>:
  <D.13984>:
  i = i + 1;
  goto <D.13967>;
  <D.10969>:
  return;
}



;; Function stbi__grow_buffer_unsafe (_ZL24stbi__grow_buffer_unsafeP10stbi__jpeg, funcdef_no=840, decl_uid=10972, cgraph_uid=746, symbol_order=755)

stbi__grow_buffer_unsafe (struct stbi__jpeg * j)
{
  unsigned char D.14001;
  unsigned char D.14000;
  unsigned char D.13999;
  int c;
  unsigned int b;
  unsigned int iftmp.90;

  <D.13985>:
  _1 = j->nomore;
  if (_1 == 0) goto <D.13987>; else goto <D.13988>;
  <D.13987>:
  _2 = j->s;
  D.13999 = stbi__get8 (_2);
  _3 = D.13999;
  iftmp.90 = (unsigned int) _3;
  goto <D.13989>;
  <D.13988>:
  iftmp.90 = 0;
  <D.13989>:
  b = iftmp.90;
  if (b == 255) goto <D.13990>; else goto <D.13991>;
  <D.13990>:
  _4 = j->s;
  D.14000 = stbi__get8 (_4);
  _5 = D.14000;
  c = (int) _5;
  <D.13992>:
  if (c != 255) goto <D.10978>; else goto <D.13993>;
  <D.13993>:
  _6 = j->s;
  D.14001 = stbi__get8 (_6);
  _7 = D.14001;
  c = (int) _7;
  goto <D.13992>;
  <D.10978>:
  if (c != 0) goto <D.13994>; else goto <D.13995>;
  <D.13994>:
  _8 = (unsigned char) c;
  j->marker = _8;
  j->nomore = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.13998>;
  <D.13995>:
  goto <D.13996>;
  <D.13991>:
  <D.13996>:
  _9 = j->code_buffer;
  _10 = j->code_bits;
  _11 = 24 - _10;
  _12 = b << _11;
  _13 = _9 | _12;
  j->code_buffer = _13;
  _14 = j->code_bits;
  _15 = _14 + 8;
  j->code_bits = _15;
  _16 = j->code_bits;
  if (_16 > 24) goto <D.10976>; else goto <D.13997>;
  <D.13997>:
  goto <D.13985>;
  <D.10976>:
  <D.13998>:
  return;
}



;; Function stbi__jpeg_decode_block (_ZL23stbi__jpeg_decode_blockP10stbi__jpegPsP13stbi__huffmanS3_S1_iPt, funcdef_no=845, decl_uid=11015, cgraph_uid=751, symbol_order=763)

stbi__jpeg_decode_block (struct stbi__jpeg * j, short int * data, struct stbi__huffman * hdc, struct stbi__huffman * hac, stbi__int16 * fac, int b, stbi__uint16 * dequant)
{
  int D.14031;
  int D.14030;
  int D.14029;
  int D.14028;
  int rs;
  int s;
  int r;
  int c;
  unsigned int zig;
  int t;
  int k;
  int dc;
  int diff;
  int iftmp.91;
  int D.14007;

  _1 = j->code_bits;
  if (_1 <= 15) goto <D.14002>; else goto <D.14003>;
  <D.14002>:
  stbi__grow_buffer_unsafe (j);
  goto <D.14004>;
  <D.14003>:
  <D.14004>:
  D.14028 = stbi__jpeg_huff_decode (j, hdc);
  t = D.14028;
  if (t < 0) goto <D.14005>; else goto <D.14006>;
  <D.14005>:
  D.14007 = stbi__err ("bad huffman code");
  goto <D.14027>;
  <D.14006>:
  memset (data, 0, 128);
  if (t != 0) goto <D.14009>; else goto <D.14010>;
  <D.14009>:
  D.14029 = stbi__extend_receive (j, t);
  iftmp.91 = D.14029;
  goto <D.14011>;
  <D.14010>:
  iftmp.91 = 0;
  <D.14011>:
  diff = iftmp.91;
  _2 = j->img_comp[b].dc_pred;
  dc = diff + _2;
  j->img_comp[b].dc_pred = dc;
  _3 = *dequant;
  _4 = (unsigned short) dc;
  _5 = _3 * _4;
  _6 = (short int) _5;
  *data = _6;
  k = 1;
  <D.14012>:
  _7 = j->code_bits;
  if (_7 <= 15) goto <D.14013>; else goto <D.14014>;
  <D.14013>:
  stbi__grow_buffer_unsafe (j);
  goto <D.14015>;
  <D.14014>:
  <D.14015>:
  _8 = j->code_buffer;
  _9 = _8 >> 23;
  c = (int) _9;
  _10 = (long long unsigned int) c;
  _11 = _10 * 2;
  _12 = fac + _11;
  _13 = *_12;
  r = (int) _13;
  if (r != 0) goto <D.14016>; else goto <D.14017>;
  <D.14016>:
  _14 = r >> 4;
  _15 = _14 & 15;
  k = k + _15;
  s = r & 15;
  _16 = j->code_buffer;
  _17 = _16 << s;
  j->code_buffer = _17;
  _18 = j->code_bits;
  _19 = _18 - s;
  j->code_bits = _19;
  k.92_20 = k;
  k = k.92_20 + 1;
  _21 = stbi__jpeg_dezigzag[k.92_20];
  zig = (unsigned int) _21;
  _22 = r >> 8;
  _23 = (unsigned short) _22;
  _24 = (long long unsigned int) zig;
  _25 = _24 * 2;
  _26 = dequant + _25;
  _27 = *_26;
  _28 = _23 * _27;
  _29 = (long long unsigned int) zig;
  _30 = _29 * 2;
  _31 = data + _30;
  _32 = (short int) _28;
  *_31 = _32;
  goto <D.14018>;
  <D.14017>:
  D.14030 = stbi__jpeg_huff_decode (j, hac);
  rs = D.14030;
  if (rs < 0) goto <D.14019>; else goto <D.14020>;
  <D.14019>:
  D.14007 = stbi__err ("bad huffman code");
  goto <D.14027>;
  <D.14020>:
  s = rs & 15;
  r = rs >> 4;
  if (s == 0) goto <D.14021>; else goto <D.14022>;
  <D.14021>:
  if (rs != 240) goto <D.14023>; else goto <D.14024>;
  <D.14023>:
  goto <D.11026>;
  <D.14024>:
  k = k + 16;
  goto <D.14025>;
  <D.14022>:
  k = k + r;
  k.93_33 = k;
  k = k.93_33 + 1;
  _34 = stbi__jpeg_dezigzag[k.93_33];
  zig = (unsigned int) _34;
  D.14031 = stbi__extend_receive (j, s);
  _35 = D.14031;
  _36 = (unsigned short) _35;
  _37 = (long long unsigned int) zig;
  _38 = _37 * 2;
  _39 = dequant + _38;
  _40 = *_39;
  _41 = _36 * _40;
  _42 = (long long unsigned int) zig;
  _43 = _42 * 2;
  _44 = data + _43;
  _45 = (short int) _41;
  *_44 = _45;
  <D.14025>:
  <D.14018>:
  if (k > 63) goto <D.11026>; else goto <D.14026>;
  <D.14026>:
  goto <D.14012>;
  <D.11026>:
  D.14007 = 1;
  goto <D.14027>;
  <D.14027>:
  return D.14007;
}



;; Function stbi__jpeg_huff_decode (_ZL22stbi__jpeg_huff_decodeP10stbi__jpegP13stbi__huffman, funcdef_no=841, decl_uid=10983, cgraph_uid=747, symbol_order=757)

stbi__jpeg_huff_decode (struct stbi__jpeg * j, struct stbi__huffman * h)
{
  int s;
  int k;
  int c;
  unsigned int temp;
  bool iftmp.94;
  int D.14039;

  _1 = j->code_bits;
  if (_1 <= 15) goto <D.14032>; else goto <D.14033>;
  <D.14032>:
  stbi__grow_buffer_unsafe (j);
  goto <D.14034>;
  <D.14033>:
  <D.14034>:
  _2 = j->code_buffer;
  _3 = _2 >> 23;
  c = (int) _3;
  _4 = h->fast[c];
  k = (int) _4;
  if (k <= 254) goto <D.14035>; else goto <D.14036>;
  <D.14035>:
  _5 = h->size[k];
  s = (int) _5;
  _6 = j->code_bits;
  if (s > _6) goto <D.14037>; else goto <D.14038>;
  <D.14037>:
  D.14039 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14052>;
  <D.14038>:
  _7 = j->code_buffer;
  _8 = _7 << s;
  j->code_buffer = _8;
  _9 = j->code_bits;
  _10 = _9 - s;
  j->code_bits = _10;
  _11 = h->values[k];
  D.14039 = (int) _11;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14052>;
  <D.14036>:
  _12 = j->code_buffer;
  temp = _12 >> 16;
  k = 10;
  <D.14040>:
  _13 = h->maxcode[k];
  if (temp < _13) goto <D.14041>; else goto <D.14042>;
  <D.14041>:
  goto <D.10989>;
  <D.14042>:
  k = k + 1;
  goto <D.14040>;
  <D.10989>:
  if (k == 17) goto <D.14043>; else goto <D.14044>;
  <D.14043>:
  _14 = j->code_bits;
  _15 = _14 + -16;
  j->code_bits = _15;
  D.14039 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14052>;
  <D.14044>:
  _16 = j->code_bits;
  if (k > _16) goto <D.14045>; else goto <D.14046>;
  <D.14045>:
  D.14039 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14052>;
  <D.14046>:
  _17 = j->code_buffer;
  _18 = 32 - k;
  _19 = _17 >> _18;
  _20 = stbi__bmask[k];
  _21 = _19 & _20;
  _22 = h->delta[k];
  _23 = (unsigned int) _22;
  _24 = _21 + _23;
  c = (int) _24;
  _25 = j->code_buffer;
  _26 = h->size[c];
  _27 = (int) _26;
  _28 = 32 - _27;
  _29 = _25 >> _28;
  _30 = h->size[c];
  _31 = (int) _30;
  _32 = stbi__bmask[_31];
  _33 = _29 & _32;
  _34 = h->code[c];
  _35 = (unsigned int) _34;
  if (_33 == _35) goto <D.14048>; else goto <D.14051>;
  <D.14051>:
  _assert ("(((j->code_buffer) >> (32 - h->size[c])) & stbi__bmask[h->size[c]]) == h->code[c]", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 2075);
  if (0 != 0) goto <D.14048>; else goto <D.14049>;
  <D.14048>:
  iftmp.94 = 1;
  goto <D.14050>;
  <D.14049>:
  iftmp.94 = 0;
  <D.14050>:
  _36 = j->code_bits;
  _37 = _36 - k;
  j->code_bits = _37;
  _38 = j->code_buffer;
  _39 = _38 << k;
  j->code_buffer = _39;
  _40 = h->values[c];
  D.14039 = (int) _40;
  goto <D.14052>;
  <D.14052>:
  return D.14039;
}



;; Function stbi__extend_receive (_ZL20stbi__extend_receiveP10stbi__jpegi, funcdef_no=842, decl_uid=10994, cgraph_uid=748, symbol_order=759)

stbi__extend_receive (struct stbi__jpeg * j, int n)
{
  int sgn;
  unsigned int k;
  int D.14059;

  _1 = j->code_bits;
  n.95_2 = n;
  if (_1 < n.95_2) goto <D.14053>; else goto <D.14054>;
  <D.14053>:
  stbi__grow_buffer_unsafe (j);
  goto <D.14055>;
  <D.14054>:
  <D.14055>:
  _3 = j->code_buffer;
  _4 = (int) _3;
  sgn = _4 >> 31;
  _5 = j->code_buffer;
  n.96_6 = n;
  k = _5 r<< n.96_6;
  n.97_7 = n;
  if (n.97_7 < 0) goto <D.14056>; else goto <D.14058>;
  <D.14058>:
  n.98_8 = n;
  if (n.98_8 > 16) goto <D.14056>; else goto <D.14057>;
  <D.14056>:
  D.14059 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14060>;
  <D.14057>:
  n.99_9 = n;
  _10 = stbi__bmask[n.99_9];
  _11 = ~_10;
  _12 = k & _11;
  j->code_buffer = _12;
  n.100_13 = n;
  _14 = stbi__bmask[n.100_13];
  k = k & _14;
  _15 = j->code_bits;
  n.101_16 = n;
  _17 = _15 - n.101_16;
  j->code_bits = _17;
  n.102_18 = n;
  _19 = stbi__jbias[n.102_18];
  _20 = ~sgn;
  _21 = _19 & _20;
  _22 = (unsigned int) _21;
  _23 = k + _22;
  D.14059 = (int) _23;
  goto <D.14060>;
  <D.14060>:
  return D.14059;
}



;; Function stbi__jpeg_decode_block_prog_dc (_ZL31stbi__jpeg_decode_block_prog_dcP10stbi__jpegPsP13stbi__huffmani, funcdef_no=846, decl_uid=11032, cgraph_uid=752, symbol_order=764)

stbi__jpeg_decode_block_prog_dc (struct stbi__jpeg * j, short int * data, struct stbi__huffman * hdc, int b)
{
  int D.14083;
  int D.14082;
  int D.14081;
  int t;
  int dc;
  int diff;
  bool retval.104;
  int iftmp.103;
  int D.14063;

  _1 = j->spec_end;
  if (_1 != 0) goto <D.14061>; else goto <D.14062>;
  <D.14061>:
  D.14063 = stbi__err ("can\'t merge dc and ac");
  goto <D.14080>;
  <D.14062>:
  _2 = j->code_bits;
  if (_2 <= 15) goto <D.14064>; else goto <D.14065>;
  <D.14064>:
  stbi__grow_buffer_unsafe (j);
  goto <D.14066>;
  <D.14065>:
  <D.14066>:
  _3 = j->succ_high;
  if (_3 == 0) goto <D.14067>; else goto <D.14068>;
  <D.14067>:
  memset (data, 0, 128);
  D.14081 = stbi__jpeg_huff_decode (j, hdc);
  t = D.14081;
  if (t == -1) goto <D.14069>; else goto <D.14070>;
  <D.14069>:
  D.14063 = stbi__err ("can\'t merge dc and ac");
  goto <D.14080>;
  <D.14070>:
  if (t != 0) goto <D.14072>; else goto <D.14073>;
  <D.14072>:
  D.14082 = stbi__extend_receive (j, t);
  iftmp.103 = D.14082;
  goto <D.14074>;
  <D.14073>:
  iftmp.103 = 0;
  <D.14074>:
  diff = iftmp.103;
  _4 = j->img_comp[b].dc_pred;
  dc = diff + _4;
  j->img_comp[b].dc_pred = dc;
  _5 = j->succ_low;
  _6 = dc << _5;
  _7 = (short int) _6;
  *data = _7;
  goto <D.14075>;
  <D.14068>:
  D.14083 = stbi__jpeg_get_bit (j);
  _8 = D.14083;
  retval.104 = _8 != 0;
  if (retval.104 != 0) goto <D.14077>; else goto <D.14078>;
  <D.14077>:
  _9 = *data;
  _10 = (unsigned short) _9;
  _11 = j->succ_low;
  _12 = 1 << _11;
  _13 = (unsigned short) _12;
  _14 = _10 + _13;
  _15 = (short int) _14;
  *data = _15;
  goto <D.14079>;
  <D.14078>:
  <D.14079>:
  <D.14075>:
  D.14063 = 1;
  goto <D.14080>;
  <D.14080>:
  return D.14063;
}



;; Function stbi__jpeg_get_bit (_ZL18stbi__jpeg_get_bitP10stbi__jpeg, funcdef_no=844, decl_uid=11004, cgraph_uid=750, symbol_order=761)

stbi__jpeg_get_bit (struct stbi__jpeg * j)
{
  unsigned int k;
  int D.14087;

  _1 = j->code_bits;
  if (_1 <= 0) goto <D.14084>; else goto <D.14085>;
  <D.14084>:
  stbi__grow_buffer_unsafe (j);
  goto <D.14086>;
  <D.14085>:
  <D.14086>:
  k = j->code_buffer;
  _2 = j->code_buffer;
  _3 = _2 << 1;
  j->code_buffer = _3;
  _4 = j->code_bits;
  _5 = _4 + -1;
  j->code_bits = _5;
  k.105_6 = (int) k;
  D.14087 = k.105_6 & -2147483648;
  goto <D.14088>;
  <D.14088>:
  return D.14087;
}



;; Function stbi__jpeg_decode_block_prog_ac (_ZL31stbi__jpeg_decode_block_prog_acP10stbi__jpegPsP13stbi__huffmanS1_, funcdef_no=847, decl_uid=11041, cgraph_uid=753, symbol_order=765)

stbi__jpeg_decode_block_prog_ac (struct stbi__jpeg * j, short int * data, struct stbi__huffman * hac, stbi__int16 * fac)
{
  int D.14177;
  int D.14176;
  int D.14175;
  int D.14174;
  int D.14173;
  int D.14172;
  int D.14171;
  int D.14170;
  short int * p;
  int rs;
  int s;
  int r;
  short int * p;
  short int bit;
  int rs;
  int s;
  int r;
  int c;
  unsigned int zig;
  int shift;
  int k;
  bool retval.113;
  bool retval.111;
  int D.11056;
  bool retval.108;
  int D.11050;
  int D.14091;

  _1 = j->spec_start;
  if (_1 == 0) goto <D.14089>; else goto <D.14090>;
  <D.14089>:
  D.14091 = stbi__err ("can\'t merge dc and ac");
  goto <D.14169>;
  <D.14090>:
  _2 = j->succ_high;
  if (_2 == 0) goto <D.14092>; else goto <D.14093>;
  <D.14092>:
  shift = j->succ_low;
  _3 = j->eob_run;
  if (_3 != 0) goto <D.14094>; else goto <D.14095>;
  <D.14094>:
  _4 = j->eob_run;
  _5 = _4 + -1;
  j->eob_run = _5;
  D.14091 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14169>;
  <D.14095>:
  k = j->spec_start;
  <D.14096>:
  _6 = j->code_bits;
  if (_6 <= 15) goto <D.14097>; else goto <D.14098>;
  <D.14097>:
  stbi__grow_buffer_unsafe (j);
  goto <D.14099>;
  <D.14098>:
  <D.14099>:
  _7 = j->code_buffer;
  _8 = _7 >> 23;
  c = (int) _8;
  _9 = (long long unsigned int) c;
  _10 = _9 * 2;
  _11 = fac + _10;
  _12 = *_11;
  r = (int) _12;
  if (r != 0) goto <D.14100>; else goto <D.14101>;
  <D.14100>:
  _13 = r >> 4;
  _14 = _13 & 15;
  k = k + _14;
  s = r & 15;
  _15 = j->code_buffer;
  _16 = _15 << s;
  j->code_buffer = _16;
  _17 = j->code_bits;
  _18 = _17 - s;
  j->code_bits = _18;
  k.106_19 = k;
  k = k.106_19 + 1;
  _20 = stbi__jpeg_dezigzag[k.106_19];
  zig = (unsigned int) _20;
  _21 = r >> 8;
  _22 = _21 << shift;
  _23 = (long long unsigned int) zig;
  _24 = _23 * 2;
  _25 = data + _24;
  _26 = (short int) _22;
  *_25 = _26;
  goto <D.14102>;
  <D.14101>:
  D.14170 = stbi__jpeg_huff_decode (j, hac);
  rs = D.14170;
  if (rs < 0) goto <D.14103>; else goto <D.14104>;
  <D.14103>:
  D.14091 = stbi__err ("bad huffman code");
  goto <D.14169>;
  <D.14104>:
  s = rs & 15;
  r = rs >> 4;
  if (s == 0) goto <D.14105>; else goto <D.14106>;
  <D.14105>:
  if (r <= 14) goto <D.14107>; else goto <D.14108>;
  <D.14107>:
  _27 = 1 << r;
  j->eob_run = _27;
  if (r != 0) goto <D.14109>; else goto <D.14110>;
  <D.14109>:
  D.14171 = stbi__jpeg_get_bits (j, r);
  D.11050 = D.14171;
  _28 = j->eob_run;
  _29 = D.11050 + _28;
  j->eob_run = _29;
  goto <D.14111>;
  <D.14110>:
  <D.14111>:
  _30 = j->eob_run;
  _31 = _30 + -1;
  j->eob_run = _31;
  goto <D.11058>;
  <D.14108>:
  k = k + 16;
  goto <D.14112>;
  <D.14106>:
  k = k + r;
  k.107_32 = k;
  k = k.107_32 + 1;
  _33 = stbi__jpeg_dezigzag[k.107_32];
  zig = (unsigned int) _33;
  D.14172 = stbi__extend_receive (j, s);
  _34 = D.14172;
  _35 = _34 << shift;
  _36 = (long long unsigned int) zig;
  _37 = _36 * 2;
  _38 = data + _37;
  _39 = (short int) _35;
  *_38 = _39;
  <D.14112>:
  <D.14102>:
  _40 = j->spec_end;
  if (k > _40) goto <D.11058>; else goto <D.14113>;
  <D.14113>:
  goto <D.14096>;
  <D.11058>:
  goto <D.14114>;
  <D.14093>:
  _41 = j->succ_low;
  _42 = 1 << _41;
  bit = (short int) _42;
  _43 = j->eob_run;
  if (_43 != 0) goto <D.14115>; else goto <D.14116>;
  <D.14115>:
  _44 = j->eob_run;
  _45 = _44 + -1;
  j->eob_run = _45;
  k = j->spec_start;
  <D.14117>:
  _46 = j->spec_end;
  if (k > _46) goto <D.11060>; else goto <D.14118>;
  <D.14118>:
  _47 = stbi__jpeg_dezigzag[k];
  _48 = (long long unsigned int) _47;
  _49 = _48 * 2;
  p = data + _49;
  _50 = *p;
  if (_50 != 0) goto <D.14119>; else goto <D.14120>;
  <D.14119>:
  D.14173 = stbi__jpeg_get_bit (j);
  _51 = D.14173;
  retval.108 = _51 != 0;
  if (retval.108 != 0) goto <D.14122>; else goto <D.14123>;
  <D.14122>:
  _52 = *p;
  _53 = bit & _52;
  if (_53 == 0) goto <D.14124>; else goto <D.14125>;
  <D.14124>:
  _54 = *p;
  if (_54 > 0) goto <D.14126>; else goto <D.14127>;
  <D.14126>:
  _55 = *p;
  _56 = (unsigned short) _55;
  bit.109_57 = (unsigned short) bit;
  _58 = _56 + bit.109_57;
  _59 = (short int) _58;
  *p = _59;
  goto <D.14128>;
  <D.14127>:
  _60 = *p;
  _61 = (unsigned short) _60;
  bit.110_62 = (unsigned short) bit;
  _63 = _61 - bit.110_62;
  _64 = (short int) _63;
  *p = _64;
  <D.14128>:
  goto <D.14129>;
  <D.14125>:
  <D.14129>:
  goto <D.14130>;
  <D.14123>:
  <D.14130>:
  goto <D.14131>;
  <D.14120>:
  <D.14131>:
  k = k + 1;
  goto <D.14117>;
  <D.11060>:
  goto <D.14132>;
  <D.14116>:
  k = j->spec_start;
  <D.14133>:
  D.14174 = stbi__jpeg_huff_decode (j, hac);
  rs = D.14174;
  if (rs < 0) goto <D.14134>; else goto <D.14135>;
  <D.14134>:
  D.14091 = stbi__err ("bad huffman code");
  goto <D.14169>;
  <D.14135>:
  s = rs & 15;
  r = rs >> 4;
  if (s == 0) goto <D.14136>; else goto <D.14137>;
  <D.14136>:
  if (r <= 14) goto <D.14138>; else goto <D.14139>;
  <D.14138>:
  _65 = 1 << r;
  _66 = _65 + -1;
  j->eob_run = _66;
  if (r != 0) goto <D.14140>; else goto <D.14141>;
  <D.14140>:
  D.14175 = stbi__jpeg_get_bits (j, r);
  D.11056 = D.14175;
  _67 = j->eob_run;
  _68 = D.11056 + _67;
  j->eob_run = _68;
  goto <D.14142>;
  <D.14141>:
  <D.14142>:
  r = 64;
  goto <D.14143>;
  <D.14139>:
  <D.14143>:
  goto <D.14144>;
  <D.14137>:
  if (s != 1) goto <D.14145>; else goto <D.14146>;
  <D.14145>:
  D.14091 = stbi__err ("bad huffman code");
  goto <D.14169>;
  <D.14146>:
  D.14176 = stbi__jpeg_get_bit (j);
  _69 = D.14176;
  retval.111 = _69 != 0;
  if (retval.111 != 0) goto <D.14148>; else goto <D.14149>;
  <D.14148>:
  s = (int) bit;
  goto <D.14150>;
  <D.14149>:
  _70 = (int) bit;
  s = -_70;
  <D.14150>:
  <D.14144>:
  <D.14151>:
  _71 = j->spec_end;
  if (k > _71) goto <D.11064>; else goto <D.14152>;
  <D.14152>:
  k.112_72 = k;
  k = k.112_72 + 1;
  _73 = stbi__jpeg_dezigzag[k.112_72];
  _74 = (long long unsigned int) _73;
  _75 = _74 * 2;
  p = data + _75;
  _76 = *p;
  if (_76 != 0) goto <D.14153>; else goto <D.14154>;
  <D.14153>:
  D.14177 = stbi__jpeg_get_bit (j);
  _77 = D.14177;
  retval.113 = _77 != 0;
  if (retval.113 != 0) goto <D.14156>; else goto <D.14157>;
  <D.14156>:
  _78 = *p;
  _79 = bit & _78;
  if (_79 == 0) goto <D.14158>; else goto <D.14159>;
  <D.14158>:
  _80 = *p;
  if (_80 > 0) goto <D.14160>; else goto <D.14161>;
  <D.14160>:
  _81 = *p;
  _82 = (unsigned short) _81;
  bit.114_83 = (unsigned short) bit;
  _84 = _82 + bit.114_83;
  _85 = (short int) _84;
  *p = _85;
  goto <D.14162>;
  <D.14161>:
  _86 = *p;
  _87 = (unsigned short) _86;
  bit.115_88 = (unsigned short) bit;
  _89 = _87 - bit.115_88;
  _90 = (short int) _89;
  *p = _90;
  <D.14162>:
  goto <D.14163>;
  <D.14159>:
  <D.14163>:
  goto <D.14164>;
  <D.14157>:
  <D.14164>:
  goto <D.14165>;
  <D.14154>:
  if (r == 0) goto <D.14166>; else goto <D.14167>;
  <D.14166>:
  _91 = (short int) s;
  *p = _91;
  goto <D.11064>;
  <D.14167>:
  r = r + -1;
  <D.14165>:
  goto <D.14151>;
  <D.11064>:
  _92 = j->spec_end;
  if (k > _92) goto <D.11062>; else goto <D.14168>;
  <D.14168>:
  goto <D.14133>;
  <D.11062>:
  <D.14132>:
  <D.14114>:
  D.14091 = 1;
  goto <D.14169>;
  <D.14169>:
  return D.14091;
}



;; Function stbi__jpeg_get_bits (_ZL19stbi__jpeg_get_bitsP10stbi__jpegi, funcdef_no=843, decl_uid=11000, cgraph_uid=749, symbol_order=760)

stbi__jpeg_get_bits (struct stbi__jpeg * j, int n)
{
  unsigned int k;
  int D.14181;

  _1 = j->code_bits;
  n.116_2 = n;
  if (_1 < n.116_2) goto <D.14178>; else goto <D.14179>;
  <D.14178>:
  stbi__grow_buffer_unsafe (j);
  goto <D.14180>;
  <D.14179>:
  <D.14180>:
  _3 = j->code_buffer;
  n.117_4 = n;
  k = _3 r<< n.117_4;
  n.118_5 = n;
  _6 = stbi__bmask[n.118_5];
  _7 = ~_6;
  _8 = k & _7;
  j->code_buffer = _8;
  n.119_9 = n;
  _10 = stbi__bmask[n.119_9];
  k = k & _10;
  _11 = j->code_bits;
  n.120_12 = n;
  _13 = _11 - n.120_12;
  j->code_bits = _13;
  D.14181 = (int) k;
  goto <D.14182>;
  <D.14182>:
  return D.14181;
}



;; Function stbi__idct_block (_ZL16stbi__idct_blockPhiPs, funcdef_no=849, decl_uid=11072, cgraph_uid=755, symbol_order=767)

stbi__idct_block (stbi_uc * out, int out_stride, short int * data)
{
  int x3;
  int x2;
  int x1;
  int x0;
  int p5;
  int p4;
  int p3;
  int p2;
  int p1;
  int t3;
  int t2;
  int t1;
  int t0;
  int x3;
  int x2;
  int x1;
  int x0;
  int p5;
  int p4;
  int p3;
  int p2;
  int p1;
  int t3;
  int t2;
  int t1;
  int t0;
  int dcterm;
  short int * d;
  stbi_uc * o;
  int * v;
  int val[64];
  int i;

  v = &val;
  d = data;
  i = 0;
  <D.14183>:
  if (i > 7) goto <D.11106>; else goto <D.14184>;
  <D.14184>:
  _1 = d + 16;
  _2 = *_1;
  if (_2 == 0) goto <D.14187>; else goto <D.14185>;
  <D.14187>:
  _3 = d + 32;
  _4 = *_3;
  if (_4 == 0) goto <D.14188>; else goto <D.14185>;
  <D.14188>:
  _5 = d + 48;
  _6 = *_5;
  if (_6 == 0) goto <D.14189>; else goto <D.14185>;
  <D.14189>:
  _7 = d + 64;
  _8 = *_7;
  if (_8 == 0) goto <D.14190>; else goto <D.14185>;
  <D.14190>:
  _9 = d + 80;
  _10 = *_9;
  if (_10 == 0) goto <D.14191>; else goto <D.14185>;
  <D.14191>:
  _11 = d + 96;
  _12 = *_11;
  if (_12 == 0) goto <D.14192>; else goto <D.14185>;
  <D.14192>:
  _13 = d + 112;
  _14 = *_13;
  if (_14 == 0) goto <D.14193>; else goto <D.14185>;
  <D.14193>:
  _15 = *d;
  _16 = (int) _15;
  dcterm = _16 * 4;
  _17 = v + 224;
  *_17 = dcterm;
  _18 = v + 192;
  _19 = *_17;
  *_18 = _19;
  _20 = v + 160;
  _21 = *_18;
  *_20 = _21;
  _22 = v + 128;
  _23 = *_20;
  *_22 = _23;
  _24 = v + 96;
  _25 = *_22;
  *_24 = _25;
  _26 = v + 64;
  _27 = *_24;
  *_26 = _27;
  _28 = v + 32;
  _29 = *_26;
  *_28 = _29;
  _30 = *_28;
  *v = _30;
  goto <D.14186>;
  <D.14185>:
  _31 = d + 32;
  _32 = *_31;
  p2 = (int) _32;
  _33 = d + 96;
  _34 = *_33;
  p3 = (int) _34;
  _35 = p2 + p3;
  p1 = _35 * 2217;
  _36 = p3 * -7567;
  t2 = p1 + _36;
  _37 = p2 * 3135;
  t3 = p1 + _37;
  _38 = *d;
  p2 = (int) _38;
  _39 = d + 64;
  _40 = *_39;
  p3 = (int) _40;
  _41 = p2 + p3;
  t0 = _41 * 4096;
  _42 = p2 - p3;
  t1 = _42 * 4096;
  x0 = t0 + t3;
  x3 = t0 - t3;
  x1 = t1 + t2;
  x2 = t1 - t2;
  _43 = d + 112;
  _44 = *_43;
  t0 = (int) _44;
  _45 = d + 80;
  _46 = *_45;
  t1 = (int) _46;
  _47 = d + 48;
  _48 = *_47;
  t2 = (int) _48;
  _49 = d + 16;
  _50 = *_49;
  t3 = (int) _50;
  p3 = t0 + t2;
  p4 = t1 + t3;
  p1 = t0 + t3;
  p2 = t1 + t2;
  _51 = p3 + p4;
  p5 = _51 * 4816;
  t0 = t0 * 1223;
  t1 = t1 * 8410;
  t2 = t2 * 12586;
  t3 = t3 * 6149;
  _52 = p1 * -3685;
  p1 = p5 + _52;
  _53 = p2 * -10497;
  p2 = p5 + _53;
  p3 = p3 * -8034;
  p4 = p4 * -1597;
  _54 = p1 + p4;
  t3 = t3 + _54;
  _55 = p2 + p3;
  t2 = t2 + _55;
  _56 = p2 + p4;
  t1 = t1 + _56;
  _57 = p1 + p3;
  t0 = t0 + _57;
  x0 = x0 + 512;
  x1 = x1 + 512;
  x2 = x2 + 512;
  x3 = x3 + 512;
  _58 = x0 + t3;
  _59 = _58 >> 10;
  *v = _59;
  _60 = x0 - t3;
  _61 = v + 224;
  _62 = _60 >> 10;
  *_61 = _62;
  _63 = x1 + t2;
  _64 = v + 32;
  _65 = _63 >> 10;
  *_64 = _65;
  _66 = x1 - t2;
  _67 = v + 192;
  _68 = _66 >> 10;
  *_67 = _68;
  _69 = x2 + t1;
  _70 = v + 64;
  _71 = _69 >> 10;
  *_70 = _71;
  _72 = x2 - t1;
  _73 = v + 160;
  _74 = _72 >> 10;
  *_73 = _74;
  _75 = x3 + t0;
  _76 = v + 96;
  _77 = _75 >> 10;
  *_76 = _77;
  _78 = x3 - t0;
  _79 = v + 128;
  _80 = _78 >> 10;
  *_79 = _80;
  <D.14186>:
  i = i + 1;
  d = d + 2;
  v = v + 4;
  goto <D.14183>;
  <D.11106>:
  i = 0;
  v = &val;
  o = out;
  <D.14194>:
  if (i > 7) goto <D.11108>; else goto <D.14195>;
  <D.14195>:
  p2 = MEM[(int *)v + 8B];
  p3 = MEM[(int *)v + 24B];
  _81 = p2 + p3;
  p1 = _81 * 2217;
  _82 = p3 * -7567;
  t2 = p1 + _82;
  _83 = p2 * 3135;
  t3 = p1 + _83;
  p2 = *v;
  p3 = MEM[(int *)v + 16B];
  _84 = p2 + p3;
  t0 = _84 * 4096;
  _85 = p2 - p3;
  t1 = _85 * 4096;
  x0 = t0 + t3;
  x3 = t0 - t3;
  x1 = t1 + t2;
  x2 = t1 - t2;
  t0 = MEM[(int *)v + 28B];
  t1 = MEM[(int *)v + 20B];
  t2 = MEM[(int *)v + 12B];
  t3 = MEM[(int *)v + 4B];
  p3 = t0 + t2;
  p4 = t1 + t3;
  p1 = t0 + t3;
  p2 = t1 + t2;
  _86 = p3 + p4;
  p5 = _86 * 4816;
  t0 = t0 * 1223;
  t1 = t1 * 8410;
  t2 = t2 * 12586;
  t3 = t3 * 6149;
  _87 = p1 * -3685;
  p1 = p5 + _87;
  _88 = p2 * -10497;
  p2 = p5 + _88;
  p3 = p3 * -8034;
  p4 = p4 * -1597;
  _89 = p1 + p4;
  t3 = t3 + _89;
  _90 = p2 + p3;
  t2 = t2 + _90;
  _91 = p2 + p4;
  t1 = t1 + _91;
  _92 = p1 + p3;
  t0 = t0 + _92;
  x0 = x0 + 16842752;
  x1 = x1 + 16842752;
  x2 = x2 + 16842752;
  x3 = x3 + 16842752;
  _93 = x0 + t3;
  _94 = _93 >> 17;
  _95 = stbi__clamp (_94);
  *o = _95;
  _96 = x0 - t3;
  _97 = _96 >> 17;
  _98 = o + 7;
  _99 = stbi__clamp (_97);
  *_98 = _99;
  _100 = x1 + t2;
  _101 = _100 >> 17;
  _102 = o + 1;
  _103 = stbi__clamp (_101);
  *_102 = _103;
  _104 = x1 - t2;
  _105 = _104 >> 17;
  _106 = o + 6;
  _107 = stbi__clamp (_105);
  *_106 = _107;
  _108 = x2 + t1;
  _109 = _108 >> 17;
  _110 = o + 2;
  _111 = stbi__clamp (_109);
  *_110 = _111;
  _112 = x2 - t1;
  _113 = _112 >> 17;
  _114 = o + 5;
  _115 = stbi__clamp (_113);
  *_114 = _115;
  _116 = x3 + t0;
  _117 = _116 >> 17;
  _118 = o + 3;
  _119 = stbi__clamp (_117);
  *_118 = _119;
  _120 = x3 - t0;
  _121 = _120 >> 17;
  _122 = o + 4;
  _123 = stbi__clamp (_121);
  *_122 = _123;
  i = i + 1;
  v = v + 32;
  _124 = (sizetype) out_stride;
  o = o + _124;
  goto <D.14194>;
  <D.11108>:
  val = {CLOBBER};
  return;
}



;; Function stbi__clamp (_ZL11stbi__clampi, funcdef_no=848, decl_uid=11067, cgraph_uid=754, symbol_order=766)

stbi__clamp (int x)
{
  stbi_uc D.14200;

  x.121_1 = (unsigned int) x;
  if (x.121_1 > 255) goto <D.14196>; else goto <D.14197>;
  <D.14196>:
  if (x < 0) goto <D.14198>; else goto <D.14199>;
  <D.14198>:
  D.14200 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14204>;
  <D.14199>:
  if (x > 255) goto <D.14201>; else goto <D.14202>;
  <D.14201>:
  D.14200 = 255;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14204>;
  <D.14202>:
  goto <D.14203>;
  <D.14197>:
  <D.14203>:
  D.14200 = (stbi_uc) x;
  goto <D.14204>;
  <D.14204>:
  return D.14200;
}



;; Function stbi__idct_simd (_ZL15stbi__idct_simdPhiPs, funcdef_no=850, decl_uid=11113, cgraph_uid=756, symbol_order=768)

stbi__idct_simd (stbi_uc * out, int out_stride, short int * data)
{
  vector(4) int D.14362;
  vector(4) int D.14361;
  vector(4) int D.14360;
  vector(4) int D.14359;
  vector(2) long long int D.14358;
  vector(2) long long int D.14357;
  vector(2) long long int D.14356;
  vector(2) long long int D.14355;
  vector(2) long long int D.14354;
  vector(2) long long int D.14353;
  vector(2) long long int D.14352;
  vector(2) long long int D.14351;
  vector(2) long long int D.14350;
  vector(2) long long int D.14349;
  vector(2) long long int D.14348;
  vector(2) long long int D.14347;
  vector(2) long long int D.14346;
  vector(2) long long int D.14345;
  vector(2) long long int D.14344;
  vector(2) long long int D.14343;
  __m128i D.14341;
  vector(2) long long int D.14340;
  vector(2) long long int D.14339;
  vector(2) long long int D.14338;
  vector(2) long long int D.14337;
  vector(2) long long int D.14336;
  vector(2) long long int D.14335;
  vector(2) long long int D.14334;
  vector(2) long long int D.14333;
  vector(2) long long int D.14332;
  vector(2) long long int D.14331;
  vector(2) long long int D.14330;
  vector(2) long long int D.14329;
  vector(2) long long int D.14328;
  vector(2) long long int D.14327;
  vector(2) long long int D.14326;
  vector(2) long long int D.14325;
  vector(2) long long int D.14324;
  vector(2) long long int D.14323;
  vector(2) long long int D.14322;
  vector(2) long long int D.14321;
  __m128i D.14320;
  vector(2) long long int D.14319;
  vector(2) long long int D.14318;
  __m128i D.14317;
  __m128i D.14316;
  __m128i D.14315;
  __m128i D.14314;
  __m128i D.14313;
  __m128i D.14312;
  __m128i D.14311;
  __m128i D.14310;
  __m128i D.14309;
  __m128i D.14308;
  __m128i D.14307;
  __m128i D.14306;
  __m128i D.14305;
  __m128i D.14304;
  __m128i D.14303;
  __m128i D.14302;
  __m128i D.14301;
  __m128i D.14300;
  __m128i D.14299;
  vector(2) long long int D.14298;
  __m128i D.14297;
  vector(2) long long int D.14296;
  __m128i D.14295;
  vector(2) long long int D.14294;
  __m128i D.14293;
  vector(2) long long int D.14292;
  __m128i D.14291;
  __m128i D.14290;
  __m128i D.14289;
  __m128i D.14288;
  __m128i D.14287;
  __m128i D.14286;
  vector(2) long long int D.14285;
  vector(2) long long int D.14284;
  vector(2) long long int D.14283;
  __m128i D.14282;
  vector(2) long long int D.14281;
  vector(2) long long int D.14280;
  vector(2) long long int D.14279;
  __m128i D.14278;
  vector(2) long long int D.14277;
  vector(2) long long int D.14276;
  vector(2) long long int D.14275;
  __m128i D.14274;
  vector(2) long long int D.14273;
  vector(2) long long int D.14272;
  vector(2) long long int D.14271;
  __m128i D.14270;
  vector(2) long long int D.14269;
  vector(2) long long int D.14268;
  vector(2) long long int D.14267;
  vector(2) long long int D.14266;
  vector(2) long long int D.14265;
  vector(2) long long int D.14264;
  __m128i D.14263;
  __m128i D.14262;
  __m128i D.14260;
  vector(2) long long int D.14259;
  vector(2) long long int D.14258;
  vector(2) long long int D.14257;
  vector(2) long long int D.14256;
  vector(2) long long int D.14255;
  vector(2) long long int D.14254;
  vector(2) long long int D.14253;
  vector(2) long long int D.14252;
  vector(2) long long int D.14251;
  vector(2) long long int D.14250;
  vector(2) long long int D.14249;
  vector(2) long long int D.14248;
  vector(2) long long int D.14247;
  vector(2) long long int D.14246;
  vector(2) long long int D.14245;
  vector(2) long long int D.14244;
  vector(2) long long int D.14243;
  vector(2) long long int D.14242;
  vector(2) long long int D.14241;
  vector(2) long long int D.14240;
  __m128i D.14239;
  vector(2) long long int D.14238;
  vector(2) long long int D.14237;
  __m128i D.14236;
  __m128i D.14235;
  __m128i D.14234;
  __m128i D.14233;
  __m128i D.14232;
  __m128i D.14231;
  __m128i D.14230;
  __m128i D.14229;
  __m128i D.14228;
  __m128i D.14227;
  __m128i D.14226;
  __m128i D.14225;
  __m128i D.14224;
  __m128i D.14223;
  __m128i D.14222;
  __m128i D.14221;
  __m128i D.14220;
  __m128i D.14219;
  __m128i D.14218;
  vector(2) long long int D.14217;
  __m128i D.14216;
  vector(2) long long int D.14215;
  __m128i D.14214;
  vector(2) long long int D.14213;
  __m128i D.14212;
  vector(2) long long int D.14211;
  __m128i D.14210;
  __m128i D.14209;
  __m128i D.14208;
  __m128i D.14207;
  __m128i D.14206;
  __m128i D.14205;
  __m128i p3;
  __m128i p2;
  __m128i p1;
  __m128i p0;
  __m128i dif_h;
  __m128i dif_l;
  __m128i sum_h;
  __m128i sum_l;
  __m128i abiased_h;
  __m128i abiased_l;
  __m128i dif_h;
  __m128i dif_l;
  __m128i sum_h;
  __m128i sum_l;
  __m128i abiased_h;
  __m128i abiased_l;
  __m128i dif_h;
  __m128i dif_l;
  __m128i sum_h;
  __m128i sum_l;
  __m128i abiased_h;
  __m128i abiased_l;
  __m128i dif_h;
  __m128i dif_l;
  __m128i sum_h;
  __m128i sum_l;
  __m128i abiased_h;
  __m128i abiased_l;
  __m128i x7_h;
  __m128i x7_l;
  __m128i x6_h;
  __m128i x6_l;
  __m128i x5_h;
  __m128i x5_l;
  __m128i x4_h;
  __m128i x4_l;
  __m128i y5o_h;
  __m128i y5o_l;
  __m128i y4o_h;
  __m128i y4o_l;
  __m128i rot1_0hi;
  __m128i rot1_0lo;
  __m128i sum35;
  __m128i sum17;
  __m128i y3o_h;
  __m128i y3o_l;
  __m128i y1o_h;
  __m128i y1o_l;
  __m128i rot3_0hi;
  __m128i rot3_0lo;
  __m128i y2o_h;
  __m128i y2o_l;
  __m128i y0o_h;
  __m128i y0o_l;
  __m128i rot2_0hi;
  __m128i rot2_0lo;
  __m128i x2_h;
  __m128i x2_l;
  __m128i x1_h;
  __m128i x1_l;
  __m128i x3_h;
  __m128i x3_l;
  __m128i x0_h;
  __m128i x0_l;
  __m128i t1e_h;
  __m128i t1e_l;
  __m128i t0e_h;
  __m128i t0e_l;
  __m128i dif04;
  __m128i sum04;
  __m128i t3e_h;
  __m128i t3e_l;
  __m128i t2e_h;
  __m128i t2e_l;
  __m128i rot0_0hi;
  __m128i rot0_0lo;
  __m128i dif_h;
  __m128i dif_l;
  __m128i sum_h;
  __m128i sum_l;
  __m128i abiased_h;
  __m128i abiased_l;
  __m128i dif_h;
  __m128i dif_l;
  __m128i sum_h;
  __m128i sum_l;
  __m128i abiased_h;
  __m128i abiased_l;
  __m128i dif_h;
  __m128i dif_l;
  __m128i sum_h;
  __m128i sum_l;
  __m128i abiased_h;
  __m128i abiased_l;
  __m128i dif_h;
  __m128i dif_l;
  __m128i sum_h;
  __m128i sum_l;
  __m128i abiased_h;
  __m128i abiased_l;
  __m128i x7_h;
  __m128i x7_l;
  __m128i x6_h;
  __m128i x6_l;
  __m128i x5_h;
  __m128i x5_l;
  __m128i x4_h;
  __m128i x4_l;
  __m128i y5o_h;
  __m128i y5o_l;
  __m128i y4o_h;
  __m128i y4o_l;
  __m128i rot1_0hi;
  __m128i rot1_0lo;
  __m128i sum35;
  __m128i sum17;
  __m128i y3o_h;
  __m128i y3o_l;
  __m128i y1o_h;
  __m128i y1o_l;
  __m128i rot3_0hi;
  __m128i rot3_0lo;
  __m128i y2o_h;
  __m128i y2o_l;
  __m128i y0o_h;
  __m128i y0o_l;
  __m128i rot2_0hi;
  __m128i rot2_0lo;
  __m128i x2_h;
  __m128i x2_l;
  __m128i x1_h;
  __m128i x1_l;
  __m128i x3_h;
  __m128i x3_l;
  __m128i x0_h;
  __m128i x0_l;
  __m128i t1e_h;
  __m128i t1e_l;
  __m128i t0e_h;
  __m128i t0e_l;
  __m128i dif04;
  __m128i sum04;
  __m128i t3e_h;
  __m128i t3e_l;
  __m128i t2e_h;
  __m128i t2e_l;
  __m128i rot0_0hi;
  __m128i rot0_0lo;
  __m128i bias_1;
  __m128i bias_0;
  __m128i rot3_1;
  __m128i rot3_0;
  __m128i rot2_1;
  __m128i rot2_0;
  __m128i rot1_1;
  __m128i rot1_0;
  __m128i rot0_1;
  __m128i rot0_0;
  __m128i tmp;
  __m128i row7;
  __m128i row6;
  __m128i row5;
  __m128i row4;
  __m128i row3;
  __m128i row2;
  __m128i row1;
  __m128i row0;

  rot0_0 = _mm_setr_epi16 (2217, -5350, 2217, -5350, 2217, -5350, 2217, -5350);
  rot0_1 = _mm_setr_epi16 (5352, 2217, 5352, 2217, 5352, 2217, 5352, 2217);
  rot1_0 = _mm_setr_epi16 (1131, 4816, 1131, 4816, 1131, 4816, 1131, 4816);
  rot1_1 = _mm_setr_epi16 (4816, -5681, 4816, -5681, 4816, -5681, 4816, -5681);
  rot2_0 = _mm_setr_epi16 (-6811, -8034, -6811, -8034, -6811, -8034, -6811, -8034);
  rot2_1 = _mm_setr_epi16 (-8034, 4552, -8034, 4552, -8034, 4552, -8034, 4552);
  rot3_0 = _mm_setr_epi16 (6813, -1597, 6813, -1597, 6813, -1597, 6813, -1597);
  rot3_1 = _mm_setr_epi16 (-1597, 4552, -1597, 4552, -1597, 4552, -1597, 4552);
  bias_0 = _mm_set1_epi32 (512);
  bias_1 = _mm_set1_epi32 (16842752);
  row0 = _mm_load_si128 (data);
  _1 = data + 16;
  _2 = _mm_load_si128 (_1);
  row1 = _2;
  _3 = data + 32;
  _4 = _mm_load_si128 (_3);
  row2 = _4;
  _5 = data + 48;
  _6 = _mm_load_si128 (_5);
  row3 = _6;
  _7 = data + 64;
  row4 = _mm_load_si128 (_7);
  _8 = data + 80;
  _9 = _mm_load_si128 (_8);
  row5 = _9;
  _10 = data + 96;
  _11 = _mm_load_si128 (_10);
  row6 = _11;
  _12 = data + 112;
  _13 = _mm_load_si128 (_12);
  row7 = _13;
  row6.122_14 = row6;
  row2.123_15 = row2;
  D.14205 = _mm_unpacklo_epi16 (row2.123_15, row6.122_14);
  rot0_0lo = D.14205;
  row6.124_16 = row6;
  row2.125_17 = row2;
  D.14206 = _mm_unpackhi_epi16 (row2.125_17, row6.124_16);
  rot0_0hi = D.14206;
  D.14207 = _mm_madd_epi16 (rot0_0lo, rot0_0);
  t2e_l = D.14207;
  D.14208 = _mm_madd_epi16 (rot0_0hi, rot0_0);
  t2e_h = D.14208;
  D.14209 = _mm_madd_epi16 (rot0_0lo, rot0_1);
  t3e_l = D.14209;
  D.14210 = _mm_madd_epi16 (rot0_0hi, rot0_1);
  t3e_h = D.14210;
  _18 = _mm_add_epi16 (row0, row4);
  sum04 = _18;
  _19 = _mm_sub_epi16 (row0, row4);
  dif04 = _19;
  sum04.126_20 = sum04;
  _21 = _mm_setzero_si128 ();
  D.14211 = _mm_unpacklo_epi16 (_21, sum04.126_20);
  _22 = D.14211;
  D.14212 = _mm_srai_epi32 (_22, 4);
  t0e_l = D.14212;
  sum04.127_23 = sum04;
  _24 = _mm_setzero_si128 ();
  D.14213 = _mm_unpackhi_epi16 (_24, sum04.127_23);
  _25 = D.14213;
  D.14214 = _mm_srai_epi32 (_25, 4);
  t0e_h = D.14214;
  dif04.128_26 = dif04;
  _27 = _mm_setzero_si128 ();
  D.14215 = _mm_unpacklo_epi16 (_27, dif04.128_26);
  _28 = D.14215;
  D.14216 = _mm_srai_epi32 (_28, 4);
  t1e_l = D.14216;
  dif04.129_29 = dif04;
  _30 = _mm_setzero_si128 ();
  D.14217 = _mm_unpackhi_epi16 (_30, dif04.129_29);
  _31 = D.14217;
  D.14218 = _mm_srai_epi32 (_31, 4);
  t1e_h = D.14218;
  x0_l = _mm_add_epi32 (t0e_l, t3e_l);
  x0_h = _mm_add_epi32 (t0e_h, t3e_h);
  x3_l = _mm_sub_epi32 (t0e_l, t3e_l);
  x3_h = _mm_sub_epi32 (t0e_h, t3e_h);
  x1_l = _mm_add_epi32 (t1e_l, t2e_l);
  x1_h = _mm_add_epi32 (t1e_h, t2e_h);
  x2_l = _mm_sub_epi32 (t1e_l, t2e_l);
  x2_h = _mm_sub_epi32 (t1e_h, t2e_h);
  row3.130_32 = row3;
  row7.131_33 = row7;
  D.14219 = _mm_unpacklo_epi16 (row7.131_33, row3.130_32);
  rot2_0lo = D.14219;
  row3.132_34 = row3;
  row7.133_35 = row7;
  D.14220 = _mm_unpackhi_epi16 (row7.133_35, row3.132_34);
  rot2_0hi = D.14220;
  D.14221 = _mm_madd_epi16 (rot2_0lo, rot2_0);
  y0o_l = D.14221;
  D.14222 = _mm_madd_epi16 (rot2_0hi, rot2_0);
  y0o_h = D.14222;
  D.14223 = _mm_madd_epi16 (rot2_0lo, rot2_1);
  y2o_l = D.14223;
  D.14224 = _mm_madd_epi16 (rot2_0hi, rot2_1);
  y2o_h = D.14224;
  row1.134_36 = row1;
  row5.135_37 = row5;
  D.14225 = _mm_unpacklo_epi16 (row5.135_37, row1.134_36);
  rot3_0lo = D.14225;
  row1.136_38 = row1;
  row5.137_39 = row5;
  D.14226 = _mm_unpackhi_epi16 (row5.137_39, row1.136_38);
  rot3_0hi = D.14226;
  D.14227 = _mm_madd_epi16 (rot3_0lo, rot3_0);
  y1o_l = D.14227;
  D.14228 = _mm_madd_epi16 (rot3_0hi, rot3_0);
  y1o_h = D.14228;
  D.14229 = _mm_madd_epi16 (rot3_0lo, rot3_1);
  y3o_l = D.14229;
  D.14230 = _mm_madd_epi16 (rot3_0hi, rot3_1);
  y3o_h = D.14230;
  row7.138_40 = row7;
  row1.139_41 = row1;
  _42 = _mm_add_epi16 (row1.139_41, row7.138_40);
  sum17 = _42;
  row5.140_43 = row5;
  row3.141_44 = row3;
  _45 = _mm_add_epi16 (row3.141_44, row5.140_43);
  sum35 = _45;
  sum35.142_46 = sum35;
  sum17.143_47 = sum17;
  D.14231 = _mm_unpacklo_epi16 (sum17.143_47, sum35.142_46);
  rot1_0lo = D.14231;
  sum35.144_48 = sum35;
  sum17.145_49 = sum17;
  D.14232 = _mm_unpackhi_epi16 (sum17.145_49, sum35.144_48);
  rot1_0hi = D.14232;
  D.14233 = _mm_madd_epi16 (rot1_0lo, rot1_0);
  y4o_l = D.14233;
  D.14234 = _mm_madd_epi16 (rot1_0hi, rot1_0);
  y4o_h = D.14234;
  D.14235 = _mm_madd_epi16 (rot1_0lo, rot1_1);
  y5o_l = D.14235;
  D.14236 = _mm_madd_epi16 (rot1_0hi, rot1_1);
  y5o_h = D.14236;
  x4_l = _mm_add_epi32 (y0o_l, y4o_l);
  x4_h = _mm_add_epi32 (y0o_h, y4o_h);
  x5_l = _mm_add_epi32 (y1o_l, y5o_l);
  x5_h = _mm_add_epi32 (y1o_h, y5o_h);
  x6_l = _mm_add_epi32 (y2o_l, y5o_l);
  x6_h = _mm_add_epi32 (y2o_h, y5o_h);
  x7_l = _mm_add_epi32 (y3o_l, y4o_l);
  x7_h = _mm_add_epi32 (y3o_h, y4o_h);
  abiased_l = _mm_add_epi32 (x0_l, bias_0);
  abiased_h = _mm_add_epi32 (x0_h, bias_0);
  sum_l = _mm_add_epi32 (abiased_l, x7_l);
  sum_h = _mm_add_epi32 (abiased_h, x7_h);
  dif_l = _mm_sub_epi32 (abiased_l, x7_l);
  dif_h = _mm_sub_epi32 (abiased_h, x7_h);
  D.14237 = _mm_srai_epi32 (sum_h, 10);
  _50 = D.14237;
  D.14238 = _mm_srai_epi32 (sum_l, 10);
  _51 = D.14238;
  D.14239 = _mm_packs_epi32 (_51, _50);
  row0 = D.14239;
  D.14240 = _mm_srai_epi32 (dif_h, 10);
  _52 = D.14240;
  D.14241 = _mm_srai_epi32 (dif_l, 10);
  _53 = D.14241;
  D.14242 = _mm_packs_epi32 (_53, _52);
  _54 = D.14242;
  row7 = _54;
  abiased_l = _mm_add_epi32 (x1_l, bias_0);
  abiased_h = _mm_add_epi32 (x1_h, bias_0);
  sum_l = _mm_add_epi32 (abiased_l, x6_l);
  sum_h = _mm_add_epi32 (abiased_h, x6_h);
  dif_l = _mm_sub_epi32 (abiased_l, x6_l);
  dif_h = _mm_sub_epi32 (abiased_h, x6_h);
  D.14243 = _mm_srai_epi32 (sum_h, 10);
  _55 = D.14243;
  D.14244 = _mm_srai_epi32 (sum_l, 10);
  _56 = D.14244;
  D.14245 = _mm_packs_epi32 (_56, _55);
  _57 = D.14245;
  row1 = _57;
  D.14246 = _mm_srai_epi32 (dif_h, 10);
  _58 = D.14246;
  D.14247 = _mm_srai_epi32 (dif_l, 10);
  _59 = D.14247;
  D.14248 = _mm_packs_epi32 (_59, _58);
  _60 = D.14248;
  row6 = _60;
  abiased_l = _mm_add_epi32 (x2_l, bias_0);
  abiased_h = _mm_add_epi32 (x2_h, bias_0);
  sum_l = _mm_add_epi32 (abiased_l, x5_l);
  sum_h = _mm_add_epi32 (abiased_h, x5_h);
  dif_l = _mm_sub_epi32 (abiased_l, x5_l);
  dif_h = _mm_sub_epi32 (abiased_h, x5_h);
  D.14249 = _mm_srai_epi32 (sum_h, 10);
  _61 = D.14249;
  D.14250 = _mm_srai_epi32 (sum_l, 10);
  _62 = D.14250;
  D.14251 = _mm_packs_epi32 (_62, _61);
  _63 = D.14251;
  row2 = _63;
  D.14252 = _mm_srai_epi32 (dif_h, 10);
  _64 = D.14252;
  D.14253 = _mm_srai_epi32 (dif_l, 10);
  _65 = D.14253;
  D.14254 = _mm_packs_epi32 (_65, _64);
  _66 = D.14254;
  row5 = _66;
  abiased_l = _mm_add_epi32 (x3_l, bias_0);
  abiased_h = _mm_add_epi32 (x3_h, bias_0);
  sum_l = _mm_add_epi32 (abiased_l, x4_l);
  sum_h = _mm_add_epi32 (abiased_h, x4_h);
  dif_l = _mm_sub_epi32 (abiased_l, x4_l);
  dif_h = _mm_sub_epi32 (abiased_h, x4_h);
  D.14255 = _mm_srai_epi32 (sum_h, 10);
  _67 = D.14255;
  D.14256 = _mm_srai_epi32 (sum_l, 10);
  _68 = D.14256;
  D.14257 = _mm_packs_epi32 (_68, _67);
  _69 = D.14257;
  row3 = _69;
  D.14258 = _mm_srai_epi32 (dif_h, 10);
  _70 = D.14258;
  D.14259 = _mm_srai_epi32 (dif_l, 10);
  _71 = D.14259;
  D.14260 = _mm_packs_epi32 (_71, _70);
  row4 = D.14260;
  sum04 = {CLOBBER};
  dif04 = {CLOBBER};
  sum17 = {CLOBBER};
  sum35 = {CLOBBER};
  tmp = row0;
  D.14262 = _mm_unpacklo_epi16 (row0, row4);
  row0 = D.14262;
  D.14263 = _mm_unpackhi_epi16 (tmp, row4);
  row4 = D.14263;
  tmp = row1;
  row5.146_72 = row5;
  row1.147_73 = row1;
  D.14264 = _mm_unpacklo_epi16 (row1.147_73, row5.146_72);
  _74 = D.14264;
  row1 = _74;
  row5.148_75 = row5;
  D.14265 = _mm_unpackhi_epi16 (tmp, row5.148_75);
  _76 = D.14265;
  row5 = _76;
  tmp = row2;
  row6.149_77 = row6;
  row2.150_78 = row2;
  D.14266 = _mm_unpacklo_epi16 (row2.150_78, row6.149_77);
  _79 = D.14266;
  row2 = _79;
  row6.151_80 = row6;
  D.14267 = _mm_unpackhi_epi16 (tmp, row6.151_80);
  _81 = D.14267;
  row6 = _81;
  tmp = row3;
  row7.152_82 = row7;
  row3.153_83 = row3;
  D.14268 = _mm_unpacklo_epi16 (row3.153_83, row7.152_82);
  _84 = D.14268;
  row3 = _84;
  row7.154_85 = row7;
  D.14269 = _mm_unpackhi_epi16 (tmp, row7.154_85);
  _86 = D.14269;
  row7 = _86;
  tmp = row0;
  row2.155_87 = row2;
  D.14270 = _mm_unpacklo_epi16 (row0, row2.155_87);
  row0 = D.14270;
  row2.156_88 = row2;
  D.14271 = _mm_unpackhi_epi16 (tmp, row2.156_88);
  _89 = D.14271;
  row2 = _89;
  tmp = row1;
  row3.157_90 = row3;
  row1.158_91 = row1;
  D.14272 = _mm_unpacklo_epi16 (row1.158_91, row3.157_90);
  _92 = D.14272;
  row1 = _92;
  row3.159_93 = row3;
  D.14273 = _mm_unpackhi_epi16 (tmp, row3.159_93);
  _94 = D.14273;
  row3 = _94;
  tmp = row4;
  row6.160_95 = row6;
  D.14274 = _mm_unpacklo_epi16 (row4, row6.160_95);
  row4 = D.14274;
  row6.161_96 = row6;
  D.14275 = _mm_unpackhi_epi16 (tmp, row6.161_96);
  _97 = D.14275;
  row6 = _97;
  tmp = row5;
  row7.162_98 = row7;
  row5.163_99 = row5;
  D.14276 = _mm_unpacklo_epi16 (row5.163_99, row7.162_98);
  _100 = D.14276;
  row5 = _100;
  row7.164_101 = row7;
  D.14277 = _mm_unpackhi_epi16 (tmp, row7.164_101);
  _102 = D.14277;
  row7 = _102;
  tmp = row0;
  row1.165_103 = row1;
  D.14278 = _mm_unpacklo_epi16 (row0, row1.165_103);
  row0 = D.14278;
  row1.166_104 = row1;
  D.14279 = _mm_unpackhi_epi16 (tmp, row1.166_104);
  _105 = D.14279;
  row1 = _105;
  tmp = row2;
  row3.167_106 = row3;
  row2.168_107 = row2;
  D.14280 = _mm_unpacklo_epi16 (row2.168_107, row3.167_106);
  _108 = D.14280;
  row2 = _108;
  row3.169_109 = row3;
  D.14281 = _mm_unpackhi_epi16 (tmp, row3.169_109);
  _110 = D.14281;
  row3 = _110;
  tmp = row4;
  row5.170_111 = row5;
  D.14282 = _mm_unpacklo_epi16 (row4, row5.170_111);
  row4 = D.14282;
  row5.171_112 = row5;
  D.14283 = _mm_unpackhi_epi16 (tmp, row5.171_112);
  _113 = D.14283;
  row5 = _113;
  tmp = row6;
  row7.172_114 = row7;
  row6.173_115 = row6;
  D.14284 = _mm_unpacklo_epi16 (row6.173_115, row7.172_114);
  _116 = D.14284;
  row6 = _116;
  row7.174_117 = row7;
  D.14285 = _mm_unpackhi_epi16 (tmp, row7.174_117);
  _118 = D.14285;
  row7 = _118;
  row6.175_119 = row6;
  row2.176_120 = row2;
  D.14286 = _mm_unpacklo_epi16 (row2.176_120, row6.175_119);
  rot0_0lo = D.14286;
  row6.177_121 = row6;
  row2.178_122 = row2;
  D.14287 = _mm_unpackhi_epi16 (row2.178_122, row6.177_121);
  rot0_0hi = D.14287;
  D.14288 = _mm_madd_epi16 (rot0_0lo, rot0_0);
  t2e_l = D.14288;
  D.14289 = _mm_madd_epi16 (rot0_0hi, rot0_0);
  t2e_h = D.14289;
  D.14290 = _mm_madd_epi16 (rot0_0lo, rot0_1);
  t3e_l = D.14290;
  D.14291 = _mm_madd_epi16 (rot0_0hi, rot0_1);
  t3e_h = D.14291;
  _123 = _mm_add_epi16 (row0, row4);
  sum04 = _123;
  _124 = _mm_sub_epi16 (row0, row4);
  dif04 = _124;
  sum04.179_125 = sum04;
  _126 = _mm_setzero_si128 ();
  D.14292 = _mm_unpacklo_epi16 (_126, sum04.179_125);
  _127 = D.14292;
  D.14293 = _mm_srai_epi32 (_127, 4);
  t0e_l = D.14293;
  sum04.180_128 = sum04;
  _129 = _mm_setzero_si128 ();
  D.14294 = _mm_unpackhi_epi16 (_129, sum04.180_128);
  _130 = D.14294;
  D.14295 = _mm_srai_epi32 (_130, 4);
  t0e_h = D.14295;
  dif04.181_131 = dif04;
  _132 = _mm_setzero_si128 ();
  D.14296 = _mm_unpacklo_epi16 (_132, dif04.181_131);
  _133 = D.14296;
  D.14297 = _mm_srai_epi32 (_133, 4);
  t1e_l = D.14297;
  dif04.182_134 = dif04;
  _135 = _mm_setzero_si128 ();
  D.14298 = _mm_unpackhi_epi16 (_135, dif04.182_134);
  _136 = D.14298;
  D.14299 = _mm_srai_epi32 (_136, 4);
  t1e_h = D.14299;
  x0_l = _mm_add_epi32 (t0e_l, t3e_l);
  x0_h = _mm_add_epi32 (t0e_h, t3e_h);
  x3_l = _mm_sub_epi32 (t0e_l, t3e_l);
  x3_h = _mm_sub_epi32 (t0e_h, t3e_h);
  x1_l = _mm_add_epi32 (t1e_l, t2e_l);
  x1_h = _mm_add_epi32 (t1e_h, t2e_h);
  x2_l = _mm_sub_epi32 (t1e_l, t2e_l);
  x2_h = _mm_sub_epi32 (t1e_h, t2e_h);
  row3.183_137 = row3;
  row7.184_138 = row7;
  D.14300 = _mm_unpacklo_epi16 (row7.184_138, row3.183_137);
  rot2_0lo = D.14300;
  row3.185_139 = row3;
  row7.186_140 = row7;
  D.14301 = _mm_unpackhi_epi16 (row7.186_140, row3.185_139);
  rot2_0hi = D.14301;
  D.14302 = _mm_madd_epi16 (rot2_0lo, rot2_0);
  y0o_l = D.14302;
  D.14303 = _mm_madd_epi16 (rot2_0hi, rot2_0);
  y0o_h = D.14303;
  D.14304 = _mm_madd_epi16 (rot2_0lo, rot2_1);
  y2o_l = D.14304;
  D.14305 = _mm_madd_epi16 (rot2_0hi, rot2_1);
  y2o_h = D.14305;
  row1.187_141 = row1;
  row5.188_142 = row5;
  D.14306 = _mm_unpacklo_epi16 (row5.188_142, row1.187_141);
  rot3_0lo = D.14306;
  row1.189_143 = row1;
  row5.190_144 = row5;
  D.14307 = _mm_unpackhi_epi16 (row5.190_144, row1.189_143);
  rot3_0hi = D.14307;
  D.14308 = _mm_madd_epi16 (rot3_0lo, rot3_0);
  y1o_l = D.14308;
  D.14309 = _mm_madd_epi16 (rot3_0hi, rot3_0);
  y1o_h = D.14309;
  D.14310 = _mm_madd_epi16 (rot3_0lo, rot3_1);
  y3o_l = D.14310;
  D.14311 = _mm_madd_epi16 (rot3_0hi, rot3_1);
  y3o_h = D.14311;
  row7.191_145 = row7;
  row1.192_146 = row1;
  _147 = _mm_add_epi16 (row1.192_146, row7.191_145);
  sum17 = _147;
  row5.193_148 = row5;
  row3.194_149 = row3;
  _150 = _mm_add_epi16 (row3.194_149, row5.193_148);
  sum35 = _150;
  sum35.195_151 = sum35;
  sum17.196_152 = sum17;
  D.14312 = _mm_unpacklo_epi16 (sum17.196_152, sum35.195_151);
  rot1_0lo = D.14312;
  sum35.197_153 = sum35;
  sum17.198_154 = sum17;
  D.14313 = _mm_unpackhi_epi16 (sum17.198_154, sum35.197_153);
  rot1_0hi = D.14313;
  D.14314 = _mm_madd_epi16 (rot1_0lo, rot1_0);
  y4o_l = D.14314;
  D.14315 = _mm_madd_epi16 (rot1_0hi, rot1_0);
  y4o_h = D.14315;
  D.14316 = _mm_madd_epi16 (rot1_0lo, rot1_1);
  y5o_l = D.14316;
  D.14317 = _mm_madd_epi16 (rot1_0hi, rot1_1);
  y5o_h = D.14317;
  x4_l = _mm_add_epi32 (y0o_l, y4o_l);
  x4_h = _mm_add_epi32 (y0o_h, y4o_h);
  x5_l = _mm_add_epi32 (y1o_l, y5o_l);
  x5_h = _mm_add_epi32 (y1o_h, y5o_h);
  x6_l = _mm_add_epi32 (y2o_l, y5o_l);
  x6_h = _mm_add_epi32 (y2o_h, y5o_h);
  x7_l = _mm_add_epi32 (y3o_l, y4o_l);
  x7_h = _mm_add_epi32 (y3o_h, y4o_h);
  abiased_l = _mm_add_epi32 (x0_l, bias_1);
  abiased_h = _mm_add_epi32 (x0_h, bias_1);
  sum_l = _mm_add_epi32 (abiased_l, x7_l);
  sum_h = _mm_add_epi32 (abiased_h, x7_h);
  dif_l = _mm_sub_epi32 (abiased_l, x7_l);
  dif_h = _mm_sub_epi32 (abiased_h, x7_h);
  D.14318 = _mm_srai_epi32 (sum_h, 17);
  _155 = D.14318;
  D.14319 = _mm_srai_epi32 (sum_l, 17);
  _156 = D.14319;
  D.14320 = _mm_packs_epi32 (_156, _155);
  row0 = D.14320;
  D.14321 = _mm_srai_epi32 (dif_h, 17);
  _157 = D.14321;
  D.14322 = _mm_srai_epi32 (dif_l, 17);
  _158 = D.14322;
  D.14323 = _mm_packs_epi32 (_158, _157);
  _159 = D.14323;
  row7 = _159;
  abiased_l = _mm_add_epi32 (x1_l, bias_1);
  abiased_h = _mm_add_epi32 (x1_h, bias_1);
  sum_l = _mm_add_epi32 (abiased_l, x6_l);
  sum_h = _mm_add_epi32 (abiased_h, x6_h);
  dif_l = _mm_sub_epi32 (abiased_l, x6_l);
  dif_h = _mm_sub_epi32 (abiased_h, x6_h);
  D.14324 = _mm_srai_epi32 (sum_h, 17);
  _160 = D.14324;
  D.14325 = _mm_srai_epi32 (sum_l, 17);
  _161 = D.14325;
  D.14326 = _mm_packs_epi32 (_161, _160);
  _162 = D.14326;
  row1 = _162;
  D.14327 = _mm_srai_epi32 (dif_h, 17);
  _163 = D.14327;
  D.14328 = _mm_srai_epi32 (dif_l, 17);
  _164 = D.14328;
  D.14329 = _mm_packs_epi32 (_164, _163);
  _165 = D.14329;
  row6 = _165;
  abiased_l = _mm_add_epi32 (x2_l, bias_1);
  abiased_h = _mm_add_epi32 (x2_h, bias_1);
  sum_l = _mm_add_epi32 (abiased_l, x5_l);
  sum_h = _mm_add_epi32 (abiased_h, x5_h);
  dif_l = _mm_sub_epi32 (abiased_l, x5_l);
  dif_h = _mm_sub_epi32 (abiased_h, x5_h);
  D.14330 = _mm_srai_epi32 (sum_h, 17);
  _166 = D.14330;
  D.14331 = _mm_srai_epi32 (sum_l, 17);
  _167 = D.14331;
  D.14332 = _mm_packs_epi32 (_167, _166);
  _168 = D.14332;
  row2 = _168;
  D.14333 = _mm_srai_epi32 (dif_h, 17);
  _169 = D.14333;
  D.14334 = _mm_srai_epi32 (dif_l, 17);
  _170 = D.14334;
  D.14335 = _mm_packs_epi32 (_170, _169);
  _171 = D.14335;
  row5 = _171;
  abiased_l = _mm_add_epi32 (x3_l, bias_1);
  abiased_h = _mm_add_epi32 (x3_h, bias_1);
  sum_l = _mm_add_epi32 (abiased_l, x4_l);
  sum_h = _mm_add_epi32 (abiased_h, x4_h);
  dif_l = _mm_sub_epi32 (abiased_l, x4_l);
  dif_h = _mm_sub_epi32 (abiased_h, x4_h);
  D.14336 = _mm_srai_epi32 (sum_h, 17);
  _172 = D.14336;
  D.14337 = _mm_srai_epi32 (sum_l, 17);
  _173 = D.14337;
  D.14338 = _mm_packs_epi32 (_173, _172);
  _174 = D.14338;
  row3 = _174;
  D.14339 = _mm_srai_epi32 (dif_h, 17);
  _175 = D.14339;
  D.14340 = _mm_srai_epi32 (dif_l, 17);
  _176 = D.14340;
  D.14341 = _mm_packs_epi32 (_176, _175);
  row4 = D.14341;
  sum04 = {CLOBBER};
  dif04 = {CLOBBER};
  sum17 = {CLOBBER};
  sum35 = {CLOBBER};
  row1.199_177 = row1;
  D.14343 = _mm_packus_epi16 (row0, row1.199_177);
  _178 = D.14343;
  p0 = _178;
  row3.200_179 = row3;
  row2.201_180 = row2;
  D.14344 = _mm_packus_epi16 (row2.201_180, row3.200_179);
  _181 = D.14344;
  p1 = _181;
  row5.202_182 = row5;
  D.14345 = _mm_packus_epi16 (row4, row5.202_182);
  _183 = D.14345;
  p2 = _183;
  row7.203_184 = row7;
  row6.204_185 = row6;
  D.14346 = _mm_packus_epi16 (row6.204_185, row7.203_184);
  _186 = D.14346;
  p3 = _186;
  tmp = p0;
  p2.205_187 = p2;
  p0.206_188 = p0;
  D.14347 = _mm_unpacklo_epi8 (p0.206_188, p2.205_187);
  _189 = D.14347;
  p0 = _189;
  p2.207_190 = p2;
  D.14348 = _mm_unpackhi_epi8 (tmp, p2.207_190);
  _191 = D.14348;
  p2 = _191;
  tmp = p1;
  p3.208_192 = p3;
  p1.209_193 = p1;
  D.14349 = _mm_unpacklo_epi8 (p1.209_193, p3.208_192);
  _194 = D.14349;
  p1 = _194;
  p3.210_195 = p3;
  D.14350 = _mm_unpackhi_epi8 (tmp, p3.210_195);
  _196 = D.14350;
  p3 = _196;
  tmp = p0;
  p1.211_197 = p1;
  p0.212_198 = p0;
  D.14351 = _mm_unpacklo_epi8 (p0.212_198, p1.211_197);
  _199 = D.14351;
  p0 = _199;
  p1.213_200 = p1;
  D.14352 = _mm_unpackhi_epi8 (tmp, p1.213_200);
  _201 = D.14352;
  p1 = _201;
  tmp = p2;
  p3.214_202 = p3;
  p2.215_203 = p2;
  D.14353 = _mm_unpacklo_epi8 (p2.215_203, p3.214_202);
  _204 = D.14353;
  p2 = _204;
  p3.216_205 = p3;
  D.14354 = _mm_unpackhi_epi8 (tmp, p3.216_205);
  _206 = D.14354;
  p3 = _206;
  tmp = p0;
  p2.217_207 = p2;
  p0.218_208 = p0;
  D.14355 = _mm_unpacklo_epi8 (p0.218_208, p2.217_207);
  _209 = D.14355;
  p0 = _209;
  p2.219_210 = p2;
  D.14356 = _mm_unpackhi_epi8 (tmp, p2.219_210);
  _211 = D.14356;
  p2 = _211;
  tmp = p1;
  p3.220_212 = p3;
  p1.221_213 = p1;
  D.14357 = _mm_unpacklo_epi8 (p1.221_213, p3.220_212);
  _214 = D.14357;
  p1 = _214;
  p3.222_215 = p3;
  D.14358 = _mm_unpackhi_epi8 (tmp, p3.222_215);
  _216 = D.14358;
  p3 = _216;
  p0.223_217 = p0;
  _mm_storel_epi64 (out, p0.223_217);
  _218 = (sizetype) out_stride;
  out = out + _218;
  p0.224_219 = p0;
  _220 = VIEW_CONVERT_EXPR<__v4si>(p0.224_219);
  D.14359 = __builtin_ia32_pshufd (_220, 78);
  _221 = D.14359;
  _222 = VIEW_CONVERT_EXPR<__m128i>(_221);
  _mm_storel_epi64 (out, _222);
  _223 = (sizetype) out_stride;
  out = out + _223;
  p2.225_224 = p2;
  _mm_storel_epi64 (out, p2.225_224);
  _225 = (sizetype) out_stride;
  out = out + _225;
  p2.226_226 = p2;
  _227 = VIEW_CONVERT_EXPR<__v4si>(p2.226_226);
  D.14360 = __builtin_ia32_pshufd (_227, 78);
  _228 = D.14360;
  _229 = VIEW_CONVERT_EXPR<__m128i>(_228);
  _mm_storel_epi64 (out, _229);
  _230 = (sizetype) out_stride;
  out = out + _230;
  p1.227_231 = p1;
  _mm_storel_epi64 (out, p1.227_231);
  _232 = (sizetype) out_stride;
  out = out + _232;
  p1.228_233 = p1;
  _234 = VIEW_CONVERT_EXPR<__v4si>(p1.228_233);
  D.14361 = __builtin_ia32_pshufd (_234, 78);
  _235 = D.14361;
  _236 = VIEW_CONVERT_EXPR<__m128i>(_235);
  _mm_storel_epi64 (out, _236);
  _237 = (sizetype) out_stride;
  out = out + _237;
  p3.229_238 = p3;
  _mm_storel_epi64 (out, p3.229_238);
  _239 = (sizetype) out_stride;
  out = out + _239;
  p3.230_240 = p3;
  _241 = VIEW_CONVERT_EXPR<__v4si>(p3.230_240);
  D.14362 = __builtin_ia32_pshufd (_241, 78);
  _242 = D.14362;
  _243 = VIEW_CONVERT_EXPR<__m128i>(_242);
  _mm_storel_epi64 (out, _243);
  p0 = {CLOBBER};
  p1 = {CLOBBER};
  p2 = {CLOBBER};
  p3 = {CLOBBER};
  row1 = {CLOBBER};
  row2 = {CLOBBER};
  row3 = {CLOBBER};
  row5 = {CLOBBER};
  row6 = {CLOBBER};
  row7 = {CLOBBER};
  return;
  <D.14261>:
  sum04 = {CLOBBER};
  dif04 = {CLOBBER};
  sum17 = {CLOBBER};
  sum35 = {CLOBBER};
  resx 2
  <D.14342>:
  sum04 = {CLOBBER};
  dif04 = {CLOBBER};
  sum17 = {CLOBBER};
  sum35 = {CLOBBER};
  resx 4
  <D.14363>:
  p0 = {CLOBBER};
  p1 = {CLOBBER};
  p2 = {CLOBBER};
  p3 = {CLOBBER};
  resx 6
  <D.14364>:
  row1 = {CLOBBER};
  row2 = {CLOBBER};
  row3 = {CLOBBER};
  row5 = {CLOBBER};
  row6 = {CLOBBER};
  row7 = {CLOBBER};
  resx 1
}



;; Function _mm_setr_epi16 (_Z14_mm_setr_epi16ssssssss, funcdef_no=643, decl_uid=9534, cgraph_uid=549, symbol_order=549)

__attribute__((artificial, always_inline, gnu_inline))
_mm_setr_epi16 (short int __q0, short int __q1, short int __q2, short int __q3, short int __q4, short int __q5, short int __q6, short int __q7)
{
  __m128i D.14365;

  _1 = (int) __q0;
  _2 = (int) __q1;
  _3 = (int) __q2;
  _4 = (int) __q3;
  _5 = (int) __q4;
  _6 = (int) __q5;
  _7 = (int) __q6;
  _8 = (int) __q7;
  D.14365 = _mm_set_epi16 (_8, _7, _6, _5, _4, _3, _2, _1);
  goto <D.14366>;
  <D.14366>:
  return D.14365;
}



;; Function _mm_set_epi16 (_Z13_mm_set_epi16ssssssss, funcdef_no=634, decl_uid=9481, cgraph_uid=540, symbol_order=540)

__attribute__((artificial, always_inline, gnu_inline))
_mm_set_epi16 (short int __q7, short int __q6, short int __q5, short int __q4, short int __q3, short int __q2, short int __q1, short int __q0)
{
  __m128i D.14367;

  _1 = {__q0, __q1, __q2, __q3, __q4, __q5, __q6, __q7};
  D.14367 = VIEW_CONVERT_EXPR<__m128i>(_1);
  goto <D.14368>;
  <D.14368>:
  return D.14367;
}



;; Function _mm_set1_epi32 (_Z14_mm_set1_epi32i, funcdef_no=638, decl_uid=9508, cgraph_uid=544, symbol_order=544)

__attribute__((artificial, always_inline, gnu_inline))
_mm_set1_epi32 (int __A)
{
  __m128i D.14369;

  D.14369 = _mm_set_epi32 (__A, __A, __A, __A);
  goto <D.14370>;
  <D.14370>:
  return D.14369;
}



;; Function _mm_set_epi32 (_Z13_mm_set_epi32iiii, funcdef_no=633, decl_uid=9471, cgraph_uid=539, symbol_order=539)

__attribute__((artificial, always_inline, gnu_inline))
_mm_set_epi32 (int __q3, int __q2, int __q1, int __q0)
{
  __m128i D.14371;

  _1 = {__q0, __q1, __q2, __q3};
  D.14371 = VIEW_CONVERT_EXPR<__m128i>(_1);
  goto <D.14372>;
  <D.14372>:
  return D.14371;
}



;; Function _mm_load_si128 (_Z14_mm_load_si128PKDv2_x, funcdef_no=645, decl_uid=9555, cgraph_uid=551, symbol_order=551)

__attribute__((artificial, always_inline, gnu_inline))
_mm_load_si128 (const __m128i * {ref-all} __P)
{
  __m128i D.14373;

  D.14373 = *__P;
  goto <D.14374>;
  <D.14374>:
  return D.14373;
}



;; Function _mm_sub_epi16 (_Z13_mm_sub_epi16Dv2_xS_, funcdef_no=703, decl_uid=9761, cgraph_uid=609, symbol_order=609)

__attribute__((artificial, always_inline, gnu_inline))
_mm_sub_epi16 (__m128i __A, __m128i __B)
{
  __m128i D.14375;

  _1 = VIEW_CONVERT_EXPR<__v8hu>(__A);
  _2 = VIEW_CONVERT_EXPR<__v8hu>(__B);
  _3 = _1 - _2;
  D.14375 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14376>;
  <D.14376>:
  return D.14375;
}



;; Function _mm_setzero_si128 (_Z17_mm_setzero_si128v, funcdef_no=655, decl_uid=9587, cgraph_uid=561, symbol_order=561)

__attribute__((artificial, always_inline, gnu_inline))
_mm_setzero_si128 ()
{
  __m128i D.14377;

  D.14377 = { 0, 0 };
  goto <D.14378>;
  <D.14378>:
  return D.14377;
}



;; Function _mm_add_epi16 (_Z13_mm_add_epi16Dv2_xS_, funcdef_no=695, decl_uid=9729, cgraph_uid=601, symbol_order=601)

__attribute__((artificial, always_inline, gnu_inline))
_mm_add_epi16 (__m128i __A, __m128i __B)
{
  __m128i D.14379;

  _1 = VIEW_CONVERT_EXPR<__v8hu>(__A);
  _2 = VIEW_CONVERT_EXPR<__v8hu>(__B);
  _3 = _1 + _2;
  D.14379 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14380>;
  <D.14380>:
  return D.14379;
}



;; Function _mm_unpacklo_epi16 (_Z18_mm_unpacklo_epi16Dv2_xS_, funcdef_no=691, decl_uid=9713, cgraph_uid=597, symbol_order=597)

__attribute__((artificial, always_inline, gnu_inline))
_mm_unpacklo_epi16 (__m128i __A, __m128i __B)
{
  vector(8) short int D.14383;
  __m128i D.14381;

  _1 = VIEW_CONVERT_EXPR<__v8hi>(__B);
  _2 = VIEW_CONVERT_EXPR<__v8hi>(__A);
  D.14383 = __builtin_ia32_punpcklwd128 (_2, _1);
  _3 = D.14383;
  D.14381 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14382>;
  <D.14382>:
  return D.14381;
}



;; Function _mm_unpackhi_epi16 (_Z18_mm_unpackhi_epi16Dv2_xS_, funcdef_no=687, decl_uid=9697, cgraph_uid=593, symbol_order=593)

__attribute__((artificial, always_inline, gnu_inline))
_mm_unpackhi_epi16 (__m128i __A, __m128i __B)
{
  vector(8) short int D.14386;
  __m128i D.14384;

  _1 = VIEW_CONVERT_EXPR<__v8hi>(__B);
  _2 = VIEW_CONVERT_EXPR<__v8hi>(__A);
  D.14386 = __builtin_ia32_punpckhwd128 (_2, _1);
  _3 = D.14386;
  D.14384 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14385>;
  <D.14385>:
  return D.14384;
}



;; Function _mm_madd_epi16 (_Z14_mm_madd_epi16Dv2_xS_, funcdef_no=710, decl_uid=9789, cgraph_uid=616, symbol_order=616)

__attribute__((artificial, always_inline, gnu_inline))
_mm_madd_epi16 (__m128i __A, __m128i __B)
{
  vector(4) int D.14389;
  __m128i D.14387;

  _1 = VIEW_CONVERT_EXPR<__v8hi>(__B);
  _2 = VIEW_CONVERT_EXPR<__v8hi>(__A);
  D.14389 = __builtin_ia32_pmaddwd128 (_2, _1);
  _3 = D.14389;
  D.14387 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14388>;
  <D.14388>:
  return D.14387;
}



;; Function _mm_add_epi32 (_Z13_mm_add_epi32Dv2_xS_, funcdef_no=696, decl_uid=9733, cgraph_uid=602, symbol_order=602)

__attribute__((artificial, always_inline, gnu_inline))
_mm_add_epi32 (__m128i __A, __m128i __B)
{
  __m128i D.14390;

  _1 = VIEW_CONVERT_EXPR<__v4su>(__A);
  _2 = VIEW_CONVERT_EXPR<__v4su>(__B);
  _3 = _1 + _2;
  D.14390 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14391>;
  <D.14391>:
  return D.14390;
}



;; Function _mm_sub_epi32 (_Z13_mm_sub_epi32Dv2_xS_, funcdef_no=704, decl_uid=9765, cgraph_uid=610, symbol_order=610)

__attribute__((artificial, always_inline, gnu_inline))
_mm_sub_epi32 (__m128i __A, __m128i __B)
{
  __m128i D.14392;

  _1 = VIEW_CONVERT_EXPR<__v4su>(__A);
  _2 = VIEW_CONVERT_EXPR<__v4su>(__B);
  _3 = _1 - _2;
  D.14392 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14393>;
  <D.14393>:
  return D.14392;
}



;; Function _mm_srai_epi32 (_Z14_mm_srai_epi32Dv2_xi, funcdef_no=719, decl_uid=9825, cgraph_uid=625, symbol_order=625)

__attribute__((artificial, always_inline, gnu_inline))
_mm_srai_epi32 (__m128i __A, int __B)
{
  vector(4) int D.14396;
  __m128i D.14394;

  _1 = VIEW_CONVERT_EXPR<__v4si>(__A);
  D.14396 = __builtin_ia32_psradi128 (_1, __B);
  _2 = D.14396;
  D.14394 = VIEW_CONVERT_EXPR<__m128i>(_2);
  goto <D.14395>;
  <D.14395>:
  return D.14394;
}



;; Function _mm_packs_epi32 (_Z15_mm_packs_epi32Dv2_xS_, funcdef_no=684, decl_uid=9685, cgraph_uid=590, symbol_order=590)

__attribute__((artificial, always_inline, gnu_inline))
_mm_packs_epi32 (__m128i __A, __m128i __B)
{
  vector(8) short int D.14399;
  __m128i D.14397;

  _1 = VIEW_CONVERT_EXPR<__v4si>(__B);
  _2 = VIEW_CONVERT_EXPR<__v4si>(__A);
  D.14399 = __builtin_ia32_packssdw128 (_2, _1);
  _3 = D.14399;
  D.14397 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14398>;
  <D.14398>:
  return D.14397;
}



;; Function _mm_packus_epi16 (_Z16_mm_packus_epi16Dv2_xS_, funcdef_no=685, decl_uid=9689, cgraph_uid=591, symbol_order=591)

__attribute__((artificial, always_inline, gnu_inline))
_mm_packus_epi16 (__m128i __A, __m128i __B)
{
  vector(16) char D.14402;
  __m128i D.14400;

  _1 = VIEW_CONVERT_EXPR<__v8hi>(__B);
  _2 = VIEW_CONVERT_EXPR<__v8hi>(__A);
  D.14402 = __builtin_ia32_packuswb128 (_2, _1);
  _3 = D.14402;
  D.14400 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14401>;
  <D.14401>:
  return D.14400;
}



;; Function _mm_unpacklo_epi8 (_Z17_mm_unpacklo_epi8Dv2_xS_, funcdef_no=690, decl_uid=9709, cgraph_uid=596, symbol_order=596)

__attribute__((artificial, always_inline, gnu_inline))
_mm_unpacklo_epi8 (__m128i __A, __m128i __B)
{
  vector(16) char D.14405;
  __m128i D.14403;

  _1 = VIEW_CONVERT_EXPR<__v16qi>(__B);
  _2 = VIEW_CONVERT_EXPR<__v16qi>(__A);
  D.14405 = __builtin_ia32_punpcklbw128 (_2, _1);
  _3 = D.14405;
  D.14403 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14404>;
  <D.14404>:
  return D.14403;
}



;; Function _mm_unpackhi_epi8 (_Z17_mm_unpackhi_epi8Dv2_xS_, funcdef_no=686, decl_uid=9693, cgraph_uid=592, symbol_order=592)

__attribute__((artificial, always_inline, gnu_inline))
_mm_unpackhi_epi8 (__m128i __A, __m128i __B)
{
  vector(16) char D.14408;
  __m128i D.14406;

  _1 = VIEW_CONVERT_EXPR<__v16qi>(__B);
  _2 = VIEW_CONVERT_EXPR<__v16qi>(__A);
  D.14408 = __builtin_ia32_punpckhbw128 (_2, _1);
  _3 = D.14408;
  D.14406 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14407>;
  <D.14407>:
  return D.14406;
}



;; Function _mm_storel_epi64 (_Z16_mm_storel_epi64PDv2_xS_, funcdef_no=650, decl_uid=9573, cgraph_uid=556, symbol_order=556)

__attribute__((artificial, always_inline, gnu_inline))
_mm_storel_epi64 (__m128i_u * {ref-all} __P, __m128i __B)
{
  _1 = BIT_FIELD_REF <__B, 64, 0>;
  _2 = VIEW_CONVERT_EXPR<__m64>(_1);
  MEM[(__m64_u * {ref-all})__P] = _2;
  return;
}



;; Function stbi__get_marker (_ZL16stbi__get_markerP10stbi__jpeg, funcdef_no=851, decl_uid=11283, cgraph_uid=757, symbol_order=769)

stbi__get_marker (struct stbi__jpeg * j)
{
  stbi_uc D.14418;
  stbi_uc D.14417;
  stbi_uc x;
  stbi_uc D.14411;

  _1 = j->marker;
  if (_1 != 255) goto <D.14409>; else goto <D.14410>;
  <D.14409>:
  x = j->marker;
  j->marker = 255;
  D.14411 = x;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14416>;
  <D.14410>:
  _2 = j->s;
  D.14417 = stbi__get8 (_2);
  x = D.14417;
  if (x != 255) goto <D.14412>; else goto <D.14413>;
  <D.14412>:
  D.14411 = 255;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14416>;
  <D.14413>:
  <D.14414>:
  if (x != 255) goto <D.11286>; else goto <D.14415>;
  <D.14415>:
  _3 = j->s;
  D.14418 = stbi__get8 (_3);
  x = D.14418;
  goto <D.14414>;
  <D.11286>:
  D.14411 = x;
  goto <D.14416>;
  <D.14416>:
  return D.14411;
}



;; Function stbi__jpeg_reset (_ZL16stbi__jpeg_resetP10stbi__jpeg, funcdef_no=852, decl_uid=11289, cgraph_uid=758, symbol_order=770)

stbi__jpeg_reset (struct stbi__jpeg * j)
{
  int iftmp.231;

  j->code_bits = 0;
  j->code_buffer = 0;
  j->nomore = 0;
  j->img_comp[3].dc_pred = 0;
  _1 = j->img_comp[3].dc_pred;
  j->img_comp[2].dc_pred = _1;
  _2 = j->img_comp[2].dc_pred;
  j->img_comp[1].dc_pred = _2;
  _3 = j->img_comp[1].dc_pred;
  j->img_comp[0].dc_pred = _3;
  j->marker = 255;
  _4 = j->restart_interval;
  if (_4 != 0) goto <D.14420>; else goto <D.14421>;
  <D.14420>:
  iftmp.231 = j->restart_interval;
  goto <D.14422>;
  <D.14421>:
  iftmp.231 = 2147483647;
  <D.14422>:
  j->todo = iftmp.231;
  j->eob_run = 0;
  return;
}



;; Function stbi__parse_entropy_coded_data (_ZL30stbi__parse_entropy_coded_dataP10stbi__jpeg, funcdef_no=853, decl_uid=11292, cgraph_uid=759, symbol_order=771)

stbi__parse_entropy_coded_data (struct stbi__jpeg * z)
{
  int D.14525;
  int D.14524;
  int D.14523;
  int D.14520;
  int D.14517;
  short int * data;
  int y2;
  int x2;
  int n;
  int y;
  int x;
  int k;
  int j;
  int i;
  int ha;
  short int * data;
  int h;
  int w;
  int n;
  int j;
  int i;
  int ha;
  int y2;
  int x2;
  int n;
  short int data[64];
  int y;
  int x;
  int k;
  int j;
  int i;
  int ha;
  int h;
  int w;
  int n;
  short int data[64];
  int j;
  int i;
  bool retval.240;
  bool retval.239;
  bool retval.238;
  bool retval.237;
  bool retval.236;
  bool retval.235;
  bool retval.234;
  bool retval.233;
  int D.14434;
  bool retval.232;

  stbi__jpeg_reset (z);
  _1 = z->progressive;
  if (_1 == 0) goto <D.14423>; else goto <D.14424>;
  <D.14423>:
  _2 = z->scan_n;
  if (_2 == 1) goto <D.14425>; else goto <D.14426>;
  <D.14425>:
  n = z->order[0];
  _3 = z->img_comp[n].x;
  _4 = _3 + 7;
  w = _4 >> 3;
  _5 = z->img_comp[n].y;
  _6 = _5 + 7;
  h = _6 >> 3;
  j = 0;
  <D.14427>:
  if (j >= h) goto <D.11327>; else goto <D.14428>;
  <D.14428>:
  i = 0;
  <D.14429>:
  if (i >= w) goto <D.11329>; else goto <D.14430>;
  <D.14430>:
  ha = z->img_comp[n].ha;
  _7 = z->img_comp[n].tq;
  _8 = &z->dequant[_7];
  _9 = &z->fast_ac[ha];
  _10 = &z->huff_ac;
  _11 = (long long unsigned int) ha;
  _12 = _11 * 1680;
  _13 = _10 + _12;
  _14 = &z->huff_dc;
  _15 = z->img_comp[n].hd;
  _16 = (long long unsigned int) _15;
  _17 = _16 * 1680;
  _18 = _14 + _17;
  D.14517 = stbi__jpeg_decode_block (z, &data, _18, _13, _9, n, _8);
  _19 = D.14517;
  retval.232 = _19 == 0;
  if (retval.232 != 0) goto <D.14432>; else goto <D.14433>;
  <D.14432>:
  D.14434 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14519>;
  <D.14433>:
  _20 = z->idct_block_kernel;
  _21 = z->img_comp[n].w2;
  _22 = z->img_comp[n].data;
  _23 = z->img_comp[n].w2;
  _24 = j * _23;
  _25 = _24 * 8;
  _26 = (sizetype) _25;
  _27 = i * 8;
  _28 = (sizetype) _27;
  _29 = _26 + _28;
  _30 = _22 + _29;
  _20 (_30, _21, &data);
  _31 = z->todo;
  _32 = _31 + -1;
  z->todo = _32;
  _33 = z->todo;
  retval.233 = _33 <= 0;
  if (retval.233 != 0) goto <D.14436>; else goto <D.14437>;
  <D.14436>:
  _34 = z->code_bits;
  if (_34 <= 23) goto <D.14438>; else goto <D.14439>;
  <D.14438>:
  stbi__grow_buffer_unsafe (z);
  goto <D.14440>;
  <D.14439>:
  <D.14440>:
  _35 = z->marker;
  if (_35 <= 207) goto <D.14441>; else goto <D.14443>;
  <D.14443>:
  _36 = z->marker;
  if (_36 > 215) goto <D.14441>; else goto <D.14442>;
  <D.14441>:
  D.14434 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14519>;
  <D.14442>:
  stbi__jpeg_reset (z);
  goto <D.14444>;
  <D.14437>:
  <D.14444>:
  i = i + 1;
  goto <D.14429>;
  <D.11329>:
  j = j + 1;
  goto <D.14427>;
  <D.11327>:
  D.14434 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14519>;
  <D.14519>:
  data = {CLOBBER};
  goto <D.14516>;
  <D.14426>:
  j = 0;
  <D.14445>:
  _37 = z->img_mcu_y;
  if (j >= _37) goto <D.11331>; else goto <D.14446>;
  <D.14446>:
  i = 0;
  <D.14447>:
  _38 = z->img_mcu_x;
  if (i >= _38) goto <D.11333>; else goto <D.14448>;
  <D.14448>:
  k = 0;
  <D.14449>:
  _39 = z->scan_n;
  if (k >= _39) goto <D.11335>; else goto <D.14450>;
  <D.14450>:
  n = z->order[k];
  y = 0;
  <D.14451>:
  _40 = z->img_comp[n].v;
  if (y >= _40) goto <D.11337>; else goto <D.14452>;
  <D.14452>:
  x = 0;
  <D.14453>:
  _41 = z->img_comp[n].h;
  if (x >= _41) goto <D.11339>; else goto <D.14454>;
  <D.14454>:
  _42 = z->img_comp[n].h;
  _43 = i * _42;
  _44 = x + _43;
  x2 = _44 * 8;
  _45 = z->img_comp[n].v;
  _46 = j * _45;
  _47 = y + _46;
  y2 = _47 * 8;
  ha = z->img_comp[n].ha;
  _48 = z->img_comp[n].tq;
  _49 = &z->dequant[_48];
  _50 = &z->fast_ac[ha];
  _51 = &z->huff_ac;
  _52 = (long long unsigned int) ha;
  _53 = _52 * 1680;
  _54 = _51 + _53;
  _55 = &z->huff_dc;
  _56 = z->img_comp[n].hd;
  _57 = (long long unsigned int) _56;
  _58 = _57 * 1680;
  _59 = _55 + _58;
  D.14520 = stbi__jpeg_decode_block (z, &data, _59, _54, _50, n, _49);
  _60 = D.14520;
  retval.234 = _60 == 0;
  if (retval.234 != 0) goto <D.14456>; else goto <D.14457>;
  <D.14456>:
  D.14434 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14522>;
  <D.14457>:
  _61 = z->idct_block_kernel;
  _62 = z->img_comp[n].w2;
  _63 = z->img_comp[n].data;
  _64 = z->img_comp[n].w2;
  _65 = y2 * _64;
  _66 = (sizetype) _65;
  _67 = (sizetype) x2;
  _68 = _66 + _67;
  _69 = _63 + _68;
  _61 (_69, _62, &data);
  x = x + 1;
  goto <D.14453>;
  <D.11339>:
  y = y + 1;
  goto <D.14451>;
  <D.11337>:
  k = k + 1;
  goto <D.14449>;
  <D.11335>:
  _70 = z->todo;
  _71 = _70 + -1;
  z->todo = _71;
  _72 = z->todo;
  retval.235 = _72 <= 0;
  if (retval.235 != 0) goto <D.14459>; else goto <D.14460>;
  <D.14459>:
  _73 = z->code_bits;
  if (_73 <= 23) goto <D.14461>; else goto <D.14462>;
  <D.14461>:
  stbi__grow_buffer_unsafe (z);
  goto <D.14463>;
  <D.14462>:
  <D.14463>:
  _74 = z->marker;
  if (_74 <= 207) goto <D.14464>; else goto <D.14466>;
  <D.14466>:
  _75 = z->marker;
  if (_75 > 215) goto <D.14464>; else goto <D.14465>;
  <D.14464>:
  D.14434 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14522>;
  <D.14465>:
  stbi__jpeg_reset (z);
  goto <D.14467>;
  <D.14460>:
  <D.14467>:
  i = i + 1;
  goto <D.14447>;
  <D.11333>:
  j = j + 1;
  goto <D.14445>;
  <D.11331>:
  D.14434 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14522>;
  <D.14522>:
  data = {CLOBBER};
  goto <D.14516>;
  <D.14424>:
  _76 = z->scan_n;
  if (_76 == 1) goto <D.14468>; else goto <D.14469>;
  <D.14468>:
  n = z->order[0];
  _77 = z->img_comp[n].x;
  _78 = _77 + 7;
  w = _78 >> 3;
  _79 = z->img_comp[n].y;
  _80 = _79 + 7;
  h = _80 >> 3;
  j = 0;
  <D.14470>:
  if (j >= h) goto <D.11341>; else goto <D.14471>;
  <D.14471>:
  i = 0;
  <D.14472>:
  if (i >= w) goto <D.11343>; else goto <D.14473>;
  <D.14473>:
  _81 = z->img_comp[n].coeff;
  _82 = z->img_comp[n].coeff_w;
  _83 = j * _82;
  _84 = i + _83;
  _85 = _84 * 64;
  _86 = (long long unsigned int) _85;
  _87 = _86 * 2;
  data = _81 + _87;
  _88 = z->spec_start;
  if (_88 == 0) goto <D.14474>; else goto <D.14475>;
  <D.14474>:
  _89 = z->img_comp[n].hd;
  _90 = &z->huff_dc[_89];
  D.14523 = stbi__jpeg_decode_block_prog_dc (z, data, _90, n);
  _91 = D.14523;
  retval.236 = _91 == 0;
  if (retval.236 != 0) goto <D.14477>; else goto <D.14478>;
  <D.14477>:
  D.14434 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14516>;
  <D.14478>:
  goto <D.14479>;
  <D.14475>:
  ha = z->img_comp[n].ha;
  _92 = &z->fast_ac[ha];
  _93 = &z->huff_ac[ha];
  D.14524 = stbi__jpeg_decode_block_prog_ac (z, data, _93, _92);
  _94 = D.14524;
  retval.237 = _94 == 0;
  if (retval.237 != 0) goto <D.14481>; else goto <D.14482>;
  <D.14481>:
  D.14434 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14516>;
  <D.14482>:
  <D.14479>:
  _95 = z->todo;
  _96 = _95 + -1;
  z->todo = _96;
  _97 = z->todo;
  retval.238 = _97 <= 0;
  if (retval.238 != 0) goto <D.14484>; else goto <D.14485>;
  <D.14484>:
  _98 = z->code_bits;
  if (_98 <= 23) goto <D.14486>; else goto <D.14487>;
  <D.14486>:
  stbi__grow_buffer_unsafe (z);
  goto <D.14488>;
  <D.14487>:
  <D.14488>:
  _99 = z->marker;
  if (_99 <= 207) goto <D.14489>; else goto <D.14491>;
  <D.14491>:
  _100 = z->marker;
  if (_100 > 215) goto <D.14489>; else goto <D.14490>;
  <D.14489>:
  D.14434 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14516>;
  <D.14490>:
  stbi__jpeg_reset (z);
  goto <D.14492>;
  <D.14485>:
  <D.14492>:
  i = i + 1;
  goto <D.14472>;
  <D.11343>:
  j = j + 1;
  goto <D.14470>;
  <D.11341>:
  D.14434 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14516>;
  <D.14469>:
  j = 0;
  <D.14493>:
  _101 = z->img_mcu_y;
  if (j >= _101) goto <D.11345>; else goto <D.14494>;
  <D.14494>:
  i = 0;
  <D.14495>:
  _102 = z->img_mcu_x;
  if (i >= _102) goto <D.11347>; else goto <D.14496>;
  <D.14496>:
  k = 0;
  <D.14497>:
  _103 = z->scan_n;
  if (k >= _103) goto <D.11349>; else goto <D.14498>;
  <D.14498>:
  n = z->order[k];
  y = 0;
  <D.14499>:
  _104 = z->img_comp[n].v;
  if (y >= _104) goto <D.11351>; else goto <D.14500>;
  <D.14500>:
  x = 0;
  <D.14501>:
  _105 = z->img_comp[n].h;
  if (x >= _105) goto <D.11353>; else goto <D.14502>;
  <D.14502>:
  _106 = z->img_comp[n].h;
  _107 = i * _106;
  x2 = x + _107;
  _108 = z->img_comp[n].v;
  _109 = j * _108;
  y2 = y + _109;
  _110 = z->img_comp[n].coeff;
  _111 = z->img_comp[n].coeff_w;
  _112 = y2 * _111;
  _113 = x2 + _112;
  _114 = _113 * 64;
  _115 = (long long unsigned int) _114;
  _116 = _115 * 2;
  data = _110 + _116;
  _117 = z->img_comp[n].hd;
  _118 = &z->huff_dc[_117];
  D.14525 = stbi__jpeg_decode_block_prog_dc (z, data, _118, n);
  _119 = D.14525;
  retval.239 = _119 == 0;
  if (retval.239 != 0) goto <D.14504>; else goto <D.14505>;
  <D.14504>:
  D.14434 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14516>;
  <D.14505>:
  x = x + 1;
  goto <D.14501>;
  <D.11353>:
  y = y + 1;
  goto <D.14499>;
  <D.11351>:
  k = k + 1;
  goto <D.14497>;
  <D.11349>:
  _120 = z->todo;
  _121 = _120 + -1;
  z->todo = _121;
  _122 = z->todo;
  retval.240 = _122 <= 0;
  if (retval.240 != 0) goto <D.14507>; else goto <D.14508>;
  <D.14507>:
  _123 = z->code_bits;
  if (_123 <= 23) goto <D.14509>; else goto <D.14510>;
  <D.14509>:
  stbi__grow_buffer_unsafe (z);
  goto <D.14511>;
  <D.14510>:
  <D.14511>:
  _124 = z->marker;
  if (_124 <= 207) goto <D.14512>; else goto <D.14514>;
  <D.14514>:
  _125 = z->marker;
  if (_125 > 215) goto <D.14512>; else goto <D.14513>;
  <D.14512>:
  D.14434 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14516>;
  <D.14513>:
  stbi__jpeg_reset (z);
  goto <D.14515>;
  <D.14508>:
  <D.14515>:
  i = i + 1;
  goto <D.14495>;
  <D.11347>:
  j = j + 1;
  goto <D.14493>;
  <D.11345>:
  D.14434 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14516>;
  <D.14516>:
  return D.14434;
  <D.14518>:
  data = {CLOBBER};
  resx 1
  <D.14521>:
  data = {CLOBBER};
  resx 3
}



;; Function stbi__jpeg_dequantize (_ZL21stbi__jpeg_dequantizePsPt, funcdef_no=854, decl_uid=11357, cgraph_uid=760, symbol_order=772)

stbi__jpeg_dequantize (short int * data, stbi__uint16 * dequant)
{
  int i;

  i = 0;
  <D.14526>:
  if (i > 63) goto <D.11360>; else goto <D.14527>;
  <D.14527>:
  _1 = (long long unsigned int) i;
  _2 = _1 * 2;
  _3 = data + _2;
  _4 = *_3;
  _5 = (unsigned short) _4;
  _6 = (long long unsigned int) i;
  _7 = _6 * 2;
  _8 = dequant + _7;
  _9 = *_8;
  _10 = _5 * _9;
  _11 = (long long unsigned int) i;
  _12 = _11 * 2;
  _13 = data + _12;
  _14 = (short int) _10;
  *_13 = _14;
  i = i + 1;
  goto <D.14526>;
  <D.11360>:
  return;
}



;; Function stbi__jpeg_finish (_ZL17stbi__jpeg_finishP10stbi__jpeg, funcdef_no=855, decl_uid=11363, cgraph_uid=761, symbol_order=773)

stbi__jpeg_finish (struct stbi__jpeg * z)
{
  short int * data;
  int h;
  int w;
  int n;
  int j;
  int i;

  _1 = z->progressive;
  if (_1 != 0) goto <D.14528>; else goto <D.14529>;
  <D.14528>:
  n = 0;
  <D.14530>:
  _2 = z->s;
  _3 = _2->img_n;
  if (n >= _3) goto <D.11371>; else goto <D.14531>;
  <D.14531>:
  _4 = z->img_comp[n].x;
  _5 = _4 + 7;
  w = _5 >> 3;
  _6 = z->img_comp[n].y;
  _7 = _6 + 7;
  h = _7 >> 3;
  j = 0;
  <D.14532>:
  if (j >= h) goto <D.11373>; else goto <D.14533>;
  <D.14533>:
  i = 0;
  <D.14534>:
  if (i >= w) goto <D.11375>; else goto <D.14535>;
  <D.14535>:
  _8 = z->img_comp[n].coeff;
  _9 = z->img_comp[n].coeff_w;
  _10 = j * _9;
  _11 = i + _10;
  _12 = _11 * 64;
  _13 = (long long unsigned int) _12;
  _14 = _13 * 2;
  data = _8 + _14;
  _15 = z->img_comp[n].tq;
  _16 = &z->dequant[_15];
  stbi__jpeg_dequantize (data, _16);
  _17 = z->idct_block_kernel;
  _18 = z->img_comp[n].w2;
  _19 = z->img_comp[n].data;
  _20 = z->img_comp[n].w2;
  _21 = j * _20;
  _22 = _21 * 8;
  _23 = (sizetype) _22;
  _24 = i * 8;
  _25 = (sizetype) _24;
  _26 = _23 + _25;
  _27 = _19 + _26;
  _17 (_27, _18, data);
  i = i + 1;
  goto <D.14534>;
  <D.11375>:
  j = j + 1;
  goto <D.14532>;
  <D.11373>:
  n = n + 1;
  goto <D.14530>;
  <D.11371>:
  goto <D.14536>;
  <D.14529>:
  <D.14536>:
  return;
}



;; Function stbi__process_marker (_ZL20stbi__process_markerP10stbi__jpegi, funcdef_no=856, decl_uid=11379, cgraph_uid=762, symbol_order=776)

stbi__process_marker (struct stbi__jpeg * z, int m)
{
  unsigned char D.14633;
  unsigned char D.14632;
  unsigned char D.14631;
  int D.14630;
  unsigned char D.14626;
  unsigned char D.14625;
  unsigned char D.14624;
  int D.14623;
  unsigned char D.14622;
  int D.14621;
  unsigned char D.14620;
  int D.14619;
  int D.14618;
  int D.14617;
  int i;
  int ok;
  static const unsigned char tag[6] = {65, 100, 111, 98, 101, 0};
  int i;
  int ok;
  static const unsigned char tag[5] = {74, 70, 73, 70, 0};
  int th;
  int tc;
  int q;
  int n;
  int i;
  int sizes[16];
  stbi_uc * v;
  int i;
  int t;
  int sixteen;
  int p;
  int q;
  int L;
  bool retval.247;
  bool retval.246;
  bool retval.245;
  bool retval.244;
  int iftmp.243;
  stbi__uint16 iftmp.242;
  bool retval.241;
  int D.14537;

  switch (m) <default: <D.14580>, case 196: <D.11390>, case 219: <D.11384>, case 221: <D.11383>, case 255: <D.11382>>
  <D.11382>:
  D.14537 = stbi__err ("expected marker");
  goto <D.14616>;
  <D.11383>:
  _1 = z->s;
  D.14617 = stbi__get16be (_1);
  _2 = D.14617;
  retval.241 = _2 != 4;
  if (retval.241 != 0) goto <D.14539>; else goto <D.14540>;
  <D.14539>:
  D.14537 = stbi__err ("bad DRI len");
  goto <D.14616>;
  <D.14540>:
  _3 = z->s;
  D.14618 = stbi__get16be (_3);
  _4 = D.14618;
  z->restart_interval = _4;
  D.14537 = 1;
  goto <D.14616>;
  <D.11384>:
  _5 = z->s;
  D.14619 = stbi__get16be (_5);
  _6 = D.14619;
  L = _6 + -2;
  <D.14541>:
  if (L <= 0) goto <D.11405>; else goto <D.14542>;
  <D.14542>:
  _7 = z->s;
  D.14620 = stbi__get8 (_7);
  _8 = D.14620;
  q = (int) _8;
  p = q >> 4;
  _9 = p != 0;
  sixteen = (int) _9;
  t = q & 15;
  if (p != 0) goto <D.14543>; else goto <D.14544>;
  <D.14543>:
  if (p != 1) goto <D.14545>; else goto <D.14546>;
  <D.14545>:
  D.14537 = stbi__err ("bad DQT type");
  goto <D.14616>;
  <D.14546>:
  <D.14544>:
  if (t > 3) goto <D.14547>; else goto <D.14548>;
  <D.14547>:
  D.14537 = stbi__err ("bad DQT table");
  goto <D.14616>;
  <D.14548>:
  i = 0;
  <D.14549>:
  if (i > 63) goto <D.11407>; else goto <D.14550>;
  <D.14550>:
  if (sixteen != 0) goto <D.14552>; else goto <D.14553>;
  <D.14552>:
  _10 = z->s;
  D.14621 = stbi__get16be (_10);
  _11 = D.14621;
  iftmp.242 = (stbi__uint16) _11;
  goto <D.14554>;
  <D.14553>:
  _12 = z->s;
  D.14622 = stbi__get8 (_12);
  _13 = D.14622;
  iftmp.242 = (stbi__uint16) _13;
  <D.14554>:
  _14 = stbi__jpeg_dezigzag[i];
  _15 = (int) _14;
  z->dequant[t][_15] = iftmp.242;
  i = i + 1;
  goto <D.14549>;
  <D.11407>:
  if (sixteen != 0) goto <D.14556>; else goto <D.14557>;
  <D.14556>:
  iftmp.243 = 129;
  goto <D.14558>;
  <D.14557>:
  iftmp.243 = 65;
  <D.14558>:
  L = L - iftmp.243;
  goto <D.14541>;
  <D.11405>:
  _16 = L == 0;
  D.14537 = (int) _16;
  goto <D.14616>;
  <D.11390>:
  _17 = z->s;
  D.14623 = stbi__get16be (_17);
  _18 = D.14623;
  L = _18 + -2;
  <D.14559>:
  if (L <= 0) goto <D.11409>; else goto <D.14560>;
  <D.14560>:
  n = 0;
  _19 = z->s;
  D.14624 = stbi__get8 (_19);
  _20 = D.14624;
  q = (int) _20;
  tc = q >> 4;
  th = q & 15;
  if (tc > 1) goto <D.14561>; else goto <D.14563>;
  <D.14563>:
  if (th > 3) goto <D.14561>; else goto <D.14562>;
  <D.14561>:
  D.14537 = stbi__err ("bad DHT header");
  goto <D.14629>;
  <D.14562>:
  i = 0;
  <D.14564>:
  if (i > 15) goto <D.11411>; else goto <D.14565>;
  <D.14565>:
  _21 = z->s;
  D.14625 = stbi__get8 (_21);
  _22 = D.14625;
  _23 = (int) _22;
  sizes[i] = _23;
  _24 = sizes[i];
  n = n + _24;
  i = i + 1;
  goto <D.14564>;
  <D.11411>:
  L = L + -17;
  if (tc == 0) goto <D.14566>; else goto <D.14567>;
  <D.14566>:
  _25 = &z->huff_dc;
  _26 = (long long unsigned int) th;
  _27 = _26 * 1680;
  _28 = _25 + _27;
  _29 = stbi__build_huffman (_28, &sizes);
  retval.244 = _29 == 0;
  if (retval.244 != 0) goto <D.14569>; else goto <D.14570>;
  <D.14569>:
  D.14537 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14629>;
  <D.14570>:
  v = &z->huff_dc[th].values;
  goto <D.14571>;
  <D.14567>:
  _30 = &z->huff_ac;
  _31 = (long long unsigned int) th;
  _32 = _31 * 1680;
  _33 = _30 + _32;
  _34 = stbi__build_huffman (_33, &sizes);
  retval.245 = _34 == 0;
  if (retval.245 != 0) goto <D.14573>; else goto <D.14574>;
  <D.14573>:
  D.14537 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14629>;
  <D.14574>:
  v = &z->huff_ac[th].values;
  <D.14571>:
  i = 0;
  <D.14575>:
  if (i >= n) goto <D.11413>; else goto <D.14576>;
  <D.14576>:
  _35 = z->s;
  _36 = (sizetype) i;
  _37 = v + _36;
  D.14626 = stbi__get8 (_35);
  _38 = D.14626;
  *_37 = _38;
  i = i + 1;
  goto <D.14575>;
  <D.11413>:
  if (tc != 0) goto <D.14577>; else goto <D.14578>;
  <D.14577>:
  _39 = &z->huff_ac;
  _40 = (long long unsigned int) th;
  _41 = _40 * 1680;
  _42 = _39 + _41;
  _43 = &z->fast_ac[th];
  stbi__build_fast_ac (_43, _42);
  goto <D.14579>;
  <D.14578>:
  <D.14579>:
  L = L - n;
  sizes = {CLOBBER};
  goto <D.14628>;
  <D.14629>:
  sizes = {CLOBBER};
  goto <D.14616>;
  <D.14628>:
  goto <D.14559>;
  <D.11409>:
  _44 = L == 0;
  D.14537 = (int) _44;
  goto <D.14616>;
  <D.14580>:
  if (m > 223) goto <D.14584>; else goto <D.14581>;
  <D.14584>:
  if (m <= 239) goto <D.14582>; else goto <D.14581>;
  <D.14581>:
  if (m == 254) goto <D.14582>; else goto <D.14583>;
  <D.14582>:
  _45 = z->s;
  D.14630 = stbi__get16be (_45);
  L = D.14630;
  if (L <= 1) goto <D.14585>; else goto <D.14586>;
  <D.14585>:
  if (m == 254) goto <D.14587>; else goto <D.14588>;
  <D.14587>:
  D.14537 = stbi__err ("bad COM len");
  goto <D.14616>;
  <D.14588>:
  D.14537 = stbi__err ("bad APP len");
  goto <D.14616>;
  <D.14586>:
  L = L + -2;
  if (m == 224) goto <D.14591>; else goto <D.14589>;
  <D.14591>:
  if (L > 4) goto <D.14592>; else goto <D.14589>;
  <D.14592>:
  ok = 1;
  i = 0;
  <D.14593>:
  if (i > 4) goto <D.11415>; else goto <D.14594>;
  <D.14594>:
  _46 = z->s;
  D.14631 = stbi__get8 (_46);
  _47 = D.14631;
  _48 = tag[i];
  retval.246 = _47 != _48;
  if (retval.246 != 0) goto <D.14596>; else goto <D.14597>;
  <D.14596>:
  ok = 0;
  goto <D.14598>;
  <D.14597>:
  <D.14598>:
  i = i + 1;
  goto <D.14593>;
  <D.11415>:
  L = L + -5;
  if (ok != 0) goto <D.14599>; else goto <D.14600>;
  <D.14599>:
  z->jfif = 1;
  goto <D.14601>;
  <D.14600>:
  <D.14601>:
  goto <D.14590>;
  <D.14589>:
  if (m == 238) goto <D.14602>; else goto <D.14603>;
  <D.14602>:
  if (L > 11) goto <D.14604>; else goto <D.14605>;
  <D.14604>:
  ok = 1;
  i = 0;
  <D.14606>:
  if (i > 5) goto <D.11417>; else goto <D.14607>;
  <D.14607>:
  _49 = z->s;
  D.14632 = stbi__get8 (_49);
  _50 = D.14632;
  _51 = tag[i];
  retval.247 = _50 != _51;
  if (retval.247 != 0) goto <D.14609>; else goto <D.14610>;
  <D.14609>:
  ok = 0;
  goto <D.14611>;
  <D.14610>:
  <D.14611>:
  i = i + 1;
  goto <D.14606>;
  <D.11417>:
  L = L + -6;
  if (ok != 0) goto <D.14612>; else goto <D.14613>;
  <D.14612>:
  _52 = z->s;
  stbi__get8 (_52);
  _53 = z->s;
  stbi__get16be (_53);
  _54 = z->s;
  stbi__get16be (_54);
  _55 = z->s;
  D.14633 = stbi__get8 (_55);
  _56 = D.14633;
  _57 = (int) _56;
  z->app14_color_transform = _57;
  L = L + -6;
  goto <D.14614>;
  <D.14613>:
  <D.14614>:
  goto <D.14615>;
  <D.14605>:
  <D.14615>:
  <D.14603>:
  <D.14590>:
  _58 = z->s;
  stbi__skip (_58, L);
  D.14537 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14616>;
  <D.14583>:
  D.14537 = stbi__err ("unknown marker");
  goto <D.14616>;
  <D.14616>:
  return D.14537;
  <D.14627>:
  sizes = {CLOBBER};
  resx 1
}



;; Function stbi__process_scan_header (_ZL25stbi__process_scan_headerP10stbi__jpeg, funcdef_no=857, decl_uid=11420, cgraph_uid=763, symbol_order=777)

stbi__process_scan_header (struct stbi__jpeg * z)
{
  unsigned char D.14674;
  unsigned char D.14673;
  unsigned char D.14672;
  unsigned char D.14671;
  unsigned char D.14670;
  unsigned char D.14669;
  int D.14668;
  int aa;
  int q;
  int which;
  int id;
  int Ls;
  int i;
  int D.14638;

  _1 = z->s;
  D.14668 = stbi__get16be (_1);
  Ls = D.14668;
  _2 = z->s;
  D.14669 = stbi__get8 (_2);
  _3 = D.14669;
  _4 = (int) _3;
  z->scan_n = _4;
  _5 = z->scan_n;
  if (_5 <= 0) goto <D.14634>; else goto <D.14636>;
  <D.14636>:
  _6 = z->scan_n;
  if (_6 > 4) goto <D.14634>; else goto <D.14637>;
  <D.14637>:
  _7 = z->scan_n;
  _8 = z->s;
  _9 = _8->img_n;
  if (_7 > _9) goto <D.14634>; else goto <D.14635>;
  <D.14634>:
  D.14638 = stbi__err ("bad SOS component count");
  goto <D.14667>;
  <D.14635>:
  _10 = z->scan_n;
  _11 = _10 + 3;
  _12 = _11 * 2;
  if (Ls != _12) goto <D.14639>; else goto <D.14640>;
  <D.14639>:
  D.14638 = stbi__err ("bad SOS len");
  goto <D.14667>;
  <D.14640>:
  i = 0;
  <D.14641>:
  _13 = z->scan_n;
  if (i >= _13) goto <D.11428>; else goto <D.14642>;
  <D.14642>:
  _14 = z->s;
  D.14670 = stbi__get8 (_14);
  _15 = D.14670;
  id = (int) _15;
  _16 = z->s;
  D.14671 = stbi__get8 (_16);
  _17 = D.14671;
  q = (int) _17;
  which = 0;
  <D.14643>:
  _18 = z->s;
  _19 = _18->img_n;
  if (which >= _19) goto <D.11430>; else goto <D.14644>;
  <D.14644>:
  _20 = z->img_comp[which].id;
  if (id == _20) goto <D.14645>; else goto <D.14646>;
  <D.14645>:
  goto <D.11430>;
  <D.14646>:
  which = which + 1;
  goto <D.14643>;
  <D.11430>:
  _21 = z->s;
  _22 = _21->img_n;
  if (which == _22) goto <D.14647>; else goto <D.14648>;
  <D.14647>:
  D.14638 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14667>;
  <D.14648>:
  _23 = q >> 4;
  z->img_comp[which].hd = _23;
  _24 = z->img_comp[which].hd;
  if (_24 > 3) goto <D.14649>; else goto <D.14650>;
  <D.14649>:
  D.14638 = stbi__err ("bad DC huff");
  goto <D.14667>;
  <D.14650>:
  _25 = q & 15;
  z->img_comp[which].ha = _25;
  _26 = z->img_comp[which].ha;
  if (_26 > 3) goto <D.14651>; else goto <D.14652>;
  <D.14651>:
  D.14638 = stbi__err ("bad AC huff");
  goto <D.14667>;
  <D.14652>:
  z->order[i] = which;
  i = i + 1;
  goto <D.14641>;
  <D.11428>:
  _27 = z->s;
  D.14672 = stbi__get8 (_27);
  _28 = D.14672;
  _29 = (int) _28;
  z->spec_start = _29;
  _30 = z->s;
  D.14673 = stbi__get8 (_30);
  _31 = D.14673;
  _32 = (int) _31;
  z->spec_end = _32;
  _33 = z->s;
  D.14674 = stbi__get8 (_33);
  _34 = D.14674;
  aa = (int) _34;
  _35 = aa >> 4;
  z->succ_high = _35;
  _36 = aa & 15;
  z->succ_low = _36;
  _37 = z->progressive;
  if (_37 != 0) goto <D.14653>; else goto <D.14654>;
  <D.14653>:
  _38 = z->spec_start;
  if (_38 > 63) goto <D.14655>; else goto <D.14657>;
  <D.14657>:
  _39 = z->spec_end;
  if (_39 > 63) goto <D.14655>; else goto <D.14658>;
  <D.14658>:
  _40 = z->spec_start;
  _41 = z->spec_end;
  if (_40 > _41) goto <D.14655>; else goto <D.14659>;
  <D.14659>:
  _42 = z->succ_high;
  if (_42 > 13) goto <D.14655>; else goto <D.14660>;
  <D.14660>:
  _43 = z->succ_low;
  if (_43 > 13) goto <D.14655>; else goto <D.14656>;
  <D.14655>:
  D.14638 = stbi__err ("bad SOS");
  goto <D.14667>;
  <D.14656>:
  goto <D.14661>;
  <D.14654>:
  _44 = z->spec_start;
  if (_44 != 0) goto <D.14662>; else goto <D.14663>;
  <D.14662>:
  D.14638 = stbi__err ("bad SOS");
  goto <D.14667>;
  <D.14663>:
  _45 = z->succ_high;
  if (_45 != 0) goto <D.14664>; else goto <D.14666>;
  <D.14666>:
  _46 = z->succ_low;
  if (_46 != 0) goto <D.14664>; else goto <D.14665>;
  <D.14664>:
  D.14638 = stbi__err ("bad SOS");
  goto <D.14667>;
  <D.14665>:
  z->spec_end = 63;
  <D.14661>:
  D.14638 = 1;
  goto <D.14667>;
  <D.14667>:
  return D.14638;
}



;; Function stbi__free_jpeg_components (_ZL26stbi__free_jpeg_componentsP10stbi__jpegii, funcdef_no=858, decl_uid=11435, cgraph_uid=764, symbol_order=778)

stbi__free_jpeg_components (struct stbi__jpeg * z, int ncomp, int why)
{
  int i;
  int D.14686;

  i = 0;
  <D.14675>:
  if (i >= ncomp) goto <D.11438>; else goto <D.14676>;
  <D.14676>:
  _1 = z->img_comp[i].raw_data;
  if (_1 != 0B) goto <D.14677>; else goto <D.14678>;
  <D.14677>:
  _2 = z->img_comp[i].raw_data;
  free (_2);
  z->img_comp[i].raw_data = 0B;
  z->img_comp[i].data = 0B;
  goto <D.14679>;
  <D.14678>:
  <D.14679>:
  _3 = z->img_comp[i].raw_coeff;
  if (_3 != 0B) goto <D.14680>; else goto <D.14681>;
  <D.14680>:
  _4 = z->img_comp[i].raw_coeff;
  free (_4);
  z->img_comp[i].raw_coeff = 0B;
  z->img_comp[i].coeff = 0B;
  goto <D.14682>;
  <D.14681>:
  <D.14682>:
  _5 = z->img_comp[i].linebuf;
  if (_5 != 0B) goto <D.14683>; else goto <D.14684>;
  <D.14683>:
  _6 = z->img_comp[i].linebuf;
  free (_6);
  z->img_comp[i].linebuf = 0B;
  goto <D.14685>;
  <D.14684>:
  <D.14685>:
  i = i + 1;
  goto <D.14675>;
  <D.11438>:
  D.14686 = why;
  goto <D.14687>;
  <D.14687>:
  return D.14686;
}



;; Function stbi__process_frame_header (_ZL26stbi__process_frame_headerP10stbi__jpegi, funcdef_no=859, decl_uid=11442, cgraph_uid=765, symbol_order=780)

stbi__process_frame_header (struct stbi__jpeg * z, int scan)
{
  unsigned char D.14756;
  unsigned char D.14755;
  unsigned char D.14754;
  unsigned char D.14753;
  int D.14752;
  int D.14751;
  unsigned char D.14750;
  int D.14749;
  static const unsigned char rgb[3] = {82, 71, 66};
  int c;
  int v_max;
  int h_max;
  int q;
  int i;
  int p;
  int Lf;
  struct stbi__context * s;
  bool retval.248;
  int D.14690;

  s = z->s;
  h_max = 1;
  v_max = 1;
  D.14749 = stbi__get16be (s);
  Lf = D.14749;
  if (Lf <= 10) goto <D.14688>; else goto <D.14689>;
  <D.14688>:
  D.14690 = stbi__err ("bad SOF len");
  goto <D.14748>;
  <D.14689>:
  D.14750 = stbi__get8 (s);
  _1 = D.14750;
  p = (int) _1;
  if (p != 8) goto <D.14691>; else goto <D.14692>;
  <D.14691>:
  D.14690 = stbi__err ("only 8-bit");
  goto <D.14748>;
  <D.14692>:
  D.14751 = stbi__get16be (s);
  _2 = D.14751;
  _3 = (unsigned int) _2;
  s->img_y = _3;
  _4 = s->img_y;
  if (_4 == 0) goto <D.14693>; else goto <D.14694>;
  <D.14693>:
  D.14690 = stbi__err ("no header height");
  goto <D.14748>;
  <D.14694>:
  D.14752 = stbi__get16be (s);
  _5 = D.14752;
  _6 = (unsigned int) _5;
  s->img_x = _6;
  _7 = s->img_x;
  if (_7 == 0) goto <D.14695>; else goto <D.14696>;
  <D.14695>:
  D.14690 = stbi__err ("0 width");
  goto <D.14748>;
  <D.14696>:
  _8 = s->img_y;
  if (_8 > 16777216) goto <D.14697>; else goto <D.14698>;
  <D.14697>:
  D.14690 = stbi__err ("too large");
  goto <D.14748>;
  <D.14698>:
  _9 = s->img_x;
  if (_9 > 16777216) goto <D.14699>; else goto <D.14700>;
  <D.14699>:
  D.14690 = stbi__err ("too large");
  goto <D.14748>;
  <D.14700>:
  D.14753 = stbi__get8 (s);
  _10 = D.14753;
  c = (int) _10;
  if (c != 3) goto <D.14701>; else goto <D.14702>;
  <D.14701>:
  if (c != 1) goto <D.14703>; else goto <D.14704>;
  <D.14703>:
  if (c != 4) goto <D.14705>; else goto <D.14706>;
  <D.14705>:
  D.14690 = stbi__err ("bad component count");
  goto <D.14748>;
  <D.14706>:
  <D.14704>:
  <D.14702>:
  s->img_n = c;
  i = 0;
  <D.14707>:
  if (i >= c) goto <D.11453>; else goto <D.14708>;
  <D.14708>:
  z->img_comp[i].data = 0B;
  z->img_comp[i].linebuf = 0B;
  i = i + 1;
  goto <D.14707>;
  <D.11453>:
  _11 = s->img_n;
  _12 = _11 * 3;
  _13 = _12 + 8;
  if (Lf != _13) goto <D.14709>; else goto <D.14710>;
  <D.14709>:
  D.14690 = stbi__err ("bad SOF len");
  goto <D.14748>;
  <D.14710>:
  z->rgb = 0;
  i = 0;
  <D.14711>:
  _14 = s->img_n;
  if (i >= _14) goto <D.11455>; else goto <D.14712>;
  <D.14712>:
  D.14754 = stbi__get8 (s);
  _15 = D.14754;
  _16 = (int) _15;
  z->img_comp[i].id = _16;
  _17 = s->img_n;
  if (_17 == 3) goto <D.14713>; else goto <D.14714>;
  <D.14713>:
  _18 = z->img_comp[i].id;
  _19 = rgb[i];
  _20 = (int) _19;
  if (_18 == _20) goto <D.14715>; else goto <D.14716>;
  <D.14715>:
  _21 = z->rgb;
  _22 = _21 + 1;
  z->rgb = _22;
  goto <D.14717>;
  <D.14716>:
  <D.14717>:
  <D.14714>:
  D.14755 = stbi__get8 (s);
  _23 = D.14755;
  q = (int) _23;
  _24 = q >> 4;
  z->img_comp[i].h = _24;
  _25 = z->img_comp[i].h;
  if (_25 == 0) goto <D.14718>; else goto <D.14720>;
  <D.14720>:
  _26 = z->img_comp[i].h;
  if (_26 > 4) goto <D.14718>; else goto <D.14719>;
  <D.14718>:
  D.14690 = stbi__err ("bad H");
  goto <D.14748>;
  <D.14719>:
  _27 = q & 15;
  z->img_comp[i].v = _27;
  _28 = z->img_comp[i].v;
  if (_28 == 0) goto <D.14721>; else goto <D.14723>;
  <D.14723>:
  _29 = z->img_comp[i].v;
  if (_29 > 4) goto <D.14721>; else goto <D.14722>;
  <D.14721>:
  D.14690 = stbi__err ("bad V");
  goto <D.14748>;
  <D.14722>:
  D.14756 = stbi__get8 (s);
  _30 = D.14756;
  _31 = (int) _30;
  z->img_comp[i].tq = _31;
  _32 = z->img_comp[i].tq;
  if (_32 > 3) goto <D.14724>; else goto <D.14725>;
  <D.14724>:
  D.14690 = stbi__err ("bad TQ");
  goto <D.14748>;
  <D.14725>:
  i = i + 1;
  goto <D.14711>;
  <D.11455>:
  if (scan != 0) goto <D.14726>; else goto <D.14727>;
  <D.14726>:
  D.14690 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14748>;
  <D.14727>:
  _33 = s->img_n;
  _34 = s->img_y;
  _35 = (int) _34;
  _36 = s->img_x;
  _37 = (int) _36;
  _38 = stbi__mad3sizes_valid (_37, _35, _33, 0);
  retval.248 = _38 == 0;
  if (retval.248 != 0) goto <D.14729>; else goto <D.14730>;
  <D.14729>:
  D.14690 = stbi__err ("too large");
  goto <D.14748>;
  <D.14730>:
  i = 0;
  <D.14731>:
  _39 = s->img_n;
  if (i >= _39) goto <D.11457>; else goto <D.14732>;
  <D.14732>:
  _40 = z->img_comp[i].h;
  if (h_max < _40) goto <D.14733>; else goto <D.14734>;
  <D.14733>:
  h_max = z->img_comp[i].h;
  goto <D.14735>;
  <D.14734>:
  <D.14735>:
  _41 = z->img_comp[i].v;
  if (v_max < _41) goto <D.14736>; else goto <D.14737>;
  <D.14736>:
  v_max = z->img_comp[i].v;
  goto <D.14738>;
  <D.14737>:
  <D.14738>:
  i = i + 1;
  goto <D.14731>;
  <D.11457>:
  z->img_h_max = h_max;
  z->img_v_max = v_max;
  _42 = h_max * 8;
  z->img_mcu_w = _42;
  _43 = v_max * 8;
  z->img_mcu_h = _43;
  _44 = s->img_x;
  _45 = z->img_mcu_w;
  _46 = (unsigned int) _45;
  _47 = _44 + _46;
  _48 = _47 + 4294967295;
  _49 = z->img_mcu_w;
  _50 = (unsigned int) _49;
  _51 = _48 / _50;
  _52 = (int) _51;
  z->img_mcu_x = _52;
  _53 = s->img_y;
  _54 = z->img_mcu_h;
  _55 = (unsigned int) _54;
  _56 = _53 + _55;
  _57 = _56 + 4294967295;
  _58 = z->img_mcu_h;
  _59 = (unsigned int) _58;
  _60 = _57 / _59;
  _61 = (int) _60;
  z->img_mcu_y = _61;
  i = 0;
  <D.14739>:
  _62 = s->img_n;
  if (i >= _62) goto <D.11459>; else goto <D.14740>;
  <D.14740>:
  _63 = s->img_x;
  _64 = z->img_comp[i].h;
  _65 = (unsigned int) _64;
  _66 = _63 * _65;
  h_max.249_67 = (unsigned int) h_max;
  _68 = _66 + h_max.249_67;
  _69 = _68 + 4294967295;
  h_max.250_70 = (unsigned int) h_max;
  _71 = _69 / h_max.250_70;
  _72 = (int) _71;
  z->img_comp[i].x = _72;
  _73 = s->img_y;
  _74 = z->img_comp[i].v;
  _75 = (unsigned int) _74;
  _76 = _73 * _75;
  v_max.251_77 = (unsigned int) v_max;
  _78 = _76 + v_max.251_77;
  _79 = _78 + 4294967295;
  v_max.252_80 = (unsigned int) v_max;
  _81 = _79 / v_max.252_80;
  _82 = (int) _81;
  z->img_comp[i].y = _82;
  _83 = z->img_mcu_x;
  _84 = z->img_comp[i].h;
  _85 = _83 * _84;
  _86 = _85 * 8;
  z->img_comp[i].w2 = _86;
  _87 = z->img_mcu_y;
  _88 = z->img_comp[i].v;
  _89 = _87 * _88;
  _90 = _89 * 8;
  z->img_comp[i].h2 = _90;
  z->img_comp[i].coeff = 0B;
  z->img_comp[i].raw_coeff = 0B;
  z->img_comp[i].linebuf = 0B;
  _91 = z->img_comp[i].h2;
  _92 = z->img_comp[i].w2;
  _93 = stbi__malloc_mad2 (_92, _91, 15);
  z->img_comp[i].raw_data = _93;
  _94 = z->img_comp[i].raw_data;
  if (_94 == 0B) goto <D.14741>; else goto <D.14742>;
  <D.14741>:
  _95 = stbi__err ("outofmem");
  _96 = i + 1;
  D.14690 = stbi__free_jpeg_components (z, _96, _95);
  goto <D.14748>;
  <D.14742>:
  _97 = z->img_comp[i].raw_data;
  _98 = (long long unsigned int) _97;
  _99 = _98 + 15;
  _100 = _99 & 18446744073709551600;
  _101 = (stbi_uc *) _100;
  z->img_comp[i].data = _101;
  _102 = z->progressive;
  if (_102 != 0) goto <D.14743>; else goto <D.14744>;
  <D.14743>:
  _103 = z->img_comp[i].w2;
  _104 = _103 / 8;
  z->img_comp[i].coeff_w = _104;
  _105 = z->img_comp[i].h2;
  _106 = _105 / 8;
  z->img_comp[i].coeff_h = _106;
  _107 = z->img_comp[i].h2;
  _108 = z->img_comp[i].w2;
  _109 = stbi__malloc_mad3 (_108, _107, 2, 15);
  z->img_comp[i].raw_coeff = _109;
  _110 = z->img_comp[i].raw_coeff;
  if (_110 == 0B) goto <D.14745>; else goto <D.14746>;
  <D.14745>:
  _111 = stbi__err ("outofmem");
  _112 = i + 1;
  D.14690 = stbi__free_jpeg_components (z, _112, _111);
  goto <D.14748>;
  <D.14746>:
  _113 = z->img_comp[i].raw_coeff;
  _114 = (long long unsigned int) _113;
  _115 = _114 + 15;
  _116 = _115 & 18446744073709551600;
  _117 = (short int *) _116;
  z->img_comp[i].coeff = _117;
  goto <D.14747>;
  <D.14744>:
  <D.14747>:
  i = i + 1;
  goto <D.14739>;
  <D.11459>:
  D.14690 = 1;
  goto <D.14748>;
  <D.14748>:
  return D.14690;
}



;; Function stbi__decode_jpeg_header (_ZL24stbi__decode_jpeg_headerP10stbi__jpegi, funcdef_no=860, decl_uid=11463, cgraph_uid=766, symbol_order=781)

stbi__decode_jpeg_header (struct stbi__jpeg * z, int scan)
{
  int D.14784;
  unsigned char D.14783;
  int D.14782;
  unsigned char D.14781;
  int D.14780;
  unsigned char D.14779;
  unsigned char D.14778;
  int m;
  bool retval.262;
  bool retval.260;
  bool retval.257;
  int D.14759;

  z->jfif = 0;
  z->app14_color_transform = -1;
  z->marker = 255;
  D.14778 = stbi__get_marker (z);
  _1 = D.14778;
  _2 = (int) _1;
  m = _2;
  m.253_3 = m;
  if (m.253_3 != 216) goto <D.14757>; else goto <D.14758>;
  <D.14757>:
  D.14759 = stbi__err ("no SOI");
  goto <D.14786>;
  <D.14758>:
  if (scan == 1) goto <D.14760>; else goto <D.14761>;
  <D.14760>:
  D.14759 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14786>;
  <D.14761>:
  D.14779 = stbi__get_marker (z);
  _4 = D.14779;
  _5 = (int) _4;
  m = _5;
  <D.14762>:
  m.254_6 = m;
  if (m.254_6 == 192) goto <D.11466>; else goto <D.14763>;
  <D.14763>:
  m.255_7 = m;
  if (m.255_7 == 193) goto <D.11466>; else goto <D.14764>;
  <D.14764>:
  m.256_8 = m;
  if (m.256_8 == 194) goto <D.11466>; else goto <D.14765>;
  <D.14765>:
  m.258_9 = m;
  D.14780 = stbi__process_marker (z, m.258_9);
  _10 = D.14780;
  retval.257 = _10 == 0;
  if (retval.257 != 0) goto <D.14767>; else goto <D.14768>;
  <D.14767>:
  D.14759 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14786>;
  <D.14768>:
  D.14781 = stbi__get_marker (z);
  _11 = D.14781;
  _12 = (int) _11;
  m = _12;
  <D.14769>:
  m.259_13 = m;
  if (m.259_13 != 255) goto <D.11468>; else goto <D.14770>;
  <D.14770>:
  _14 = z->s;
  D.14782 = stbi__at_eof (_14);
  _15 = D.14782;
  retval.260 = _15 != 0;
  if (retval.260 != 0) goto <D.14772>; else goto <D.14773>;
  <D.14772>:
  D.14759 = stbi__err ("no SOF");
  goto <D.14786>;
  <D.14773>:
  D.14783 = stbi__get_marker (z);
  _16 = D.14783;
  _17 = (int) _16;
  m = _17;
  goto <D.14769>;
  <D.11468>:
  goto <D.14762>;
  <D.11466>:
  m.261_18 = m;
  _19 = m.261_18 == 194;
  _20 = (int) _19;
  z->progressive = _20;
  D.14784 = stbi__process_frame_header (z, scan);
  _21 = D.14784;
  retval.262 = _21 == 0;
  if (retval.262 != 0) goto <D.14775>; else goto <D.14776>;
  <D.14775>:
  D.14759 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14786>;
  <D.14776>:
  D.14759 = 1;
  goto <D.14786>;
  <D.14786>:
  m = {CLOBBER};
  goto <D.14777>;
  <D.14777>:
  return D.14759;
  <D.14785>:
  m = {CLOBBER};
  resx 1
}



;; Function stbi__at_eof (_ZL12stbi__at_eofP13stbi__context, funcdef_no=825, decl_uid=10672, cgraph_uid=731, symbol_order=740)

stbi__at_eof (struct stbi__context * s)
{
  int D.14797;
  int D.14792;
  bool retval.263;

  _1 = s->io.read;
  if (_1 != 0B) goto <D.14787>; else goto <D.14788>;
  <D.14787>:
  _2 = s->io.eof;
  _3 = s->io_user_data;
  D.14797 = _2 (_3);
  _4 = D.14797;
  retval.263 = _4 == 0;
  if (retval.263 != 0) goto <D.14790>; else goto <D.14791>;
  <D.14790>:
  D.14792 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14796>;
  <D.14791>:
  _5 = s->read_from_callbacks;
  if (_5 == 0) goto <D.14793>; else goto <D.14794>;
  <D.14793>:
  D.14792 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14796>;
  <D.14794>:
  goto <D.14795>;
  <D.14788>:
  <D.14795>:
  _6 = s->img_buffer;
  _7 = s->img_buffer_end;
  _8 = _6 >= _7;
  D.14792 = (int) _8;
  goto <D.14796>;
  <D.14796>:
  return D.14792;
}



;; Function stbi__decode_jpeg_image (_ZL23stbi__decode_jpeg_imageP10stbi__jpeg, funcdef_no=861, decl_uid=11471, cgraph_uid=767, symbol_order=782)

stbi__decode_jpeg_image (struct stbi__jpeg * j)
{
  unsigned char D.14847;
  int D.14846;
  int D.14845;
  int D.14844;
  unsigned char D.14843;
  unsigned char D.14842;
  int D.14841;
  int D.14840;
  int D.14839;
  unsigned char D.14838;
  int D.14837;
  stbi__uint32 NL;
  int Ld;
  int x;
  int m;
  bool retval.275;
  bool retval.273;
  bool retval.272;
  bool retval.271;
  int D.14803;
  bool retval.268;

  m = 0;
  <D.14798>:
  m.264_1 = m;
  if (m.264_1 > 3) goto <D.11477>; else goto <D.14799>;
  <D.14799>:
  m.265_2 = m;
  j->img_comp[m.265_2].raw_data = 0B;
  m.266_3 = m;
  j->img_comp[m.266_3].raw_coeff = 0B;
  m.267_4 = m;
  _5 = m.267_4 + 1;
  m = _5;
  goto <D.14798>;
  <D.11477>:
  j->restart_interval = 0;
  D.14837 = stbi__decode_jpeg_header (j, 0);
  _6 = D.14837;
  retval.268 = _6 == 0;
  if (retval.268 != 0) goto <D.14801>; else goto <D.14802>;
  <D.14801>:
  D.14803 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14849>;
  <D.14802>:
  D.14838 = stbi__get_marker (j);
  _7 = D.14838;
  _8 = (int) _7;
  m = _8;
  <D.14804>:
  m.269_9 = m;
  if (m.269_9 == 217) goto <D.11479>; else goto <D.14805>;
  <D.14805>:
  m.270_10 = m;
  if (m.270_10 == 218) goto <D.14806>; else goto <D.14807>;
  <D.14806>:
  D.14839 = stbi__process_scan_header (j);
  _11 = D.14839;
  retval.271 = _11 == 0;
  if (retval.271 != 0) goto <D.14809>; else goto <D.14810>;
  <D.14809>:
  D.14803 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14849>;
  <D.14810>:
  D.14840 = stbi__parse_entropy_coded_data (j);
  _12 = D.14840;
  retval.272 = _12 == 0;
  if (retval.272 != 0) goto <D.14812>; else goto <D.14813>;
  <D.14812>:
  D.14803 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14849>;
  <D.14813>:
  _13 = j->marker;
  if (_13 == 255) goto <D.14814>; else goto <D.14815>;
  <D.14814>:
  <D.14816>:
  _14 = j->s;
  D.14841 = stbi__at_eof (_14);
  _15 = D.14841;
  retval.273 = _15 == 0;
  if (retval.273 != 0) goto <D.14818>; else goto <D.11481>;
  <D.14818>:
  _16 = j->s;
  D.14842 = stbi__get8 (_16);
  _17 = D.14842;
  x = (int) _17;
  if (x == 255) goto <D.14819>; else goto <D.14820>;
  <D.14819>:
  _18 = j->s;
  D.14843 = stbi__get8 (_18);
  _19 = D.14843;
  j->marker = _19;
  goto <D.11481>;
  <D.14820>:
  goto <D.14816>;
  <D.11481>:
  goto <D.14821>;
  <D.14815>:
  <D.14821>:
  goto <D.14822>;
  <D.14807>:
  m.274_20 = m;
  if (m.274_20 == 220) goto <D.14823>; else goto <D.14824>;
  <D.14823>:
  _21 = j->s;
  D.14844 = stbi__get16be (_21);
  Ld = D.14844;
  _22 = j->s;
  D.14845 = stbi__get16be (_22);
  _23 = D.14845;
  NL = (stbi__uint32) _23;
  if (Ld != 4) goto <D.14825>; else goto <D.14826>;
  <D.14825>:
  D.14803 = stbi__err ("bad DNL len");
  goto <D.14849>;
  <D.14826>:
  _24 = j->s;
  _25 = _24->img_y;
  if (NL != _25) goto <D.14827>; else goto <D.14828>;
  <D.14827>:
  D.14803 = stbi__err ("bad DNL height");
  goto <D.14849>;
  <D.14828>:
  goto <D.14829>;
  <D.14824>:
  m.276_26 = m;
  D.14846 = stbi__process_marker (j, m.276_26);
  _27 = D.14846;
  retval.275 = _27 == 0;
  if (retval.275 != 0) goto <D.14831>; else goto <D.14832>;
  <D.14831>:
  D.14803 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14849>;
  <D.14832>:
  <D.14829>:
  <D.14822>:
  D.14847 = stbi__get_marker (j);
  _28 = D.14847;
  _29 = (int) _28;
  m = _29;
  goto <D.14804>;
  <D.11479>:
  _30 = j->progressive;
  if (_30 != 0) goto <D.14833>; else goto <D.14834>;
  <D.14833>:
  stbi__jpeg_finish (j);
  goto <D.14835>;
  <D.14834>:
  <D.14835>:
  D.14803 = 1;
  goto <D.14849>;
  <D.14849>:
  m = {CLOBBER};
  goto <D.14836>;
  <D.14836>:
  return D.14803;
  <D.14848>:
  m = {CLOBBER};
  resx 1
}



;; Function resample_row_1 (_ZL14resample_row_1PhS_S_ii, funcdef_no=862, decl_uid=11494, cgraph_uid=768, symbol_order=783)

resample_row_1 (stbi_uc * out, stbi_uc * in_near, stbi_uc * in_far, int w, int hs)
{
  stbi_uc * D.14850;

  D.14850 = in_near;
  goto <D.14851>;
  <D.14851>:
  return D.14850;
}



;; Function stbi__resample_row_v_2 (_ZL22stbi__resample_row_v_2PhS_S_ii, funcdef_no=863, decl_uid=11501, cgraph_uid=769, symbol_order=784)

stbi__resample_row_v_2 (stbi_uc * out, stbi_uc * in_near, stbi_uc * in_far, int w, int hs)
{
  int i;
  stbi_uc * D.14854;

  i = 0;
  <D.14852>:
  if (i >= w) goto <D.11504>; else goto <D.14853>;
  <D.14853>:
  _1 = (sizetype) i;
  _2 = in_near + _1;
  _3 = *_2;
  _4 = (int) _3;
  _5 = _4 * 3;
  _6 = (sizetype) i;
  _7 = in_far + _6;
  _8 = *_7;
  _9 = (int) _8;
  _10 = _5 + _9;
  _11 = _10 + 2;
  _12 = _11 >> 2;
  _13 = (sizetype) i;
  _14 = out + _13;
  _15 = (unsigned char) _12;
  *_14 = _15;
  i = i + 1;
  goto <D.14852>;
  <D.11504>:
  D.14854 = out;
  goto <D.14855>;
  <D.14855>:
  return D.14854;
}



;; Function stbi__resample_row_h_2 (_ZL22stbi__resample_row_h_2PhS_S_ii, funcdef_no=864, decl_uid=11511, cgraph_uid=770, symbol_order=785)

stbi__resample_row_h_2 (stbi_uc * out, stbi_uc * in_near, stbi_uc * in_far, int w, int hs)
{
  int n;
  stbi_uc * input;
  int i;
  stbi_uc * D.14858;

  input = in_near;
  if (w == 1) goto <D.14856>; else goto <D.14857>;
  <D.14856>:
  _1 = out + 1;
  _2 = *input;
  *_1 = _2;
  _3 = *_1;
  *out = _3;
  D.14858 = out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14861>;
  <D.14857>:
  _4 = *input;
  *out = _4;
  _5 = *input;
  _6 = (int) _5;
  _7 = _6 * 3;
  _8 = input + 1;
  _9 = *_8;
  _10 = (int) _9;
  _11 = _7 + _10;
  _12 = _11 + 2;
  _13 = _12 >> 2;
  _14 = out + 1;
  _15 = (unsigned char) _13;
  *_14 = _15;
  i = 1;
  <D.14859>:
  _16 = w + -1;
  if (i >= _16) goto <D.11516>; else goto <D.14860>;
  <D.14860>:
  _17 = (sizetype) i;
  _18 = input + _17;
  _19 = *_18;
  _20 = (int) _19;
  _21 = _20 * 3;
  n = _21 + 2;
  _22 = (sizetype) i;
  _23 = _22 + 18446744073709551615;
  _24 = input + _23;
  _25 = *_24;
  _26 = (int) _25;
  _27 = n + _26;
  _28 = _27 >> 2;
  _29 = i * 2;
  _30 = (sizetype) _29;
  _31 = out + _30;
  _32 = (unsigned char) _28;
  *_31 = _32;
  _33 = (sizetype) i;
  _34 = _33 + 1;
  _35 = input + _34;
  _36 = *_35;
  _37 = (int) _36;
  _38 = n + _37;
  _39 = _38 >> 2;
  _40 = i * 2;
  _41 = (sizetype) _40;
  _42 = _41 + 1;
  _43 = out + _42;
  _44 = (unsigned char) _39;
  *_43 = _44;
  i = i + 1;
  goto <D.14859>;
  <D.11516>:
  _45 = (sizetype) w;
  _46 = _45 + 18446744073709551614;
  _47 = input + _46;
  _48 = *_47;
  _49 = (int) _48;
  _50 = _49 * 3;
  _51 = (sizetype) w;
  _52 = _51 + 18446744073709551615;
  _53 = input + _52;
  _54 = *_53;
  _55 = (int) _54;
  _56 = _50 + _55;
  _57 = _56 + 2;
  _58 = _57 >> 2;
  _59 = i * 2;
  _60 = (sizetype) _59;
  _61 = out + _60;
  _62 = (unsigned char) _58;
  *_61 = _62;
  _63 = (sizetype) w;
  _64 = _63 + 18446744073709551615;
  _65 = input + _64;
  _66 = i * 2;
  _67 = (sizetype) _66;
  _68 = _67 + 1;
  _69 = out + _68;
  _70 = *_65;
  *_69 = _70;
  D.14858 = out;
  goto <D.14861>;
  <D.14861>:
  return D.14858;
}



;; Function stbi__resample_row_hv_2 (_ZL23stbi__resample_row_hv_2PhS_S_ii, funcdef_no=865, decl_uid=11523, cgraph_uid=771, symbol_order=786)

stbi__resample_row_hv_2 (stbi_uc * out, stbi_uc * in_near, stbi_uc * in_far, int w, int hs)
{
  int t1;
  int t0;
  int i;
  stbi_uc * D.14864;

  if (w == 1) goto <D.14862>; else goto <D.14863>;
  <D.14862>:
  _1 = *in_near;
  _2 = (int) _1;
  _3 = _2 * 3;
  _4 = *in_far;
  _5 = (int) _4;
  _6 = _3 + _5;
  _7 = _6 + 2;
  _8 = _7 >> 2;
  _9 = out + 1;
  _10 = (unsigned char) _8;
  *_9 = _10;
  _11 = *_9;
  *out = _11;
  D.14864 = out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14867>;
  <D.14863>:
  _12 = *in_near;
  _13 = (int) _12;
  _14 = _13 * 3;
  _15 = *in_far;
  _16 = (int) _15;
  t1 = _14 + _16;
  _17 = t1 + 2;
  _18 = _17 >> 2;
  _19 = (unsigned char) _18;
  *out = _19;
  i = 1;
  <D.14865>:
  if (i >= w) goto <D.11528>; else goto <D.14866>;
  <D.14866>:
  t0 = t1;
  _20 = (sizetype) i;
  _21 = in_near + _20;
  _22 = *_21;
  _23 = (int) _22;
  _24 = _23 * 3;
  _25 = (sizetype) i;
  _26 = in_far + _25;
  _27 = *_26;
  _28 = (int) _27;
  t1 = _24 + _28;
  _29 = t0 * 3;
  _30 = t1 + _29;
  _31 = _30 + 8;
  _32 = _31 >> 4;
  _33 = i * 2;
  _34 = (sizetype) _33;
  _35 = _34 + 18446744073709551615;
  _36 = out + _35;
  _37 = (unsigned char) _32;
  *_36 = _37;
  _38 = t1 * 3;
  _39 = t0 + _38;
  _40 = _39 + 8;
  _41 = _40 >> 4;
  _42 = i * 2;
  _43 = (sizetype) _42;
  _44 = out + _43;
  _45 = (unsigned char) _41;
  *_44 = _45;
  i = i + 1;
  goto <D.14865>;
  <D.11528>:
  _46 = t1 + 2;
  _47 = _46 >> 2;
  _48 = w * 2;
  _49 = (sizetype) _48;
  _50 = _49 + 18446744073709551615;
  _51 = out + _50;
  _52 = (unsigned char) _47;
  *_51 = _52;
  D.14864 = out;
  goto <D.14867>;
  <D.14867>:
  return D.14864;
}



;; Function stbi__resample_row_hv_2_simd (_ZL28stbi__resample_row_hv_2_simdPhS_S_ii, funcdef_no=866, decl_uid=11535, cgraph_uid=772, symbol_order=787)

stbi__resample_row_hv_2_simd (stbi_uc * out, stbi_uc * in_near, stbi_uc * in_far, int w, int hs)
{
  __m128i D.14888;
  __m128i D.14887;
  __m128i D.14886;
  __m128i D.14885;
  __m128i D.14884;
  __m128i D.14883;
  vector(8) short int D.14882;
  vector(8) short int D.14881;
  vector(2) long long int D.14880;
  vector(2) long long int D.14879;
  __m128i D.14878;
  __m128i D.14877;
  __m128i D.14876;
  __m128i outv;
  __m128i de1;
  __m128i de0;
  __m128i int1;
  __m128i int0;
  __m128i odd;
  __m128i even;
  __m128i curb;
  __m128i nxtd;
  __m128i prvd;
  __m128i curs;
  __m128i bias;
  __m128i next;
  __m128i prev;
  __m128i nxt0;
  __m128i prv0;
  __m128i curr;
  __m128i nears;
  __m128i diff;
  __m128i nearw;
  __m128i farw;
  __m128i nearb;
  __m128i farb;
  __m128i zero;
  int t1;
  int t0;
  int i;
  stbi_uc * D.14870;

  i = 0;
  if (w == 1) goto <D.14868>; else goto <D.14869>;
  <D.14868>:
  _1 = *in_near;
  _2 = (int) _1;
  _3 = _2 * 3;
  _4 = *in_far;
  _5 = (int) _4;
  _6 = _3 + _5;
  _7 = _6 + 2;
  _8 = _7 >> 2;
  _9 = out + 1;
  _10 = (unsigned char) _8;
  *_9 = _10;
  _11 = *_9;
  *out = _11;
  D.14870 = out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.14891>;
  <D.14869>:
  _12 = *in_near;
  _13 = (int) _12;
  _14 = _13 * 3;
  _15 = *in_far;
  _16 = (int) _15;
  _17 = _14 + _16;
  t1 = _17;
  <D.14871>:
  _18 = w + -1;
  _19 = _18 & -8;
  if (i >= _19) goto <D.11564>; else goto <D.14872>;
  <D.14872>:
  zero = _mm_setzero_si128 ();
  _20 = (sizetype) i;
  _21 = in_far + _20;
  farb = _mm_loadl_epi64 (_21);
  _22 = (sizetype) i;
  _23 = in_near + _22;
  nearb = _mm_loadl_epi64 (_23);
  D.14876 = _mm_unpacklo_epi8 (farb, zero);
  farw = D.14876;
  D.14877 = _mm_unpacklo_epi8 (nearb, zero);
  nearw = D.14877;
  diff = _mm_sub_epi16 (farw, nearw);
  D.14878 = _mm_slli_epi16 (nearw, 2);
  nears = D.14878;
  _24 = _mm_add_epi16 (nears, diff);
  curr = _24;
  curr.277_25 = curr;
  D.14879 = __builtin_ia32_pslldqi128 (curr.277_25, 16);
  _26 = D.14879;
  prv0 = _26;
  curr.278_27 = curr;
  D.14880 = __builtin_ia32_psrldqi128 (curr.278_27, 16);
  _28 = D.14880;
  nxt0 = _28;
  t1.279_29 = t1;
  _30 = (short int) t1.279_29;
  _31 = (int) _30;
  prv0.280_32 = prv0;
  _33 = VIEW_CONVERT_EXPR<__v8hi>(prv0.280_32);
  D.14881 = __builtin_ia32_vec_set_v8hi (_33, _31, 0);
  _34 = D.14881;
  prev = VIEW_CONVERT_EXPR<__m128i>(_34);
  _35 = (sizetype) i;
  _36 = _35 + 8;
  _37 = in_near + _36;
  _38 = *_37;
  _39 = (unsigned short) _38;
  _40 = _39 * 3;
  _41 = (sizetype) i;
  _42 = _41 + 8;
  _43 = in_far + _42;
  _44 = *_43;
  _45 = (unsigned short) _44;
  _46 = _40 + _45;
  _47 = (short int) _46;
  _48 = (int) _47;
  nxt0.281_49 = nxt0;
  _50 = VIEW_CONVERT_EXPR<__v8hi>(nxt0.281_49);
  D.14882 = __builtin_ia32_vec_set_v8hi (_50, _48, 7);
  _51 = D.14882;
  next = VIEW_CONVERT_EXPR<__m128i>(_51);
  bias = _mm_set1_epi16 (8);
  curr.282_52 = curr;
  D.14883 = _mm_slli_epi16 (curr.282_52, 2);
  curs = D.14883;
  curr.283_53 = curr;
  prvd = _mm_sub_epi16 (prev, curr.283_53);
  curr.284_54 = curr;
  nxtd = _mm_sub_epi16 (next, curr.284_54);
  curb = _mm_add_epi16 (curs, bias);
  even = _mm_add_epi16 (prvd, curb);
  odd = _mm_add_epi16 (nxtd, curb);
  D.14884 = _mm_unpacklo_epi16 (even, odd);
  int0 = D.14884;
  D.14885 = _mm_unpackhi_epi16 (even, odd);
  int1 = D.14885;
  D.14886 = _mm_srli_epi16 (int0, 4);
  de0 = D.14886;
  D.14887 = _mm_srli_epi16 (int1, 4);
  de1 = D.14887;
  D.14888 = _mm_packus_epi16 (de0, de1);
  outv = D.14888;
  _55 = i * 2;
  _56 = (sizetype) _55;
  _57 = out + _56;
  _mm_storeu_si128 (_57, outv);
  _58 = (sizetype) i;
  _59 = _58 + 7;
  _60 = in_near + _59;
  _61 = *_60;
  _62 = (int) _61;
  _63 = _62 * 3;
  _64 = (sizetype) i;
  _65 = _64 + 7;
  _66 = in_far + _65;
  _67 = *_66;
  _68 = (int) _67;
  _69 = _63 + _68;
  t1 = _69;
  curr = {CLOBBER};
  prv0 = {CLOBBER};
  nxt0 = {CLOBBER};
  i = i + 8;
  goto <D.14871>;
  <D.11564>:
  t0 = t1;
  _70 = (sizetype) i;
  _71 = in_near + _70;
  _72 = *_71;
  _73 = (int) _72;
  _74 = _73 * 3;
  _75 = (sizetype) i;
  _76 = in_far + _75;
  _77 = *_76;
  _78 = (int) _77;
  _79 = _74 + _78;
  t1 = _79;
  t1.285_80 = t1;
  _81 = t1.285_80 * 3;
  _82 = t0 + _81;
  _83 = _82 + 8;
  _84 = _83 >> 4;
  _85 = i * 2;
  _86 = (sizetype) _85;
  _87 = out + _86;
  _88 = (unsigned char) _84;
  *_87 = _88;
  i = i + 1;
  <D.14873>:
  if (i >= w) goto <D.11566>; else goto <D.14874>;
  <D.14874>:
  t0 = t1;
  _89 = (sizetype) i;
  _90 = in_near + _89;
  _91 = *_90;
  _92 = (int) _91;
  _93 = _92 * 3;
  _94 = (sizetype) i;
  _95 = in_far + _94;
  _96 = *_95;
  _97 = (int) _96;
  _98 = _93 + _97;
  t1 = _98;
  _99 = t0 * 3;
  t1.286_100 = t1;
  _101 = _99 + t1.286_100;
  _102 = _101 + 8;
  _103 = _102 >> 4;
  _104 = i * 2;
  _105 = (sizetype) _104;
  _106 = _105 + 18446744073709551615;
  _107 = out + _106;
  _108 = (unsigned char) _103;
  *_107 = _108;
  t1.287_109 = t1;
  _110 = t1.287_109 * 3;
  _111 = t0 + _110;
  _112 = _111 + 8;
  _113 = _112 >> 4;
  _114 = i * 2;
  _115 = (sizetype) _114;
  _116 = out + _115;
  _117 = (unsigned char) _113;
  *_116 = _117;
  i = i + 1;
  goto <D.14873>;
  <D.11566>:
  t1.288_118 = t1;
  _119 = t1.288_118 + 2;
  _120 = _119 >> 2;
  _121 = w * 2;
  _122 = (sizetype) _121;
  _123 = _122 + 18446744073709551615;
  _124 = out + _123;
  _125 = (unsigned char) _120;
  *_124 = _125;
  D.14870 = out;
  goto <D.14891>;
  <D.14891>:
  t1 = {CLOBBER};
  goto <D.14875>;
  <D.14875>:
  return D.14870;
  <D.14889>:
  curr = {CLOBBER};
  prv0 = {CLOBBER};
  nxt0 = {CLOBBER};
  resx 2
  <D.14890>:
  t1 = {CLOBBER};
  resx 1
}



;; Function _mm_loadl_epi64 (_Z15_mm_loadl_epi64PKDv2_x, funcdef_no=647, decl_uid=9561, cgraph_uid=553, symbol_order=553)

__attribute__((artificial, always_inline, gnu_inline))
_mm_loadl_epi64 (const __m128i_u * {ref-all} __P)
{
  __m128i D.14892;

  _1 = MEM[(__m64_u * {ref-all})__P];
  D.14892 = _mm_set_epi64 ({ 0, 0 }, _1);
  goto <D.14893>;
  <D.14893>:
  return D.14892;
}



;; Function _mm_set_epi64 (_Z13_mm_set_epi64Dv2_iS_, funcdef_no=632, decl_uid=9465, cgraph_uid=538, symbol_order=538)

__attribute__((artificial, always_inline, gnu_inline))
_mm_set_epi64 (__m64 __q1, __m64 __q0)
{
  __m128i D.14894;

  _1 = VIEW_CONVERT_EXPR<long long int>(__q0);
  _2 = VIEW_CONVERT_EXPR<long long int>(__q1);
  D.14894 = _mm_set_epi64x (_2, _1);
  goto <D.14895>;
  <D.14895>:
  return D.14894;
}



;; Function _mm_set_epi64x (_Z14_mm_set_epi64xxx, funcdef_no=631, decl_uid=9461, cgraph_uid=537, symbol_order=537)

__attribute__((artificial, always_inline, gnu_inline))
_mm_set_epi64x (long long int __q1, long long int __q0)
{
  __m128i D.14896;

  D.14896 = {__q0, __q1};
  goto <D.14897>;
  <D.14897>:
  return D.14896;
}



;; Function _mm_set1_epi16 (_Z14_mm_set1_epi16s, funcdef_no=639, decl_uid=9511, cgraph_uid=545, symbol_order=545)

__attribute__((artificial, always_inline, gnu_inline))
_mm_set1_epi16 (short int __A)
{
  __m128i D.14898;

  _1 = (int) __A;
  _2 = (int) __A;
  _3 = (int) __A;
  _4 = (int) __A;
  _5 = (int) __A;
  _6 = (int) __A;
  _7 = (int) __A;
  _8 = (int) __A;
  D.14898 = _mm_set_epi16 (_8, _7, _6, _5, _4, _3, _2, _1);
  goto <D.14899>;
  <D.14899>:
  return D.14898;
}



;; Function _mm_slli_epi16 (_Z14_mm_slli_epi16Dv2_xi, funcdef_no=715, decl_uid=9809, cgraph_uid=621, symbol_order=621)

__attribute__((artificial, always_inline, gnu_inline))
_mm_slli_epi16 (__m128i __A, int __B)
{
  vector(8) short int D.14902;
  __m128i D.14900;

  _1 = VIEW_CONVERT_EXPR<__v8hi>(__A);
  D.14902 = __builtin_ia32_psllwi128 (_1, __B);
  _2 = D.14902;
  D.14900 = VIEW_CONVERT_EXPR<__m128i>(_2);
  goto <D.14901>;
  <D.14901>:
  return D.14900;
}



;; Function _mm_srli_epi16 (_Z14_mm_srli_epi16Dv2_xi, funcdef_no=720, decl_uid=9829, cgraph_uid=626, symbol_order=626)

__attribute__((artificial, always_inline, gnu_inline))
_mm_srli_epi16 (__m128i __A, int __B)
{
  vector(8) short int D.14905;
  __m128i D.14903;

  _1 = VIEW_CONVERT_EXPR<__v8hi>(__A);
  D.14905 = __builtin_ia32_psrlwi128 (_1, __B);
  _2 = D.14905;
  D.14903 = VIEW_CONVERT_EXPR<__m128i>(_2);
  goto <D.14904>;
  <D.14904>:
  return D.14903;
}



;; Function _mm_storeu_si128 (_Z16_mm_storeu_si128PDv2_xS_, funcdef_no=649, decl_uid=9569, cgraph_uid=555, symbol_order=555)

__attribute__((artificial, always_inline, gnu_inline))
_mm_storeu_si128 (__m128i_u * {ref-all} __P, __m128i __B)
{
  *__P = __B;
  return;
}



;; Function stbi__resample_row_generic (_ZL26stbi__resample_row_genericPhS_S_ii, funcdef_no=867, decl_uid=11573, cgraph_uid=773, symbol_order=788)

stbi__resample_row_generic (stbi_uc * out, stbi_uc * in_near, stbi_uc * in_far, int w, int hs)
{
  int j;
  int i;
  stbi_uc * D.14910;

  i = 0;
  <D.14906>:
  if (i >= w) goto <D.11577>; else goto <D.14907>;
  <D.14907>:
  j = 0;
  <D.14908>:
  if (j >= hs) goto <D.11579>; else goto <D.14909>;
  <D.14909>:
  _1 = (sizetype) i;
  _2 = in_near + _1;
  _3 = i * hs;
  _4 = j + _3;
  _5 = (sizetype) _4;
  _6 = out + _5;
  _7 = *_2;
  *_6 = _7;
  j = j + 1;
  goto <D.14908>;
  <D.11579>:
  i = i + 1;
  goto <D.14906>;
  <D.11577>:
  D.14910 = out;
  goto <D.14911>;
  <D.14911>:
  return D.14910;
}



;; Function stbi__YCbCr_to_RGB_row (_ZL22stbi__YCbCr_to_RGB_rowPhPKhS1_S1_ii, funcdef_no=868, decl_uid=11587, cgraph_uid=774, symbol_order=789)

stbi__YCbCr_to_RGB_row (stbi_uc * out, const stbi_uc * y, const stbi_uc * pcb, const stbi_uc * pcr, int count, int step)
{
  int cb;
  int cr;
  int b;
  int g;
  int r;
  int y_fixed;
  int i;

  i = 0;
  <D.14912>:
  if (i >= count) goto <D.11596>; else goto <D.14913>;
  <D.14913>:
  _1 = (sizetype) i;
  _2 = y + _1;
  _3 = *_2;
  _4 = (int) _3;
  _5 = _4 << 20;
  y_fixed = _5 + 524288;
  _6 = (sizetype) i;
  _7 = pcr + _6;
  _8 = *_7;
  _9 = (int) _8;
  cr = _9 + -128;
  _10 = (sizetype) i;
  _11 = pcb + _10;
  _12 = *_11;
  _13 = (int) _12;
  cb = _13 + -128;
  _14 = cr * 1470208;
  r = y_fixed + _14;
  _15 = cr * -748800;
  _16 = y_fixed + _15;
  _17 = (unsigned int) _16;
  _18 = cb * -360960;
  _19 = (unsigned int) _18;
  _20 = _19 & 4294901760;
  _21 = _17 + _20;
  g = (int) _21;
  _22 = cb * 1858048;
  b = y_fixed + _22;
  r = r >> 20;
  g = g >> 20;
  b = b >> 20;
  r.289_23 = (unsigned int) r;
  if (r.289_23 > 255) goto <D.14914>; else goto <D.14915>;
  <D.14914>:
  if (r < 0) goto <D.14916>; else goto <D.14917>;
  <D.14916>:
  r = 0;
  goto <D.14918>;
  <D.14917>:
  r = 255;
  <D.14918>:
  goto <D.14919>;
  <D.14915>:
  <D.14919>:
  g.290_24 = (unsigned int) g;
  if (g.290_24 > 255) goto <D.14920>; else goto <D.14921>;
  <D.14920>:
  if (g < 0) goto <D.14922>; else goto <D.14923>;
  <D.14922>:
  g = 0;
  goto <D.14924>;
  <D.14923>:
  g = 255;
  <D.14924>:
  goto <D.14925>;
  <D.14921>:
  <D.14925>:
  b.291_25 = (unsigned int) b;
  if (b.291_25 > 255) goto <D.14926>; else goto <D.14927>;
  <D.14926>:
  if (b < 0) goto <D.14928>; else goto <D.14929>;
  <D.14928>:
  b = 0;
  goto <D.14930>;
  <D.14929>:
  b = 255;
  <D.14930>:
  goto <D.14931>;
  <D.14927>:
  <D.14931>:
  _26 = (unsigned char) r;
  *out = _26;
  _27 = out + 1;
  _28 = (unsigned char) g;
  *_27 = _28;
  _29 = out + 2;
  _30 = (unsigned char) b;
  *_29 = _30;
  _31 = out + 3;
  *_31 = 255;
  _32 = (sizetype) step;
  out = out + _32;
  i = i + 1;
  goto <D.14912>;
  <D.11596>:
  return;
}



;; Function stbi__YCbCr_to_RGB_simd (_ZL23stbi__YCbCr_to_RGB_simdPhPKhS1_S1_ii, funcdef_no=869, decl_uid=11604, cgraph_uid=775, symbol_order=790)

stbi__YCbCr_to_RGB_simd (stbi_uc * out, const stbi_uc * y, const stbi_uc * pcb, const stbi_uc * pcr, int count, int step)
{
  __m128i D.14973;
  __m128i D.14972;
  __m128i D.14971;
  __m128i D.14970;
  __m128i D.14969;
  __m128i D.14968;
  __m128i D.14967;
  __m128i D.14966;
  __m128i D.14965;
  __m128i D.14964;
  __m128i D.14963;
  __m128i D.14962;
  __m128i D.14961;
  __m128i D.14960;
  __m128i D.14959;
  __m128i D.14958;
  __m128i D.14957;
  int cb;
  int cr;
  int b;
  int g;
  int r;
  int y_fixed;
  __m128i o1;
  __m128i o0;
  __m128i t1;
  __m128i t0;
  __m128i gxb;
  __m128i brb;
  __m128i gw;
  __m128i bw;
  __m128i rw;
  __m128i gws;
  __m128i bws;
  __m128i gwt;
  __m128i rws;
  __m128i cr1;
  __m128i cb1;
  __m128i cb0;
  __m128i cr0;
  __m128i yws;
  __m128i cbw;
  __m128i crw;
  __m128i yw;
  __m128i cb_biased;
  __m128i cr_biased;
  __m128i cb_bytes;
  __m128i cr_bytes;
  __m128i y_bytes;
  __m128i xw;
  __m128i y_bias;
  __m128i cb_const1;
  __m128i cb_const0;
  __m128i cr_const1;
  __m128i cr_const0;
  __m128i signflip;
  int i;

  i = 0;
  if (step == 4) goto <D.14932>; else goto <D.14933>;
  <D.14932>:
  signflip = _mm_set1_epi8 (-128);
  cr_const0 = _mm_set1_epi16 (5743);
  cr_const1 = _mm_set1_epi16 (-2925);
  cb_const0 = _mm_set1_epi16 (-1410);
  cb_const1 = _mm_set1_epi16 (7258);
  y_bias = _mm_set1_epi8 (-128);
  xw = _mm_set1_epi16 (255);
  <D.14934>:
  _1 = i + 7;
  if (count <= _1) goto <D.11646>; else goto <D.14935>;
  <D.14935>:
  _2 = (sizetype) i;
  _3 = y + _2;
  y_bytes = _mm_loadl_epi64 (_3);
  _4 = (sizetype) i;
  _5 = pcr + _4;
  cr_bytes = _mm_loadl_epi64 (_5);
  _6 = (sizetype) i;
  _7 = pcb + _6;
  cb_bytes = _mm_loadl_epi64 (_7);
  cr_biased = _mm_xor_si128 (cr_bytes, signflip);
  cb_biased = _mm_xor_si128 (cb_bytes, signflip);
  D.14957 = _mm_unpacklo_epi8 (y_bias, y_bytes);
  yw = D.14957;
  _8 = _mm_setzero_si128 ();
  D.14958 = _mm_unpacklo_epi8 (_8, cr_biased);
  crw = D.14958;
  _9 = _mm_setzero_si128 ();
  D.14959 = _mm_unpacklo_epi8 (_9, cb_biased);
  cbw = D.14959;
  D.14960 = _mm_srli_epi16 (yw, 4);
  yws = D.14960;
  D.14961 = _mm_mulhi_epi16 (cr_const0, crw);
  cr0 = D.14961;
  D.14962 = _mm_mulhi_epi16 (cb_const0, cbw);
  cb0 = D.14962;
  D.14963 = _mm_mulhi_epi16 (cbw, cb_const1);
  cb1 = D.14963;
  D.14964 = _mm_mulhi_epi16 (crw, cr_const1);
  cr1 = D.14964;
  rws = _mm_add_epi16 (cr0, yws);
  gwt = _mm_add_epi16 (cb0, yws);
  bws = _mm_add_epi16 (yws, cb1);
  gws = _mm_add_epi16 (gwt, cr1);
  D.14965 = _mm_srai_epi16 (rws, 4);
  rw = D.14965;
  D.14966 = _mm_srai_epi16 (bws, 4);
  bw = D.14966;
  D.14967 = _mm_srai_epi16 (gws, 4);
  gw = D.14967;
  D.14968 = _mm_packus_epi16 (rw, bw);
  brb = D.14968;
  D.14969 = _mm_packus_epi16 (gw, xw);
  gxb = D.14969;
  D.14970 = _mm_unpacklo_epi8 (brb, gxb);
  t0 = D.14970;
  D.14971 = _mm_unpackhi_epi8 (brb, gxb);
  t1 = D.14971;
  D.14972 = _mm_unpacklo_epi16 (t0, t1);
  o0 = D.14972;
  D.14973 = _mm_unpackhi_epi16 (t0, t1);
  o1 = D.14973;
  _mm_storeu_si128 (out, o0);
  _10 = out + 16;
  _mm_storeu_si128 (_10, o1);
  out = out + 32;
  i = i + 8;
  goto <D.14934>;
  <D.11646>:
  goto <D.14936>;
  <D.14933>:
  <D.14936>:
  <D.14937>:
  if (i >= count) goto <D.11648>; else goto <D.14938>;
  <D.14938>:
  _11 = (sizetype) i;
  _12 = y + _11;
  _13 = *_12;
  _14 = (int) _13;
  _15 = _14 << 20;
  y_fixed = _15 + 524288;
  _16 = (sizetype) i;
  _17 = pcr + _16;
  _18 = *_17;
  _19 = (int) _18;
  cr = _19 + -128;
  _20 = (sizetype) i;
  _21 = pcb + _20;
  _22 = *_21;
  _23 = (int) _22;
  cb = _23 + -128;
  _24 = cr * 1470208;
  r = y_fixed + _24;
  _25 = cr * -748800;
  _26 = y_fixed + _25;
  _27 = (unsigned int) _26;
  _28 = cb * -360960;
  _29 = (unsigned int) _28;
  _30 = _29 & 4294901760;
  _31 = _27 + _30;
  g = (int) _31;
  _32 = cb * 1858048;
  b = y_fixed + _32;
  r = r >> 20;
  g = g >> 20;
  b = b >> 20;
  r.292_33 = (unsigned int) r;
  if (r.292_33 > 255) goto <D.14939>; else goto <D.14940>;
  <D.14939>:
  if (r < 0) goto <D.14941>; else goto <D.14942>;
  <D.14941>:
  r = 0;
  goto <D.14943>;
  <D.14942>:
  r = 255;
  <D.14943>:
  goto <D.14944>;
  <D.14940>:
  <D.14944>:
  g.293_34 = (unsigned int) g;
  if (g.293_34 > 255) goto <D.14945>; else goto <D.14946>;
  <D.14945>:
  if (g < 0) goto <D.14947>; else goto <D.14948>;
  <D.14947>:
  g = 0;
  goto <D.14949>;
  <D.14948>:
  g = 255;
  <D.14949>:
  goto <D.14950>;
  <D.14946>:
  <D.14950>:
  b.294_35 = (unsigned int) b;
  if (b.294_35 > 255) goto <D.14951>; else goto <D.14952>;
  <D.14951>:
  if (b < 0) goto <D.14953>; else goto <D.14954>;
  <D.14953>:
  b = 0;
  goto <D.14955>;
  <D.14954>:
  b = 255;
  <D.14955>:
  goto <D.14956>;
  <D.14952>:
  <D.14956>:
  _36 = (unsigned char) r;
  *out = _36;
  _37 = out + 1;
  _38 = (unsigned char) g;
  *_37 = _38;
  _39 = out + 2;
  _40 = (unsigned char) b;
  *_39 = _40;
  _41 = out + 3;
  *_41 = 255;
  _42 = (sizetype) step;
  out = out + _42;
  i = i + 1;
  goto <D.14937>;
  <D.11648>:
  return;
}



;; Function _mm_set1_epi8 (_Z13_mm_set1_epi8c, funcdef_no=640, decl_uid=9514, cgraph_uid=546, symbol_order=546)

__attribute__((artificial, always_inline, gnu_inline))
_mm_set1_epi8 (char __A)
{
  __m128i D.14974;

  _1 = (int) __A;
  _2 = (int) __A;
  _3 = (int) __A;
  _4 = (int) __A;
  _5 = (int) __A;
  _6 = (int) __A;
  _7 = (int) __A;
  _8 = (int) __A;
  _9 = (int) __A;
  _10 = (int) __A;
  _11 = (int) __A;
  _12 = (int) __A;
  _13 = (int) __A;
  _14 = (int) __A;
  _15 = (int) __A;
  _16 = (int) __A;
  D.14974 = _mm_set_epi8 (_16, _15, _14, _13, _12, _11, _10, _9, _8, _7, _6, _5, _4, _3, _2, _1);
  goto <D.14975>;
  <D.14975>:
  return D.14974;
}



;; Function _mm_set_epi8 (_Z12_mm_set_epi8cccccccccccccccc, funcdef_no=635, decl_uid=9499, cgraph_uid=541, symbol_order=541)

__attribute__((artificial, always_inline, gnu_inline))
_mm_set_epi8 (char __q15, char __q14, char __q13, char __q12, char __q11, char __q10, char __q09, char __q08, char __q07, char __q06, char __q05, char __q04, char __q03, char __q02, char __q01, char __q00)
{
  __m128i D.14976;

  _1 = {__q00, __q01, __q02, __q03, __q04, __q05, __q06, __q07, __q08, __q09, __q10, __q11, __q12, __q13, __q14, __q15};
  D.14976 = VIEW_CONVERT_EXPR<__m128i>(_1);
  goto <D.14977>;
  <D.14977>:
  return D.14976;
}



;; Function _mm_xor_si128 (_Z13_mm_xor_si128Dv2_xS_, funcdef_no=734, decl_uid=9885, cgraph_uid=640, symbol_order=640)

__attribute__((artificial, always_inline, gnu_inline))
_mm_xor_si128 (__m128i __A, __m128i __B)
{
  __m128i D.14978;

  _1 = VIEW_CONVERT_EXPR<__v2du>(__A);
  _2 = VIEW_CONVERT_EXPR<__v2du>(__B);
  _3 = _1 ^ _2;
  D.14978 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14979>;
  <D.14979>:
  return D.14978;
}



;; Function _mm_mulhi_epi16 (_Z15_mm_mulhi_epi16Dv2_xS_, funcdef_no=711, decl_uid=9793, cgraph_uid=617, symbol_order=617)

__attribute__((artificial, always_inline, gnu_inline))
_mm_mulhi_epi16 (__m128i __A, __m128i __B)
{
  vector(8) short int D.14982;
  __m128i D.14980;

  _1 = VIEW_CONVERT_EXPR<__v8hi>(__B);
  _2 = VIEW_CONVERT_EXPR<__v8hi>(__A);
  D.14982 = __builtin_ia32_pmulhw128 (_2, _1);
  _3 = D.14982;
  D.14980 = VIEW_CONVERT_EXPR<__m128i>(_3);
  goto <D.14981>;
  <D.14981>:
  return D.14980;
}



;; Function _mm_srai_epi16 (_Z14_mm_srai_epi16Dv2_xi, funcdef_no=718, decl_uid=9821, cgraph_uid=624, symbol_order=624)

__attribute__((artificial, always_inline, gnu_inline))
_mm_srai_epi16 (__m128i __A, int __B)
{
  vector(8) short int D.14985;
  __m128i D.14983;

  _1 = VIEW_CONVERT_EXPR<__v8hi>(__A);
  D.14985 = __builtin_ia32_psrawi128 (_1, __B);
  _2 = D.14985;
  D.14983 = VIEW_CONVERT_EXPR<__m128i>(_2);
  goto <D.14984>;
  <D.14984>:
  return D.14983;
}



;; Function stbi__setup_jpeg (_ZL16stbi__setup_jpegP10stbi__jpeg, funcdef_no=870, decl_uid=11651, cgraph_uid=776, symbol_order=791)

stbi__setup_jpeg (struct stbi__jpeg * j)
{
  bool retval.295;

  j->idct_block_kernel = stbi__idct_block;
  j->YCbCr_to_RGB_kernel = stbi__YCbCr_to_RGB_row;
  j->resample_row_hv_2_kernel = stbi__resample_row_hv_2;
  _1 = stbi__sse2_available ();
  retval.295 = _1 != 0;
  if (retval.295 != 0) goto <D.14987>; else goto <D.14988>;
  <D.14987>:
  j->idct_block_kernel = stbi__idct_simd;
  j->YCbCr_to_RGB_kernel = stbi__YCbCr_to_RGB_simd;
  j->resample_row_hv_2_kernel = stbi__resample_row_hv_2_simd;
  goto <D.14989>;
  <D.14988>:
  <D.14989>:
  return;
}



;; Function stbi__cleanup_jpeg (_ZL18stbi__cleanup_jpegP10stbi__jpeg, funcdef_no=871, decl_uid=11654, cgraph_uid=777, symbol_order=792)

stbi__cleanup_jpeg (struct stbi__jpeg * j)
{
  _1 = j->s;
  _2 = _1->img_n;
  stbi__free_jpeg_components (j, _2, 0);
  return;
}



;; Function stbi__blinn_8x8 (_ZL15stbi__blinn_8x8hh, funcdef_no=872, decl_uid=11669, cgraph_uid=778, symbol_order=793)

stbi__blinn_8x8 (stbi_uc x, stbi_uc y)
{
  unsigned int t;
  stbi_uc D.14990;

  _1 = (int) x;
  _2 = (int) y;
  _3 = _1 * _2;
  _4 = _3 + 128;
  t = (unsigned int) _4;
  _5 = t >> 8;
  _6 = t + _5;
  _7 = _6 >> 8;
  D.14990 = (stbi_uc) _7;
  goto <D.14991>;
  <D.14991>:
  return D.14990;
}



;; Function load_jpeg_image (_ZL15load_jpeg_imageP10stbi__jpegPiS1_S1_i, funcdef_no=873, decl_uid=11677, cgraph_uid=779, symbol_order=794)

load_jpeg_image (struct stbi__jpeg * z, int * out_x, int * out_y, int * comp, int req_comp)
{
  stbi_uc * D.15125;
  int D.15124;
  stbi_uc * y;
  stbi_uc b;
  stbi_uc g;
  stbi_uc r;
  stbi_uc m;
  stbi_uc m;
  stbi_uc m;
  stbi_uc * y;
  int y_bot;
  struct stbi__resample * r;
  stbi_uc * out;
  struct stbi__resample * r;
  struct stbi__resample res_comp[4];
  stbi_uc * coutput[4];
  stbi_uc * output;
  unsigned int j;
  unsigned int i;
  int k;
  int is_rgb;
  int decode_n;
  int n;
  int iftmp.308;
  bool retval.304;
  bool retval.303;
  stbi_uc * iftmp.302;
  stbi_uc * iftmp.301;
  bool iftmp.299;
  int iftmp.298;
  int iftmp.297;
  bool retval.296;
  stbi_uc * D.14995;

  _1 = z->s;
  _1->img_n = 0;
  if (req_comp < 0) goto <D.14992>; else goto <D.14994>;
  <D.14994>:
  if (req_comp > 4) goto <D.14992>; else goto <D.14993>;
  <D.14992>:
  stbi__err ("bad req_comp");
  D.14995 = 0B;
  goto <D.15123>;
  <D.14993>:
  D.15124 = stbi__decode_jpeg_image (z);
  _2 = D.15124;
  retval.296 = _2 == 0;
  if (retval.296 != 0) goto <D.14997>; else goto <D.14998>;
  <D.14997>:
  stbi__cleanup_jpeg (z);
  D.14995 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15123>;
  <D.14998>:
  if (req_comp == 0) goto <D.15000>; else goto <D.15001>;
  <D.15000>:
  _3 = z->s;
  _4 = _3->img_n;
  if (_4 > 2) goto <D.15003>; else goto <D.15004>;
  <D.15003>:
  iftmp.298 = 3;
  goto <D.15005>;
  <D.15004>:
  iftmp.298 = 1;
  <D.15005>:
  iftmp.297 = iftmp.298;
  goto <D.15006>;
  <D.15001>:
  iftmp.297 = req_comp;
  <D.15006>:
  n = iftmp.297;
  _5 = z->s;
  _6 = _5->img_n;
  if (_6 == 3) goto <D.15011>; else goto <D.15008>;
  <D.15011>:
  _7 = z->rgb;
  if (_7 == 3) goto <D.15009>; else goto <D.15012>;
  <D.15012>:
  _8 = z->app14_color_transform;
  if (_8 == 0) goto <D.15013>; else goto <D.15008>;
  <D.15013>:
  _9 = z->jfif;
  if (_9 == 0) goto <D.15009>; else goto <D.15008>;
  <D.15009>:
  iftmp.299 = 1;
  goto <D.15010>;
  <D.15008>:
  iftmp.299 = 0;
  <D.15010>:
  is_rgb = (int) iftmp.299;
  _10 = z->s;
  _11 = _10->img_n;
  if (_11 == 3) goto <D.15016>; else goto <D.15014>;
  <D.15016>:
  if (n <= 2) goto <D.15017>; else goto <D.15014>;
  <D.15017>:
  if (is_rgb == 0) goto <D.15018>; else goto <D.15014>;
  <D.15018>:
  decode_n = 1;
  goto <D.15015>;
  <D.15014>:
  _12 = z->s;
  decode_n = _12->img_n;
  <D.15015>:
  coutput[0] = 0B;
  coutput[1] = 0B;
  coutput[2] = 0B;
  coutput[3] = 0B;
  k = 0;
  <D.15019>:
  if (k >= decode_n) goto <D.11733>; else goto <D.15020>;
  <D.15020>:
  r = &res_comp[k];
  _13 = z->s;
  _14 = _13->img_x;
  _15 = _14 + 3;
  _16 = (long long unsigned int) _15;
  _17 = stbi__malloc (_16);
  z->img_comp[k].linebuf = _17;
  _18 = z->img_comp[k].linebuf;
  if (_18 == 0B) goto <D.15021>; else goto <D.15022>;
  <D.15021>:
  stbi__cleanup_jpeg (z);
  stbi__err ("outofmem");
  D.14995 = 0B;
  goto <D.15127>;
  <D.15022>:
  _19 = z->img_h_max;
  _20 = z->img_comp[k].h;
  _21 = _19 / _20;
  r->hs = _21;
  _22 = z->img_v_max;
  _23 = z->img_comp[k].v;
  _24 = _22 / _23;
  r->vs = _24;
  _25 = r->vs;
  _26 = _25 >> 1;
  r->ystep = _26;
  _27 = z->s;
  _28 = _27->img_x;
  _29 = r->hs;
  _30 = (unsigned int) _29;
  _31 = _28 + _30;
  _32 = _31 + 4294967295;
  _33 = r->hs;
  _34 = (unsigned int) _33;
  _35 = _32 / _34;
  _36 = (int) _35;
  r->w_lores = _36;
  r->ypos = 0;
  _37 = z->img_comp[k].data;
  r->line1 = _37;
  _38 = r->line1;
  r->line0 = _38;
  _39 = r->hs;
  if (_39 == 1) goto <D.15025>; else goto <D.15023>;
  <D.15025>:
  _40 = r->vs;
  if (_40 == 1) goto <D.15026>; else goto <D.15023>;
  <D.15026>:
  r->resample = resample_row_1;
  goto <D.15024>;
  <D.15023>:
  _41 = r->hs;
  if (_41 == 1) goto <D.15029>; else goto <D.15027>;
  <D.15029>:
  _42 = r->vs;
  if (_42 == 2) goto <D.15030>; else goto <D.15027>;
  <D.15030>:
  r->resample = stbi__resample_row_v_2;
  goto <D.15028>;
  <D.15027>:
  _43 = r->hs;
  if (_43 == 2) goto <D.15033>; else goto <D.15031>;
  <D.15033>:
  _44 = r->vs;
  if (_44 == 1) goto <D.15034>; else goto <D.15031>;
  <D.15034>:
  r->resample = stbi__resample_row_h_2;
  goto <D.15032>;
  <D.15031>:
  _45 = r->hs;
  if (_45 == 2) goto <D.15037>; else goto <D.15035>;
  <D.15037>:
  _46 = r->vs;
  if (_46 == 2) goto <D.15038>; else goto <D.15035>;
  <D.15038>:
  _47 = z->resample_row_hv_2_kernel;
  r->resample = _47;
  goto <D.15036>;
  <D.15035>:
  r->resample = stbi__resample_row_generic;
  <D.15036>:
  <D.15032>:
  <D.15028>:
  <D.15024>:
  k = k + 1;
  goto <D.15019>;
  <D.11733>:
  _48 = z->s;
  _49 = _48->img_y;
  _50 = (int) _49;
  _51 = z->s;
  _52 = _51->img_x;
  _53 = (int) _52;
  output = stbi__malloc_mad3 (n, _53, _50, 1);
  if (output == 0B) goto <D.15039>; else goto <D.15040>;
  <D.15039>:
  stbi__cleanup_jpeg (z);
  stbi__err ("outofmem");
  D.14995 = 0B;
  goto <D.15127>;
  <D.15040>:
  j = 0;
  <D.15041>:
  _54 = z->s;
  _55 = _54->img_y;
  if (j >= _55) goto <D.11735>; else goto <D.15042>;
  <D.15042>:
  _56 = z->s;
  _57 = _56->img_x;
  n.300_58 = (unsigned int) n;
  _59 = _57 * n.300_58;
  _60 = j * _59;
  _61 = (sizetype) _60;
  out = output + _61;
  k = 0;
  <D.15043>:
  if (k >= decode_n) goto <D.11737>; else goto <D.15044>;
  <D.15044>:
  r = &res_comp[k];
  _62 = r->ystep;
  _63 = r->vs;
  _64 = _63 >> 1;
  _65 = _62 >= _64;
  y_bot = (int) _65;
  _66 = r->resample;
  _67 = r->hs;
  _68 = r->w_lores;
  if (y_bot != 0) goto <D.15046>; else goto <D.15047>;
  <D.15046>:
  iftmp.301 = r->line0;
  goto <D.15048>;
  <D.15047>:
  iftmp.301 = r->line1;
  <D.15048>:
  if (y_bot != 0) goto <D.15050>; else goto <D.15051>;
  <D.15050>:
  iftmp.302 = r->line1;
  goto <D.15052>;
  <D.15051>:
  iftmp.302 = r->line0;
  <D.15052>:
  _69 = z->img_comp[k].linebuf;
  D.15125 = _66 (_69, iftmp.302, iftmp.301, _68, _67);
  _70 = D.15125;
  coutput[k] = _70;
  _71 = r->ystep;
  _72 = _71 + 1;
  r->ystep = _72;
  _73 = r->ystep;
  _74 = r->vs;
  retval.303 = _73 >= _74;
  if (retval.303 != 0) goto <D.15054>; else goto <D.15055>;
  <D.15054>:
  r->ystep = 0;
  _75 = r->line1;
  r->line0 = _75;
  _76 = r->ypos;
  _77 = _76 + 1;
  r->ypos = _77;
  _78 = r->ypos;
  _79 = z->img_comp[k].y;
  retval.304 = _78 < _79;
  if (retval.304 != 0) goto <D.15057>; else goto <D.15058>;
  <D.15057>:
  _80 = r->line1;
  _81 = z->img_comp[k].w2;
  _82 = (sizetype) _81;
  _83 = _80 + _82;
  r->line1 = _83;
  goto <D.15059>;
  <D.15058>:
  <D.15059>:
  goto <D.15060>;
  <D.15055>:
  <D.15060>:
  k = k + 1;
  goto <D.15043>;
  <D.11737>:
  if (n > 2) goto <D.15061>; else goto <D.15062>;
  <D.15061>:
  y = coutput[0];
  _84 = z->s;
  _85 = _84->img_n;
  if (_85 == 3) goto <D.15063>; else goto <D.15064>;
  <D.15063>:
  if (is_rgb != 0) goto <D.15065>; else goto <D.15066>;
  <D.15065>:
  i = 0;
  <D.15067>:
  _86 = z->s;
  _87 = _86->img_x;
  if (i >= _87) goto <D.11739>; else goto <D.15068>;
  <D.15068>:
  _88 = (sizetype) i;
  _89 = y + _88;
  _90 = *_89;
  *out = _90;
  _91 = coutput[1];
  _92 = (sizetype) i;
  _93 = _91 + _92;
  _94 = out + 1;
  _95 = *_93;
  *_94 = _95;
  _96 = coutput[2];
  _97 = (sizetype) i;
  _98 = _96 + _97;
  _99 = out + 2;
  _100 = *_98;
  *_99 = _100;
  _101 = out + 3;
  *_101 = 255;
  _102 = (sizetype) n;
  out = out + _102;
  i = i + 1;
  goto <D.15067>;
  <D.11739>:
  goto <D.15069>;
  <D.15066>:
  _103 = z->YCbCr_to_RGB_kernel;
  _104 = z->s;
  _105 = _104->img_x;
  _106 = (int) _105;
  _107 = coutput[2];
  _108 = coutput[1];
  _103 (out, y, _108, _107, _106, n);
  <D.15069>:
  goto <D.15070>;
  <D.15064>:
  _109 = z->s;
  _110 = _109->img_n;
  if (_110 == 4) goto <D.15071>; else goto <D.15072>;
  <D.15071>:
  _111 = z->app14_color_transform;
  if (_111 == 0) goto <D.15073>; else goto <D.15074>;
  <D.15073>:
  i = 0;
  <D.15075>:
  _112 = z->s;
  _113 = _112->img_x;
  if (i >= _113) goto <D.11741>; else goto <D.15076>;
  <D.15076>:
  _114 = coutput[3];
  _115 = (sizetype) i;
  _116 = _114 + _115;
  m = *_116;
  _117 = (int) m;
  _118 = coutput[0];
  _119 = (sizetype) i;
  _120 = _118 + _119;
  _121 = *_120;
  _122 = (int) _121;
  _123 = stbi__blinn_8x8 (_122, _117);
  *out = _123;
  _124 = (int) m;
  _125 = coutput[1];
  _126 = (sizetype) i;
  _127 = _125 + _126;
  _128 = *_127;
  _129 = (int) _128;
  _130 = out + 1;
  _131 = stbi__blinn_8x8 (_129, _124);
  *_130 = _131;
  _132 = (int) m;
  _133 = coutput[2];
  _134 = (sizetype) i;
  _135 = _133 + _134;
  _136 = *_135;
  _137 = (int) _136;
  _138 = out + 2;
  _139 = stbi__blinn_8x8 (_137, _132);
  *_138 = _139;
  _140 = out + 3;
  *_140 = 255;
  _141 = (sizetype) n;
  out = out + _141;
  i = i + 1;
  goto <D.15075>;
  <D.11741>:
  goto <D.15077>;
  <D.15074>:
  _142 = z->app14_color_transform;
  if (_142 == 2) goto <D.15078>; else goto <D.15079>;
  <D.15078>:
  _143 = z->YCbCr_to_RGB_kernel;
  _144 = z->s;
  _145 = _144->img_x;
  _146 = (int) _145;
  _147 = coutput[2];
  _148 = coutput[1];
  _143 (out, y, _148, _147, _146, n);
  i = 0;
  <D.15080>:
  _149 = z->s;
  _150 = _149->img_x;
  if (i >= _150) goto <D.11743>; else goto <D.15081>;
  <D.15081>:
  _151 = coutput[3];
  _152 = (sizetype) i;
  _153 = _151 + _152;
  m = *_153;
  _154 = (int) m;
  _155 = *out;
  _156 = ~_155;
  _157 = (int) _156;
  _158 = stbi__blinn_8x8 (_157, _154);
  *out = _158;
  _159 = (int) m;
  _160 = out + 1;
  _161 = *_160;
  _162 = ~_161;
  _163 = (int) _162;
  _164 = out + 1;
  _165 = stbi__blinn_8x8 (_163, _159);
  *_164 = _165;
  _166 = (int) m;
  _167 = out + 2;
  _168 = *_167;
  _169 = ~_168;
  _170 = (int) _169;
  _171 = out + 2;
  _172 = stbi__blinn_8x8 (_170, _166);
  *_171 = _172;
  _173 = (sizetype) n;
  out = out + _173;
  i = i + 1;
  goto <D.15080>;
  <D.11743>:
  goto <D.15082>;
  <D.15079>:
  _174 = z->YCbCr_to_RGB_kernel;
  _175 = z->s;
  _176 = _175->img_x;
  _177 = (int) _176;
  _178 = coutput[2];
  _179 = coutput[1];
  _174 (out, y, _179, _178, _177, n);
  <D.15082>:
  <D.15077>:
  goto <D.15083>;
  <D.15072>:
  i = 0;
  <D.15084>:
  _180 = z->s;
  _181 = _180->img_x;
  if (i >= _181) goto <D.11745>; else goto <D.15085>;
  <D.15085>:
  _182 = (sizetype) i;
  _183 = y + _182;
  _184 = out + 2;
  _185 = *_183;
  *_184 = _185;
  _186 = out + 1;
  _187 = *_184;
  *_186 = _187;
  _188 = *_186;
  *out = _188;
  _189 = out + 3;
  *_189 = 255;
  _190 = (sizetype) n;
  out = out + _190;
  i = i + 1;
  goto <D.15084>;
  <D.11745>:
  <D.15083>:
  <D.15070>:
  goto <D.15086>;
  <D.15062>:
  if (is_rgb != 0) goto <D.15087>; else goto <D.15088>;
  <D.15087>:
  if (n == 1) goto <D.15089>; else goto <D.15090>;
  <D.15089>:
  i = 0;
  <D.15091>:
  _191 = z->s;
  _192 = _191->img_x;
  if (i >= _192) goto <D.11747>; else goto <D.15092>;
  <D.15092>:
  _193 = coutput[2];
  _194 = (sizetype) i;
  _195 = _193 + _194;
  _196 = *_195;
  _197 = (int) _196;
  _198 = coutput[1];
  _199 = (sizetype) i;
  _200 = _198 + _199;
  _201 = *_200;
  _202 = (int) _201;
  _203 = coutput[0];
  _204 = (sizetype) i;
  _205 = _203 + _204;
  _206 = *_205;
  _207 = (int) _206;
  out.305_208 = out;
  out = out.305_208 + 1;
  _209 = stbi__compute_y (_207, _202, _197);
  *out.305_208 = _209;
  i = i + 1;
  goto <D.15091>;
  <D.11747>:
  goto <D.15093>;
  <D.15090>:
  i = 0;
  <D.15094>:
  _210 = z->s;
  _211 = _210->img_x;
  if (i >= _211) goto <D.11749>; else goto <D.15095>;
  <D.15095>:
  _212 = coutput[2];
  _213 = (sizetype) i;
  _214 = _212 + _213;
  _215 = *_214;
  _216 = (int) _215;
  _217 = coutput[1];
  _218 = (sizetype) i;
  _219 = _217 + _218;
  _220 = *_219;
  _221 = (int) _220;
  _222 = coutput[0];
  _223 = (sizetype) i;
  _224 = _222 + _223;
  _225 = *_224;
  _226 = (int) _225;
  _227 = stbi__compute_y (_226, _221, _216);
  *out = _227;
  _228 = out + 1;
  *_228 = 255;
  i = i + 1;
  out = out + 2;
  goto <D.15094>;
  <D.11749>:
  <D.15093>:
  goto <D.15096>;
  <D.15088>:
  _229 = z->s;
  _230 = _229->img_n;
  if (_230 == 4) goto <D.15099>; else goto <D.15097>;
  <D.15099>:
  _231 = z->app14_color_transform;
  if (_231 == 0) goto <D.15100>; else goto <D.15097>;
  <D.15100>:
  i = 0;
  <D.15101>:
  _232 = z->s;
  _233 = _232->img_x;
  if (i >= _233) goto <D.11751>; else goto <D.15102>;
  <D.15102>:
  _234 = coutput[3];
  _235 = (sizetype) i;
  _236 = _234 + _235;
  m = *_236;
  _237 = (int) m;
  _238 = coutput[0];
  _239 = (sizetype) i;
  _240 = _238 + _239;
  _241 = *_240;
  _242 = (int) _241;
  r = stbi__blinn_8x8 (_242, _237);
  _243 = (int) m;
  _244 = coutput[1];
  _245 = (sizetype) i;
  _246 = _244 + _245;
  _247 = *_246;
  _248 = (int) _247;
  g = stbi__blinn_8x8 (_248, _243);
  _249 = (int) m;
  _250 = coutput[2];
  _251 = (sizetype) i;
  _252 = _250 + _251;
  _253 = *_252;
  _254 = (int) _253;
  b = stbi__blinn_8x8 (_254, _249);
  _255 = (int) b;
  _256 = (int) g;
  _257 = (int) r;
  _258 = stbi__compute_y (_257, _256, _255);
  *out = _258;
  _259 = out + 1;
  *_259 = 255;
  _260 = (sizetype) n;
  out = out + _260;
  i = i + 1;
  goto <D.15101>;
  <D.11751>:
  goto <D.15098>;
  <D.15097>:
  _261 = z->s;
  _262 = _261->img_n;
  if (_262 == 4) goto <D.15105>; else goto <D.15103>;
  <D.15105>:
  _263 = z->app14_color_transform;
  if (_263 == 2) goto <D.15106>; else goto <D.15103>;
  <D.15106>:
  i = 0;
  <D.15107>:
  _264 = z->s;
  _265 = _264->img_x;
  if (i >= _265) goto <D.11753>; else goto <D.15108>;
  <D.15108>:
  _266 = coutput[3];
  _267 = (sizetype) i;
  _268 = _266 + _267;
  _269 = *_268;
  _270 = (int) _269;
  _271 = coutput[0];
  _272 = (sizetype) i;
  _273 = _271 + _272;
  _274 = *_273;
  _275 = ~_274;
  _276 = (int) _275;
  _277 = stbi__blinn_8x8 (_276, _270);
  *out = _277;
  _278 = out + 1;
  *_278 = 255;
  _279 = (sizetype) n;
  out = out + _279;
  i = i + 1;
  goto <D.15107>;
  <D.11753>:
  goto <D.15104>;
  <D.15103>:
  y = coutput[0];
  if (n == 1) goto <D.15109>; else goto <D.15110>;
  <D.15109>:
  i = 0;
  <D.15111>:
  _280 = z->s;
  _281 = _280->img_x;
  if (i >= _281) goto <D.11755>; else goto <D.15112>;
  <D.15112>:
  _282 = (sizetype) i;
  _283 = y + _282;
  _284 = (sizetype) i;
  _285 = out + _284;
  _286 = *_283;
  *_285 = _286;
  i = i + 1;
  goto <D.15111>;
  <D.11755>:
  goto <D.15113>;
  <D.15110>:
  i = 0;
  <D.15114>:
  _287 = z->s;
  _288 = _287->img_x;
  if (i >= _288) goto <D.11757>; else goto <D.15115>;
  <D.15115>:
  _289 = (sizetype) i;
  _290 = y + _289;
  out.306_291 = out;
  out = out.306_291 + 1;
  _292 = *_290;
  *out.306_291 = _292;
  out.307_293 = out;
  out = out.307_293 + 1;
  *out.307_293 = 255;
  i = i + 1;
  goto <D.15114>;
  <D.11757>:
  <D.15113>:
  <D.15104>:
  <D.15098>:
  <D.15096>:
  <D.15086>:
  j = j + 1;
  goto <D.15041>;
  <D.11735>:
  stbi__cleanup_jpeg (z);
  _294 = z->s;
  _295 = _294->img_x;
  _296 = (int) _295;
  *out_x = _296;
  _297 = z->s;
  _298 = _297->img_y;
  _299 = (int) _298;
  *out_y = _299;
  if (comp != 0B) goto <D.15116>; else goto <D.15117>;
  <D.15116>:
  _300 = z->s;
  _301 = _300->img_n;
  if (_301 > 2) goto <D.15119>; else goto <D.15120>;
  <D.15119>:
  iftmp.308 = 3;
  goto <D.15121>;
  <D.15120>:
  iftmp.308 = 1;
  <D.15121>:
  *comp = iftmp.308;
  goto <D.15122>;
  <D.15117>:
  <D.15122>:
  D.14995 = output;
  goto <D.15127>;
  <D.15127>:
  coutput = {CLOBBER};
  res_comp = {CLOBBER};
  goto <D.15123>;
  <D.15123>:
  return D.14995;
  <D.15126>:
  coutput = {CLOBBER};
  res_comp = {CLOBBER};
  resx 1
}



;; Function stbi__jpeg_load (_ZL15stbi__jpeg_loadP13stbi__contextPiS1_S1_iP17stbi__result_info, funcdef_no=874, decl_uid=10121, cgraph_uid=780, symbol_order=795)

stbi__jpeg_load (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri)
{
  unsigned char * D.15130;
  struct stbi__jpeg * j;
  unsigned char * result;
  void * D.15128;

  j = stbi__malloc (18568);
  j->s = s;
  stbi__setup_jpeg (j);
  D.15130 = load_jpeg_image (j, x, y, comp, req_comp);
  result = D.15130;
  free (j);
  D.15128 = result;
  goto <D.15129>;
  <D.15129>:
  return D.15128;
}



;; Function stbi__jpeg_test (_ZL15stbi__jpeg_testP13stbi__context, funcdef_no=875, decl_uid=10114, cgraph_uid=781, symbol_order=796)

stbi__jpeg_test (struct stbi__context * s)
{
  int D.15133;
  struct stbi__jpeg * j;
  int r;
  int D.15131;

  j = stbi__malloc (18568);
  j->s = s;
  stbi__setup_jpeg (j);
  D.15133 = stbi__decode_jpeg_header (j, 1);
  r = D.15133;
  stbi__rewind (s);
  free (j);
  D.15131 = r;
  goto <D.15132>;
  <D.15132>:
  return D.15131;
}



;; Function stbi__jpeg_info_raw (_ZL19stbi__jpeg_info_rawP10stbi__jpegPiS1_S1_, funcdef_no=876, decl_uid=11778, cgraph_uid=782, symbol_order=797)

stbi__jpeg_info_raw (struct stbi__jpeg * j, int * x, int * y, int * comp)
{
  int D.15152;
  int iftmp.310;
  int D.15137;
  bool retval.309;

  D.15152 = stbi__decode_jpeg_header (j, 2);
  _1 = D.15152;
  retval.309 = _1 == 0;
  if (retval.309 != 0) goto <D.15135>; else goto <D.15136>;
  <D.15135>:
  _2 = j->s;
  stbi__rewind (_2);
  D.15137 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15151>;
  <D.15136>:
  if (x != 0B) goto <D.15138>; else goto <D.15139>;
  <D.15138>:
  _3 = j->s;
  _4 = _3->img_x;
  _5 = (int) _4;
  *x = _5;
  goto <D.15140>;
  <D.15139>:
  <D.15140>:
  if (y != 0B) goto <D.15141>; else goto <D.15142>;
  <D.15141>:
  _6 = j->s;
  _7 = _6->img_y;
  _8 = (int) _7;
  *y = _8;
  goto <D.15143>;
  <D.15142>:
  <D.15143>:
  if (comp != 0B) goto <D.15144>; else goto <D.15145>;
  <D.15144>:
  _9 = j->s;
  _10 = _9->img_n;
  if (_10 > 2) goto <D.15147>; else goto <D.15148>;
  <D.15147>:
  iftmp.310 = 3;
  goto <D.15149>;
  <D.15148>:
  iftmp.310 = 1;
  <D.15149>:
  *comp = iftmp.310;
  goto <D.15150>;
  <D.15145>:
  <D.15150>:
  D.15137 = 1;
  goto <D.15151>;
  <D.15151>:
  return D.15137;
}



;; Function stbi__jpeg_info (_ZL15stbi__jpeg_infoP13stbi__contextPiS1_S1_, funcdef_no=877, decl_uid=10126, cgraph_uid=783, symbol_order=798)

stbi__jpeg_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  int D.15155;
  struct stbi__jpeg * j;
  int result;
  int D.15153;

  j = stbi__malloc (18568);
  j->s = s;
  D.15155 = stbi__jpeg_info_raw (j, x, y, comp);
  result = D.15155;
  free (j);
  D.15153 = result;
  goto <D.15154>;
  <D.15154>:
  return D.15153;
}



;; Function stbi__zbuild_huffman (_ZL20stbi__zbuild_huffmanP14stbi__zhuffmanPKhi, funcdef_no=880, decl_uid=11807, cgraph_uid=786, symbol_order=801)

stbi__zbuild_huffman (struct stbi__zhuffman * z, const stbi_uc * sizelist, int num)
{
  int D.15181;
  int j;
  stbi__uint16 fastv;
  int c;
  int s;
  int sizes[17];
  int next_code[16];
  int code;
  int k;
  int i;
  int D.15162;

  k = 0;
  memset (&sizes, 0, 68);
  _1 = &z->fast;
  memset (_1, 0, 1024);
  i = 0;
  <D.15156>:
  if (i >= num) goto <D.11818>; else goto <D.15157>;
  <D.15157>:
  _2 = (sizetype) i;
  _3 = sizelist + _2;
  _4 = *_3;
  _5 = (int) _4;
  _6 = sizes[_5];
  _7 = _6 + 1;
  sizes[_5] = _7;
  i = i + 1;
  goto <D.15156>;
  <D.11818>:
  sizes[0] = 0;
  i = 1;
  <D.15158>:
  if (i > 15) goto <D.11820>; else goto <D.15159>;
  <D.15159>:
  _8 = sizes[i];
  _9 = 1 << i;
  if (_8 > _9) goto <D.15160>; else goto <D.15161>;
  <D.15160>:
  D.15162 = stbi__err ("bad sizes");
  goto <D.15183>;
  <D.15161>:
  i = i + 1;
  goto <D.15158>;
  <D.11820>:
  code = 0;
  i = 1;
  <D.15163>:
  if (i > 15) goto <D.11822>; else goto <D.15164>;
  <D.15164>:
  next_code[i] = code;
  _10 = (short unsigned int) code;
  z->firstcode[i] = _10;
  _11 = (short unsigned int) k;
  z->firstsymbol[i] = _11;
  _12 = sizes[i];
  code = code + _12;
  _13 = sizes[i];
  if (_13 != 0) goto <D.15165>; else goto <D.15166>;
  <D.15165>:
  _14 = 1 << i;
  if (code > _14) goto <D.15167>; else goto <D.15168>;
  <D.15167>:
  D.15162 = stbi__err ("bad codelengths");
  goto <D.15183>;
  <D.15168>:
  goto <D.15169>;
  <D.15166>:
  <D.15169>:
  _15 = 16 - i;
  _16 = code << _15;
  z->maxcode[i] = _16;
  code = code << 1;
  _17 = sizes[i];
  k = k + _17;
  i = i + 1;
  goto <D.15163>;
  <D.11822>:
  z->maxcode[16] = 65536;
  i = 0;
  <D.15170>:
  if (i >= num) goto <D.11824>; else goto <D.15171>;
  <D.15171>:
  _18 = (sizetype) i;
  _19 = sizelist + _18;
  _20 = *_19;
  s = (int) _20;
  if (s != 0) goto <D.15172>; else goto <D.15173>;
  <D.15172>:
  _21 = next_code[s];
  _22 = z->firstcode[s];
  _23 = (int) _22;
  _24 = _21 - _23;
  _25 = z->firstsymbol[s];
  _26 = (int) _25;
  c = _24 + _26;
  _27 = s << 9;
  _28 = (signed short) _27;
  _29 = (signed short) i;
  _30 = _28 | _29;
  fastv = (stbi__uint16) _30;
  _31 = (unsigned char) s;
  z->size[c] = _31;
  _32 = (short unsigned int) i;
  z->value[c] = _32;
  if (s <= 9) goto <D.15174>; else goto <D.15175>;
  <D.15174>:
  _33 = next_code[s];
  D.15181 = stbi__bit_reverse (_33, s);
  j = D.15181;
  <D.15176>:
  if (j > 511) goto <D.11826>; else goto <D.15177>;
  <D.15177>:
  z->fast[j] = fastv;
  _34 = 1 << s;
  j = j + _34;
  goto <D.15176>;
  <D.11826>:
  goto <D.15178>;
  <D.15175>:
  <D.15178>:
  _35 = next_code[s];
  _36 = _35 + 1;
  next_code[s] = _36;
  goto <D.15179>;
  <D.15173>:
  <D.15179>:
  i = i + 1;
  goto <D.15170>;
  <D.11824>:
  D.15162 = 1;
  goto <D.15183>;
  <D.15183>:
  next_code = {CLOBBER};
  sizes = {CLOBBER};
  goto <D.15180>;
  <D.15180>:
  return D.15162;
  <D.15182>:
  next_code = {CLOBBER};
  sizes = {CLOBBER};
  resx 1
}



;; Function stbi__bit_reverse (_ZL17stbi__bit_reverseii, funcdef_no=879, decl_uid=11802, cgraph_uid=785, symbol_order=800)

stbi__bit_reverse (int v, int bits)
{
  int D.15189;
  bool iftmp.311;

  if (bits <= 16) goto <D.15185>; else goto <D.15188>;
  <D.15188>:
  _assert ("bits <= 16", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 4007);
  if (0 != 0) goto <D.15185>; else goto <D.15186>;
  <D.15185>:
  iftmp.311 = 1;
  goto <D.15187>;
  <D.15186>:
  iftmp.311 = 0;
  <D.15187>:
  _1 = stbi__bitreverse16 (v);
  _2 = 16 - bits;
  D.15189 = _1 >> _2;
  goto <D.15190>;
  <D.15190>:
  return D.15189;
}



;; Function stbi__bitreverse16 (_ZL18stbi__bitreverse16i, funcdef_no=878, decl_uid=11798, cgraph_uid=784, symbol_order=799)

stbi__bitreverse16 (int n)
{
  int D.15191;

  _1 = n >> 1;
  _2 = _1 & 21845;
  _3 = n << 1;
  _4 = _3 & 43690;
  n = _2 | _4;
  _5 = n >> 2;
  _6 = _5 & 13107;
  _7 = n << 2;
  _8 = _7 & 52428;
  n = _6 | _8;
  _9 = n >> 4;
  _10 = _9 & 3855;
  _11 = n << 4;
  _12 = _11 & 61680;
  n = _10 | _12;
  _13 = n >> 8;
  _14 = _13 & 255;
  _15 = n << 8;
  _16 = _15 & 65535;
  n = _14 | _16;
  D.15191 = n;
  goto <D.15192>;
  <D.15192>:
  return D.15191;
}



;; Function stbi__fill_bits (_ZL15stbi__fill_bitsP10stbi__zbuf, funcdef_no=883, decl_uid=11848, cgraph_uid=789, symbol_order=804)

stbi__fill_bits (struct stbi__zbuf * z)
{
  unsigned int D.11850;

  <D.15193>:
  _1 = z->code_buffer;
  _2 = z->num_bits;
  _3 = _1 >> _2;
  if (_3 != 0) goto <D.15194>; else goto <D.15195>;
  <D.15194>:
  _4 = z->zbuffer_end;
  z->zbuffer = _4;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15197>;
  <D.15195>:
  _5 = stbi__zget8 (z);
  _6 = (unsigned int) _5;
  _7 = z->num_bits;
  D.11850 = _6 << _7;
  _8 = z->code_buffer;
  _9 = D.11850 | _8;
  z->code_buffer = _9;
  _10 = z->num_bits;
  _11 = _10 + 8;
  z->num_bits = _11;
  _12 = z->num_bits;
  if (_12 > 24) goto <D.11851>; else goto <D.15196>;
  <D.15196>:
  goto <D.15193>;
  <D.11851>:
  <D.15197>:
  return;
}



;; Function stbi__zget8 (_ZL11stbi__zget8P10stbi__zbuf, funcdef_no=882, decl_uid=11845, cgraph_uid=788, symbol_order=803)

stbi__zget8 (struct stbi__zbuf * z)
{
  stbi_uc iftmp.312;
  stbi_uc D.15198;

  _1 = stbi__zeof (z);
  if (_1 == 0) goto <D.15200>; else goto <D.15201>;
  <D.15200>:
  _2 = z->zbuffer;
  _3 = _2;
  _4 = _3 + 1;
  z->zbuffer = _4;
  iftmp.312 = *_3;
  goto <D.15202>;
  <D.15201>:
  iftmp.312 = 0;
  <D.15202>:
  D.15198 = iftmp.312;
  goto <D.15203>;
  <D.15203>:
  return D.15198;
}



;; Function stbi__zeof (_ZL10stbi__zeofP10stbi__zbuf, funcdef_no=881, decl_uid=11842, cgraph_uid=787, symbol_order=802)

stbi__zeof (struct stbi__zbuf * z)
{
  int D.15204;

  _1 = z->zbuffer;
  _2 = z->zbuffer_end;
  _3 = _1 >= _2;
  D.15204 = (int) _3;
  goto <D.15205>;
  <D.15205>:
  return D.15204;
}



;; Function stbi__zhuffman_decode_slowpath (_ZL30stbi__zhuffman_decode_slowpathP10stbi__zbufP14stbi__zhuffman, funcdef_no=885, decl_uid=11860, cgraph_uid=791, symbol_order=806)

stbi__zhuffman_decode_slowpath (struct stbi__zbuf * a, struct stbi__zhuffman * z)
{
  int D.15217;
  int k;
  int s;
  int b;
  int D.15211;

  _1 = a->code_buffer;
  _2 = (int) _1;
  D.15217 = stbi__bit_reverse (_2, 16);
  k = D.15217;
  s = 10;
  <D.15206>:
  _3 = z->maxcode[s];
  if (k < _3) goto <D.15207>; else goto <D.15208>;
  <D.15207>:
  goto <D.11865>;
  <D.15208>:
  s = s + 1;
  goto <D.15206>;
  <D.11865>:
  if (s > 15) goto <D.15209>; else goto <D.15210>;
  <D.15209>:
  D.15211 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15216>;
  <D.15210>:
  _4 = 16 - s;
  _5 = k >> _4;
  _6 = z->firstcode[s];
  _7 = (int) _6;
  _8 = _5 - _7;
  _9 = z->firstsymbol[s];
  _10 = (int) _9;
  b = _8 + _10;
  _11 = (long long unsigned int) b;
  if (_11 > 287) goto <D.15212>; else goto <D.15213>;
  <D.15212>:
  D.15211 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15216>;
  <D.15213>:
  _12 = z->size[b];
  _13 = (int) _12;
  if (s != _13) goto <D.15214>; else goto <D.15215>;
  <D.15214>:
  D.15211 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15216>;
  <D.15215>:
  _14 = a->code_buffer;
  _15 = _14 >> s;
  a->code_buffer = _15;
  _16 = a->num_bits;
  _17 = _16 - s;
  a->num_bits = _17;
  _18 = z->value[b];
  D.15211 = (int) _18;
  goto <D.15216>;
  <D.15216>:
  return D.15211;
}



;; Function stbi__zexpand (_ZL13stbi__zexpandP10stbi__zbufPci, funcdef_no=887, decl_uid=11876, cgraph_uid=793, symbol_order=808)

stbi__zexpand (struct stbi__zbuf * z, char * zout, int n)
{
  unsigned int old_limit;
  unsigned int limit;
  unsigned int cur;
  char * q;
  int D.15220;

  z->zout = zout;
  _1 = z->z_expandable;
  if (_1 == 0) goto <D.15218>; else goto <D.15219>;
  <D.15218>:
  D.15220 = stbi__err ("output buffer limit");
  goto <D.15229>;
  <D.15219>:
  _2 = z->zout;
  _3 = z->zout_start;
  _4 = _2 - _3;
  cur = (unsigned int) _4;
  _5 = z->zout_end;
  _6 = z->zout_start;
  _7 = _5 - _6;
  old_limit = (unsigned int) _7;
  limit = old_limit;
  _8 = ~cur;
  n.313_9 = (unsigned int) n;
  if (_8 < n.313_9) goto <D.15221>; else goto <D.15222>;
  <D.15221>:
  D.15220 = stbi__err ("outofmem");
  goto <D.15229>;
  <D.15222>:
  <D.15223>:
  n.314_10 = (unsigned int) n;
  _11 = cur + n.314_10;
  if (limit >= _11) goto <D.11882>; else goto <D.15224>;
  <D.15224>:
  limit.315_12 = (signed int) limit;
  if (limit.315_12 < 0) goto <D.15225>; else goto <D.15226>;
  <D.15225>:
  D.15220 = stbi__err ("outofmem");
  goto <D.15229>;
  <D.15226>:
  limit = limit * 2;
  goto <D.15223>;
  <D.11882>:
  _13 = (long long unsigned int) limit;
  _14 = z->zout_start;
  q = realloc (_14, _13);
  if (q == 0B) goto <D.15227>; else goto <D.15228>;
  <D.15227>:
  D.15220 = stbi__err ("outofmem");
  goto <D.15229>;
  <D.15228>:
  z->zout_start = q;
  _15 = (sizetype) cur;
  _16 = q + _15;
  z->zout = _16;
  _17 = (sizetype) limit;
  _18 = q + _17;
  z->zout_end = _18;
  D.15220 = 1;
  goto <D.15229>;
  <D.15229>:
  return D.15220;
}



;; Function stbi__parse_huffman_block (_ZL25stbi__parse_huffman_blockP10stbi__zbuf, funcdef_no=888, decl_uid=11889, cgraph_uid=794, symbol_order=813)

stbi__parse_huffman_block (struct stbi__zbuf * a)
{
  int D.15278;
  int D.15277;
  stbi_uc v;
  int dist;
  int len;
  stbi_uc * p;
  int z;
  char * zout;
  bool retval.326;
  bool retval.323;
  bool retval.320;
  unsigned int D.11897;
  unsigned int D.11896;
  bool retval.316;
  int D.15235;

  zout = a->zout;
  <D.15230>:
  _1 = &a->z_length;
  D.15277 = stbi__zhuffman_decode (a, _1);
  z = D.15277;
  if (z <= 255) goto <D.15231>; else goto <D.15232>;
  <D.15231>:
  if (z < 0) goto <D.15233>; else goto <D.15234>;
  <D.15233>:
  D.15235 = stbi__err ("bad huffman code");
  goto <D.15276>;
  <D.15234>:
  _2 = a->zout_end;
  if (zout >= _2) goto <D.15236>; else goto <D.15237>;
  <D.15236>:
  _3 = stbi__zexpand (a, zout, 1);
  retval.316 = _3 == 0;
  if (retval.316 != 0) goto <D.15239>; else goto <D.15240>;
  <D.15239>:
  D.15235 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15276>;
  <D.15240>:
  zout = a->zout;
  goto <D.15241>;
  <D.15237>:
  <D.15241>:
  zout.317_4 = zout;
  zout = zout.317_4 + 1;
  _5 = (char) z;
  *zout.317_4 = _5;
  goto <D.15242>;
  <D.15232>:
  if (z == 256) goto <D.15243>; else goto <D.15244>;
  <D.15243>:
  a->zout = zout;
  D.15235 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15276>;
  <D.15244>:
  z = z + -257;
  len = stbi__zlength_base[z];
  _6 = stbi__zlength_extra[z];
  if (_6 != 0) goto <D.15245>; else goto <D.15246>;
  <D.15245>:
  _7 = stbi__zlength_extra[z];
  D.11896 = stbi__zreceive (a, _7);
  len.318_8 = (unsigned int) len;
  _9 = D.11896 + len.318_8;
  len = (int) _9;
  goto <D.15247>;
  <D.15246>:
  <D.15247>:
  _10 = &a->z_distance;
  D.15278 = stbi__zhuffman_decode (a, _10);
  z = D.15278;
  if (z < 0) goto <D.15248>; else goto <D.15249>;
  <D.15248>:
  D.15235 = stbi__err ("bad huffman code");
  goto <D.15276>;
  <D.15249>:
  dist = stbi__zdist_base[z];
  _11 = stbi__zdist_extra[z];
  if (_11 != 0) goto <D.15250>; else goto <D.15251>;
  <D.15250>:
  _12 = stbi__zdist_extra[z];
  D.11897 = stbi__zreceive (a, _12);
  dist.319_13 = (unsigned int) dist;
  _14 = D.11897 + dist.319_13;
  dist = (int) _14;
  goto <D.15252>;
  <D.15251>:
  <D.15252>:
  _15 = a->zout_start;
  _16 = zout - _15;
  _17 = (long long int) dist;
  if (_16 < _17) goto <D.15253>; else goto <D.15254>;
  <D.15253>:
  D.15235 = stbi__err ("bad dist");
  goto <D.15276>;
  <D.15254>:
  _18 = (sizetype) len;
  _19 = zout + _18;
  _20 = a->zout_end;
  if (_19 > _20) goto <D.15255>; else goto <D.15256>;
  <D.15255>:
  _21 = stbi__zexpand (a, zout, len);
  retval.320 = _21 == 0;
  if (retval.320 != 0) goto <D.15258>; else goto <D.15259>;
  <D.15258>:
  D.15235 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15276>;
  <D.15259>:
  zout = a->zout;
  goto <D.15260>;
  <D.15256>:
  <D.15260>:
  _22 = (sizetype) dist;
  _23 = -_22;
  p = zout + _23;
  if (dist == 1) goto <D.15261>; else goto <D.15262>;
  <D.15261>:
  v = *p;
  if (len != 0) goto <D.15263>; else goto <D.15264>;
  <D.15263>:
  <D.15265>:
  zout.321_24 = zout;
  zout = zout.321_24 + 1;
  v.322_25 = (char) v;
  *zout.321_24 = v.322_25;
  len = len + -1;
  retval.323 = len != 0;
  if (retval.323 != 0) goto <D.15267>; else goto <D.11901>;
  <D.15267>:
  goto <D.15265>;
  <D.11901>:
  goto <D.15268>;
  <D.15264>:
  <D.15268>:
  goto <D.15269>;
  <D.15262>:
  if (len != 0) goto <D.15270>; else goto <D.15271>;
  <D.15270>:
  <D.15272>:
  p.324_26 = p;
  p = p.324_26 + 1;
  _27 = *p.324_26;
  zout.325_28 = zout;
  zout = zout.325_28 + 1;
  _29 = (char) _27;
  *zout.325_28 = _29;
  len = len + -1;
  retval.326 = len != 0;
  if (retval.326 != 0) goto <D.15274>; else goto <D.11903>;
  <D.15274>:
  goto <D.15272>;
  <D.11903>:
  goto <D.15275>;
  <D.15271>:
  <D.15275>:
  <D.15269>:
  <D.15242>:
  goto <D.15230>;
  <D.15276>:
  return D.15235;
}



;; Function stbi__zhuffman_decode (_ZL21stbi__zhuffman_decodeP10stbi__zbufP14stbi__zhuffman, funcdef_no=886, decl_uid=11869, cgraph_uid=792, symbol_order=807)

stbi__zhuffman_decode (struct stbi__zbuf * a, struct stbi__zhuffman * z)
{
  int D.15289;
  int s;
  int b;
  int D.15284;
  bool retval.327;

  _1 = a->num_bits;
  if (_1 <= 15) goto <D.15279>; else goto <D.15280>;
  <D.15279>:
  _2 = stbi__zeof (a);
  retval.327 = _2 != 0;
  if (retval.327 != 0) goto <D.15282>; else goto <D.15283>;
  <D.15282>:
  D.15284 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15288>;
  <D.15283>:
  stbi__fill_bits (a);
  goto <D.15285>;
  <D.15280>:
  <D.15285>:
  _3 = a->code_buffer;
  _4 = _3 & 511;
  _5 = z->fast[_4];
  b = (int) _5;
  if (b != 0) goto <D.15286>; else goto <D.15287>;
  <D.15286>:
  s = b >> 9;
  _6 = a->code_buffer;
  _7 = _6 >> s;
  a->code_buffer = _7;
  _8 = a->num_bits;
  _9 = _8 - s;
  a->num_bits = _9;
  D.15284 = b & 511;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15288>;
  <D.15287>:
  D.15289 = stbi__zhuffman_decode_slowpath (a, z);
  D.15284 = D.15289;
  goto <D.15288>;
  <D.15288>:
  return D.15284;
}



;; Function stbi__zreceive (_ZL14stbi__zreceiveP10stbi__zbufi, funcdef_no=884, decl_uid=11855, cgraph_uid=790, symbol_order=805)

stbi__zreceive (struct stbi__zbuf * z, int n)
{
  unsigned int k;
  unsigned int D.15293;

  _1 = z->num_bits;
  if (n > _1) goto <D.15290>; else goto <D.15291>;
  <D.15290>:
  stbi__fill_bits (z);
  goto <D.15292>;
  <D.15291>:
  <D.15292>:
  _2 = z->code_buffer;
  _3 = 1 << n;
  _4 = _3 + -1;
  _5 = (unsigned int) _4;
  k = _2 & _5;
  _6 = z->code_buffer;
  _7 = _6 >> n;
  z->code_buffer = _7;
  _8 = z->num_bits;
  _9 = _8 - n;
  z->num_bits = _9;
  D.15293 = k;
  goto <D.15294>;
  <D.15294>:
  return D.15293;
}



;; Function stbi__compute_huffman_codes (_ZL27stbi__compute_huffman_codesP10stbi__zbuf, funcdef_no=889, decl_uid=11906, cgraph_uid=795, symbol_order=815)

stbi__compute_huffman_codes (struct stbi__zbuf * a)
{
  int D.15334;
  int D.15333;
  int D.15332;
  int D.15331;
  stbi_uc fill;
  int c;
  int s;
  int ntot;
  int hclen;
  int hdist;
  int hlit;
  int n;
  int i;
  stbi_uc codelength_sizes[19];
  stbi_uc lencodes[455];
  struct stbi__zhuffman z_codelength;
  static const stbi_uc length_dezigzag[19] = {16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15};
  bool retval.331;
  bool retval.330;
  int D.15300;
  bool retval.328;

  _1 = stbi__zreceive (a, 5);
  _2 = _1 + 257;
  hlit = (int) _2;
  _3 = stbi__zreceive (a, 5);
  _4 = _3 + 1;
  hdist = (int) _4;
  _5 = stbi__zreceive (a, 4);
  _6 = _5 + 4;
  hclen = (int) _6;
  ntot = hlit + hdist;
  memset (&codelength_sizes, 0, 19);
  i = 0;
  <D.15295>:
  if (i >= hclen) goto <D.11954>; else goto <D.15296>;
  <D.15296>:
  _7 = stbi__zreceive (a, 3);
  s = (int) _7;
  _8 = length_dezigzag[i];
  _9 = (int) _8;
  _10 = (unsigned char) s;
  codelength_sizes[_9] = _10;
  i = i + 1;
  goto <D.15295>;
  <D.11954>:
  D.15331 = stbi__zbuild_huffman (&z_codelength, &codelength_sizes, 19);
  _11 = D.15331;
  retval.328 = _11 == 0;
  if (retval.328 != 0) goto <D.15298>; else goto <D.15299>;
  <D.15298>:
  D.15300 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15336>;
  <D.15299>:
  n = 0;
  <D.15301>:
  if (n >= ntot) goto <D.11956>; else goto <D.15302>;
  <D.15302>:
  D.15332 = stbi__zhuffman_decode (a, &z_codelength);
  c = D.15332;
  if (c < 0) goto <D.15303>; else goto <D.15305>;
  <D.15305>:
  if (c > 18) goto <D.15303>; else goto <D.15304>;
  <D.15303>:
  D.15300 = stbi__err ("bad codelengths");
  goto <D.15336>;
  <D.15304>:
  if (c <= 15) goto <D.15306>; else goto <D.15307>;
  <D.15306>:
  n.329_12 = n;
  n = n.329_12 + 1;
  _13 = (unsigned char) c;
  lencodes[n.329_12] = _13;
  goto <D.15308>;
  <D.15307>:
  fill = 0;
  if (c == 16) goto <D.15309>; else goto <D.15310>;
  <D.15309>:
  _14 = stbi__zreceive (a, 2);
  _15 = _14 + 3;
  c = (int) _15;
  if (n == 0) goto <D.15311>; else goto <D.15312>;
  <D.15311>:
  D.15300 = stbi__err ("bad codelengths");
  goto <D.15336>;
  <D.15312>:
  _16 = n + -1;
  fill = lencodes[_16];
  goto <D.15313>;
  <D.15310>:
  if (c == 17) goto <D.15314>; else goto <D.15315>;
  <D.15314>:
  _17 = stbi__zreceive (a, 3);
  _18 = _17 + 3;
  c = (int) _18;
  goto <D.15316>;
  <D.15315>:
  if (c == 18) goto <D.15317>; else goto <D.15318>;
  <D.15317>:
  _19 = stbi__zreceive (a, 7);
  _20 = _19 + 11;
  c = (int) _20;
  goto <D.15319>;
  <D.15318>:
  D.15300 = stbi__err ("bad codelengths");
  goto <D.15336>;
  <D.15319>:
  <D.15316>:
  <D.15313>:
  _21 = ntot - n;
  if (c > _21) goto <D.15320>; else goto <D.15321>;
  <D.15320>:
  D.15300 = stbi__err ("bad codelengths");
  goto <D.15336>;
  <D.15321>:
  _22 = (long long unsigned int) c;
  _23 = (int) fill;
  _24 = (sizetype) n;
  _25 = &lencodes + _24;
  memset (_25, _23, _22);
  n = n + c;
  <D.15308>:
  goto <D.15301>;
  <D.11956>:
  if (n != ntot) goto <D.15322>; else goto <D.15323>;
  <D.15322>:
  D.15300 = stbi__err ("bad codelengths");
  goto <D.15336>;
  <D.15323>:
  _26 = &a->z_length;
  D.15333 = stbi__zbuild_huffman (_26, &lencodes, hlit);
  _27 = D.15333;
  retval.330 = _27 == 0;
  if (retval.330 != 0) goto <D.15325>; else goto <D.15326>;
  <D.15325>:
  D.15300 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15336>;
  <D.15326>:
  _28 = (sizetype) hlit;
  _29 = &lencodes + _28;
  _30 = &a->z_distance;
  D.15334 = stbi__zbuild_huffman (_30, _29, hdist);
  _31 = D.15334;
  retval.331 = _31 == 0;
  if (retval.331 != 0) goto <D.15328>; else goto <D.15329>;
  <D.15328>:
  D.15300 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15336>;
  <D.15329>:
  D.15300 = 1;
  goto <D.15336>;
  <D.15336>:
  z_codelength = {CLOBBER};
  lencodes = {CLOBBER};
  codelength_sizes = {CLOBBER};
  goto <D.15330>;
  <D.15330>:
  return D.15300;
  <D.15335>:
  z_codelength = {CLOBBER};
  lencodes = {CLOBBER};
  codelength_sizes = {CLOBBER};
  resx 1
}



;; Function stbi__parse_uncompressed_block (_ZL30stbi__parse_uncompressed_blockP10stbi__zbuf, funcdef_no=890, decl_uid=11959, cgraph_uid=796, symbol_order=816)

stbi__parse_uncompressed_block (struct stbi__zbuf * a)
{
  int k;
  int nlen;
  int len;
  stbi_uc header[4];
  bool retval.334;
  int D.15344;

  _1 = a->num_bits;
  _2 = _1 & 7;
  if (_2 != 0) goto <D.15337>; else goto <D.15338>;
  <D.15337>:
  _3 = a->num_bits;
  _4 = _3 & 7;
  stbi__zreceive (a, _4);
  goto <D.15339>;
  <D.15338>:
  <D.15339>:
  k = 0;
  <D.15340>:
  _5 = a->num_bits;
  if (_5 <= 0) goto <D.11965>; else goto <D.15341>;
  <D.15341>:
  _6 = a->code_buffer;
  k.332_7 = k;
  k = k.332_7 + 1;
  _8 = (unsigned char) _6;
  header[k.332_7] = _8;
  _9 = a->code_buffer;
  _10 = _9 >> 8;
  a->code_buffer = _10;
  _11 = a->num_bits;
  _12 = _11 + -8;
  a->num_bits = _12;
  goto <D.15340>;
  <D.11965>:
  _13 = a->num_bits;
  if (_13 < 0) goto <D.15342>; else goto <D.15343>;
  <D.15342>:
  D.15344 = stbi__err ("zlib corrupt");
  goto <D.15358>;
  <D.15343>:
  <D.15345>:
  if (k > 3) goto <D.11967>; else goto <D.15346>;
  <D.15346>:
  k.333_14 = k;
  k = k.333_14 + 1;
  _15 = stbi__zget8 (a);
  header[k.333_14] = _15;
  goto <D.15345>;
  <D.11967>:
  _16 = header[1];
  _17 = (int) _16;
  _18 = _17 * 256;
  _19 = header[0];
  _20 = (int) _19;
  len = _18 + _20;
  _21 = header[3];
  _22 = (int) _21;
  _23 = _22 * 256;
  _24 = header[2];
  _25 = (int) _24;
  nlen = _23 + _25;
  _26 = len ^ 65535;
  if (nlen != _26) goto <D.15347>; else goto <D.15348>;
  <D.15347>:
  D.15344 = stbi__err ("zlib corrupt");
  goto <D.15358>;
  <D.15348>:
  _27 = a->zbuffer;
  _28 = (sizetype) len;
  _29 = _27 + _28;
  _30 = a->zbuffer_end;
  if (_29 > _30) goto <D.15349>; else goto <D.15350>;
  <D.15349>:
  D.15344 = stbi__err ("read past buffer");
  goto <D.15358>;
  <D.15350>:
  _31 = a->zout;
  _32 = (sizetype) len;
  _33 = _31 + _32;
  _34 = a->zout_end;
  if (_33 > _34) goto <D.15351>; else goto <D.15352>;
  <D.15351>:
  _35 = a->zout;
  _36 = stbi__zexpand (a, _35, len);
  retval.334 = _36 == 0;
  if (retval.334 != 0) goto <D.15354>; else goto <D.15355>;
  <D.15354>:
  D.15344 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15358>;
  <D.15355>:
  goto <D.15356>;
  <D.15352>:
  <D.15356>:
  _37 = (long long unsigned int) len;
  _38 = a->zbuffer;
  _39 = a->zout;
  memcpy (_39, _38, _37);
  _40 = a->zbuffer;
  _41 = (sizetype) len;
  _42 = _40 + _41;
  a->zbuffer = _42;
  _43 = a->zout;
  _44 = (sizetype) len;
  _45 = _43 + _44;
  a->zout = _45;
  D.15344 = 1;
  goto <D.15358>;
  <D.15358>:
  header = {CLOBBER};
  goto <D.15357>;
  <D.15357>:
  return D.15344;
}



;; Function stbi__parse_zlib_header (_ZL23stbi__parse_zlib_headerP10stbi__zbuf, funcdef_no=891, decl_uid=11970, cgraph_uid=797, symbol_order=817)

stbi__parse_zlib_header (struct stbi__zbuf * a)
{
  int flg;
  int cm;
  int cmf;
  int D.15362;
  bool retval.335;

  _1 = stbi__zget8 (a);
  cmf = (int) _1;
  cm = cmf & 15;
  _2 = stbi__zget8 (a);
  flg = (int) _2;
  _3 = stbi__zeof (a);
  retval.335 = _3 != 0;
  if (retval.335 != 0) goto <D.15360>; else goto <D.15361>;
  <D.15360>:
  D.15362 = stbi__err ("bad zlib header");
  goto <D.15369>;
  <D.15361>:
  _4 = cmf * 256;
  _5 = flg + _4;
  _6 = _5 % 31;
  if (_6 != 0) goto <D.15363>; else goto <D.15364>;
  <D.15363>:
  D.15362 = stbi__err ("bad zlib header");
  goto <D.15369>;
  <D.15364>:
  _7 = flg & 32;
  if (_7 != 0) goto <D.15365>; else goto <D.15366>;
  <D.15365>:
  D.15362 = stbi__err ("no preset dict");
  goto <D.15369>;
  <D.15366>:
  if (cm != 8) goto <D.15367>; else goto <D.15368>;
  <D.15367>:
  D.15362 = stbi__err ("bad compression");
  goto <D.15369>;
  <D.15368>:
  D.15362 = 1;
  goto <D.15369>;
  <D.15369>:
  return D.15362;
}



;; Function stbi__parse_zlib (_ZL16stbi__parse_zlibP10stbi__zbufi, funcdef_no=892, decl_uid=11979, cgraph_uid=798, symbol_order=820)

stbi__parse_zlib (struct stbi__zbuf * a, int parse_header)
{
  int D.15406;
  int D.15405;
  int D.15404;
  int D.15403;
  int type;
  int final;
  bool retval.341;
  bool retval.340;
  bool retval.339;
  bool retval.338;
  bool retval.337;
  int D.15375;
  bool retval.336;

  if (parse_header != 0) goto <D.15370>; else goto <D.15371>;
  <D.15370>:
  _1 = stbi__parse_zlib_header (a);
  retval.336 = _1 == 0;
  if (retval.336 != 0) goto <D.15373>; else goto <D.15374>;
  <D.15373>:
  D.15375 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15402>;
  <D.15374>:
  goto <D.15376>;
  <D.15371>:
  <D.15376>:
  a->num_bits = 0;
  a->code_buffer = 0;
  <D.15377>:
  _2 = stbi__zreceive (a, 1);
  final = (int) _2;
  _3 = stbi__zreceive (a, 2);
  type = (int) _3;
  if (type == 0) goto <D.15378>; else goto <D.15379>;
  <D.15378>:
  _4 = stbi__parse_uncompressed_block (a);
  retval.337 = _4 == 0;
  if (retval.337 != 0) goto <D.15381>; else goto <D.15382>;
  <D.15381>:
  D.15375 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15402>;
  <D.15382>:
  goto <D.15383>;
  <D.15379>:
  if (type == 3) goto <D.15384>; else goto <D.15385>;
  <D.15384>:
  D.15375 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15402>;
  <D.15385>:
  if (type == 1) goto <D.15386>; else goto <D.15387>;
  <D.15386>:
  _5 = &a->z_length;
  D.15403 = stbi__zbuild_huffman (_5, &stbi__zdefault_length, 288);
  _6 = D.15403;
  retval.338 = _6 == 0;
  if (retval.338 != 0) goto <D.15389>; else goto <D.15390>;
  <D.15389>:
  D.15375 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15402>;
  <D.15390>:
  _7 = &a->z_distance;
  D.15404 = stbi__zbuild_huffman (_7, &stbi__zdefault_distance, 32);
  _8 = D.15404;
  retval.339 = _8 == 0;
  if (retval.339 != 0) goto <D.15392>; else goto <D.15393>;
  <D.15392>:
  D.15375 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15402>;
  <D.15393>:
  goto <D.15394>;
  <D.15387>:
  D.15405 = stbi__compute_huffman_codes (a);
  _9 = D.15405;
  retval.340 = _9 == 0;
  if (retval.340 != 0) goto <D.15396>; else goto <D.15397>;
  <D.15396>:
  D.15375 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15402>;
  <D.15397>:
  <D.15394>:
  D.15406 = stbi__parse_huffman_block (a);
  _10 = D.15406;
  retval.341 = _10 == 0;
  if (retval.341 != 0) goto <D.15399>; else goto <D.15400>;
  <D.15399>:
  D.15375 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15402>;
  <D.15400>:
  <D.15383>:
  if (final != 0) goto <D.11983>; else goto <D.15401>;
  <D.15401>:
  goto <D.15377>;
  <D.11983>:
  D.15375 = 1;
  goto <D.15402>;
  <D.15402>:
  return D.15375;
}



;; Function stbi__do_zlib (_ZL13stbi__do_zlibP10stbi__zbufPciii, funcdef_no=893, decl_uid=11990, cgraph_uid=799, symbol_order=821)

stbi__do_zlib (struct stbi__zbuf * a, char * obuf, int olen, int exp, int parse_header)
{
  int D.15409;
  int D.15407;

  a->zout_start = obuf;
  a->zout = obuf;
  _1 = (sizetype) olen;
  _2 = obuf + _1;
  a->zout_end = _2;
  a->z_expandable = exp;
  D.15409 = stbi__parse_zlib (a, parse_header);
  D.15407 = D.15409;
  goto <D.15408>;
  <D.15408>:
  return D.15407;
}



;; Function stbi_zlib_decode_malloc_guesssize (stbi_zlib_decode_malloc_guesssize, funcdef_no=894, decl_uid=5119, cgraph_uid=800, symbol_order=822)

stbi_zlib_decode_malloc_guesssize (const char * buffer, int len, int initial_size, int * outlen)
{
  int D.15420;
  char * p;
  struct stbi__zbuf a;
  bool retval.342;
  char * D.15412;

  _1 = (long long unsigned int) initial_size;
  p = stbi__malloc (_1);
  if (p == 0B) goto <D.15410>; else goto <D.15411>;
  <D.15410>:
  D.15412 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15422>;
  <D.15411>:
  a.zbuffer = buffer;
  _2 = (sizetype) len;
  _3 = buffer + _2;
  a.zbuffer_end = _3;
  D.15420 = stbi__do_zlib (&a, p, initial_size, 1, 1);
  _4 = D.15420;
  retval.342 = _4 != 0;
  if (retval.342 != 0) goto <D.15414>; else goto <D.15415>;
  <D.15414>:
  if (outlen != 0B) goto <D.15416>; else goto <D.15417>;
  <D.15416>:
  _5 = a.zout;
  _6 = a.zout_start;
  _7 = _5 - _6;
  _8 = (int) _7;
  *outlen = _8;
  goto <D.15418>;
  <D.15417>:
  <D.15418>:
  D.15412 = a.zout_start;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15422>;
  <D.15415>:
  _9 = a.zout_start;
  free (_9);
  D.15412 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15422>;
  <D.15422>:
  a = {CLOBBER};
  goto <D.15419>;
  <D.15419>:
  return D.15412;
  <D.15421>:
  a = {CLOBBER};
  resx 1
}



;; Function stbi_zlib_decode_malloc (stbi_zlib_decode_malloc, funcdef_no=895, decl_uid=5129, cgraph_uid=801, symbol_order=823)

stbi_zlib_decode_malloc (const char * buffer, int len, int * outlen)
{
  char * D.15425;
  char * D.15423;

  D.15425 = stbi_zlib_decode_malloc_guesssize (buffer, len, 16384, outlen);
  D.15423 = D.15425;
  goto <D.15424>;
  <D.15424>:
  return D.15423;
}



;; Function stbi_zlib_decode_malloc_guesssize_headerflag (stbi_zlib_decode_malloc_guesssize_headerflag, funcdef_no=896, decl_uid=5125, cgraph_uid=802, symbol_order=824)

stbi_zlib_decode_malloc_guesssize_headerflag (const char * buffer, int len, int initial_size, int * outlen, int parse_header)
{
  int D.15436;
  char * p;
  struct stbi__zbuf a;
  bool retval.343;
  char * D.15428;

  _1 = (long long unsigned int) initial_size;
  p = stbi__malloc (_1);
  if (p == 0B) goto <D.15426>; else goto <D.15427>;
  <D.15426>:
  D.15428 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15438>;
  <D.15427>:
  a.zbuffer = buffer;
  _2 = (sizetype) len;
  _3 = buffer + _2;
  a.zbuffer_end = _3;
  D.15436 = stbi__do_zlib (&a, p, initial_size, 1, parse_header);
  _4 = D.15436;
  retval.343 = _4 != 0;
  if (retval.343 != 0) goto <D.15430>; else goto <D.15431>;
  <D.15430>:
  if (outlen != 0B) goto <D.15432>; else goto <D.15433>;
  <D.15432>:
  _5 = a.zout;
  _6 = a.zout_start;
  _7 = _5 - _6;
  _8 = (int) _7;
  *outlen = _8;
  goto <D.15434>;
  <D.15433>:
  <D.15434>:
  D.15428 = a.zout_start;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15438>;
  <D.15431>:
  _9 = a.zout_start;
  free (_9);
  D.15428 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15438>;
  <D.15438>:
  a = {CLOBBER};
  goto <D.15435>;
  <D.15435>:
  return D.15428;
  <D.15437>:
  a = {CLOBBER};
  resx 1
}



;; Function stbi_zlib_decode_buffer (stbi_zlib_decode_buffer, funcdef_no=897, decl_uid=5134, cgraph_uid=803, symbol_order=825)

stbi_zlib_decode_buffer (char * obuffer, int olen, const char * ibuffer, int ilen)
{
  int D.15444;
  struct stbi__zbuf a;
  int D.15442;
  bool retval.344;

  a.zbuffer = ibuffer;
  _1 = (sizetype) ilen;
  _2 = ibuffer + _1;
  a.zbuffer_end = _2;
  D.15444 = stbi__do_zlib (&a, obuffer, olen, 0, 1);
  _3 = D.15444;
  retval.344 = _3 != 0;
  if (retval.344 != 0) goto <D.15440>; else goto <D.15441>;
  <D.15440>:
  _4 = a.zout;
  _5 = a.zout_start;
  _6 = _4 - _5;
  D.15442 = (int) _6;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15446>;
  <D.15441>:
  D.15442 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15446>;
  <D.15446>:
  a = {CLOBBER};
  goto <D.15443>;
  <D.15443>:
  return D.15442;
  <D.15445>:
  a = {CLOBBER};
  resx 1
}



;; Function stbi_zlib_decode_noheader_malloc (stbi_zlib_decode_noheader_malloc, funcdef_no=898, decl_uid=5138, cgraph_uid=804, symbol_order=826)

stbi_zlib_decode_noheader_malloc (const char * buffer, int len, int * outlen)
{
  int D.15457;
  char * p;
  struct stbi__zbuf a;
  bool retval.345;
  char * D.15449;

  p = stbi__malloc (16384);
  if (p == 0B) goto <D.15447>; else goto <D.15448>;
  <D.15447>:
  D.15449 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15459>;
  <D.15448>:
  a.zbuffer = buffer;
  _1 = (sizetype) len;
  _2 = buffer + _1;
  a.zbuffer_end = _2;
  D.15457 = stbi__do_zlib (&a, p, 16384, 1, 0);
  _3 = D.15457;
  retval.345 = _3 != 0;
  if (retval.345 != 0) goto <D.15451>; else goto <D.15452>;
  <D.15451>:
  if (outlen != 0B) goto <D.15453>; else goto <D.15454>;
  <D.15453>:
  _4 = a.zout;
  _5 = a.zout_start;
  _6 = _4 - _5;
  _7 = (int) _6;
  *outlen = _7;
  goto <D.15455>;
  <D.15454>:
  <D.15455>:
  D.15449 = a.zout_start;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15459>;
  <D.15452>:
  _8 = a.zout_start;
  free (_8);
  D.15449 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15459>;
  <D.15459>:
  a = {CLOBBER};
  goto <D.15456>;
  <D.15456>:
  return D.15449;
  <D.15458>:
  a = {CLOBBER};
  resx 1
}



;; Function stbi_zlib_decode_noheader_buffer (stbi_zlib_decode_noheader_buffer, funcdef_no=899, decl_uid=5143, cgraph_uid=805, symbol_order=827)

stbi_zlib_decode_noheader_buffer (char * obuffer, int olen, const char * ibuffer, int ilen)
{
  int D.15465;
  struct stbi__zbuf a;
  int D.15463;
  bool retval.346;

  a.zbuffer = ibuffer;
  _1 = (sizetype) ilen;
  _2 = ibuffer + _1;
  a.zbuffer_end = _2;
  D.15465 = stbi__do_zlib (&a, obuffer, olen, 0, 0);
  _3 = D.15465;
  retval.346 = _3 != 0;
  if (retval.346 != 0) goto <D.15461>; else goto <D.15462>;
  <D.15461>:
  _4 = a.zout;
  _5 = a.zout_start;
  _6 = _4 - _5;
  D.15463 = (int) _6;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15467>;
  <D.15462>:
  D.15463 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15467>;
  <D.15467>:
  a = {CLOBBER};
  goto <D.15464>;
  <D.15464>:
  return D.15463;
  <D.15466>:
  a = {CLOBBER};
  resx 1
}



;; Function stbi__get_chunk_header (_ZL22stbi__get_chunk_headerP13stbi__context, funcdef_no=900, decl_uid=12074, cgraph_uid=806, symbol_order=828)

stbi__get_chunk_header (struct stbi__context * s)
{
  unsigned int D.15471;
  unsigned int D.15470;
  struct stbi__pngchunk c;
  struct stbi__pngchunk D.15468;

  D.15470 = stbi__get32be (s);
  _1 = D.15470;
  c.length = _1;
  D.15471 = stbi__get32be (s);
  _2 = D.15471;
  c.type = _2;
  D.15468 = c;
  goto <D.15473>;
  <D.15473>:
  c = {CLOBBER};
  goto <D.15469>;
  <D.15469>:
  return D.15468;
  <D.15472>:
  c = {CLOBBER};
  resx 1
}



;; Function stbi__check_png_header (_ZL22stbi__check_png_headerP13stbi__context, funcdef_no=901, decl_uid=12112, cgraph_uid=807, symbol_order=830)

stbi__check_png_header (struct stbi__context * s)
{
  unsigned char D.15481;
  int i;
  static const stbi_uc png_sig[8] = {137, 80, 78, 71, 13, 10, 26, 10};
  int D.15479;
  bool retval.347;

  i = 0;
  <D.15474>:
  if (i > 7) goto <D.12116>; else goto <D.15475>;
  <D.15475>:
  D.15481 = stbi__get8 (s);
  _1 = D.15481;
  _2 = png_sig[i];
  retval.347 = _1 != _2;
  if (retval.347 != 0) goto <D.15477>; else goto <D.15478>;
  <D.15477>:
  D.15479 = stbi__err ("bad png sig");
  goto <D.15480>;
  <D.15478>:
  i = i + 1;
  goto <D.15474>;
  <D.12116>:
  D.15479 = 1;
  goto <D.15480>;
  <D.15480>:
  return D.15479;
}



;; Function stbi__paeth (_ZL11stbi__paethiii, funcdef_no=902, decl_uid=12138, cgraph_uid=808, symbol_order=832)

stbi__paeth (int a, int b, int c)
{
  int pc;
  int pb;
  int pa;
  int p;
  int D.15486;

  _1 = a + b;
  p = _1 - c;
  _2 = p - a;
  pa = ABS_EXPR <_2>;
  _3 = p - b;
  pb = ABS_EXPR <_3>;
  _4 = p - c;
  pc = ABS_EXPR <_4>;
  if (pa <= pb) goto <D.15482>; else goto <D.15483>;
  <D.15482>:
  if (pa <= pc) goto <D.15484>; else goto <D.15485>;
  <D.15484>:
  D.15486 = a;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15489>;
  <D.15485>:
  <D.15483>:
  if (pb <= pc) goto <D.15487>; else goto <D.15488>;
  <D.15487>:
  D.15486 = b;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15489>;
  <D.15488>:
  D.15486 = c;
  goto <D.15489>;
  <D.15489>:
  return D.15486;
}



;; Function stbi__create_png_image_raw (_ZL26stbi__create_png_image_rawP9stbi__pngPhjijjii, funcdef_no=903, decl_uid=12153, cgraph_uid=809, symbol_order=834)

stbi__create_png_image_raw (struct stbi__png * a, stbi_uc * raw, stbi__uint32 raw_len, int out_n, stbi__uint32 x, stbi__uint32 y, int depth, int color)
{
  stbi__uint16 * cur16;
  stbi_uc * cur;
  int q;
  stbi_uc scale;
  stbi_uc * in;
  stbi_uc * cur;
  int nk;
  int filter;
  stbi_uc * prior;
  stbi_uc * cur;
  int width;
  int filter_bytes;
  int output_bytes;
  int img_n;
  int k;
  stbi__uint32 img_width_bytes;
  stbi__uint32 img_len;
  stbi__uint32 stride;
  stbi__uint32 j;
  stbi__uint32 i;
  struct stbi__context * s;
  int bytes;
  bool iftmp.391;
  stbi_uc iftmp.362;
  bool iftmp.360;
  bool retval.354;
  int D.15502;
  bool iftmp.351;
  int iftmp.348;

  if (depth == 16) goto <D.15491>; else goto <D.15492>;
  <D.15491>:
  iftmp.348 = 2;
  goto <D.15493>;
  <D.15492>:
  iftmp.348 = 1;
  <D.15493>:
  bytes = iftmp.348;
  s = a->s;
  out_n.349_1 = (unsigned int) out_n;
  _2 = x * out_n.349_1;
  bytes.350_3 = (unsigned int) bytes;
  stride = _2 * bytes.350_3;
  img_n = s->img_n;
  output_bytes = out_n * bytes;
  filter_bytes = img_n * bytes;
  width = (int) x;
  _4 = s->img_n;
  if (out_n == _4) goto <D.15495>; else goto <D.15498>;
  <D.15498>:
  _5 = s->img_n;
  _6 = _5 + 1;
  if (out_n == _6) goto <D.15495>; else goto <D.15499>;
  <D.15499>:
  _assert ("out_n == s->img_n || out_n == s->img_n+1", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 4553);
  if (0 != 0) goto <D.15495>; else goto <D.15496>;
  <D.15495>:
  iftmp.351 = 1;
  goto <D.15497>;
  <D.15496>:
  iftmp.351 = 0;
  <D.15497>:
  y.352_7 = (int) y;
  x.353_8 = (int) x;
  _9 = stbi__malloc_mad3 (x.353_8, y.352_7, output_bytes, 0);
  a->out = _9;
  _10 = a->out;
  if (_10 == 0B) goto <D.15500>; else goto <D.15501>;
  <D.15500>:
  D.15502 = stbi__err ("outofmem");
  goto <D.15668>;
  <D.15501>:
  x.355_11 = (int) x;
  _12 = stbi__mad3sizes_valid (img_n, x.355_11, depth, 7);
  retval.354 = _12 == 0;
  if (retval.354 != 0) goto <D.15504>; else goto <D.15505>;
  <D.15504>:
  D.15502 = stbi__err ("too large");
  goto <D.15668>;
  <D.15505>:
  img_n.356_13 = (unsigned int) img_n;
  _14 = x * img_n.356_13;
  depth.357_15 = (unsigned int) depth;
  _16 = _14 * depth.357_15;
  _17 = _16 + 7;
  img_width_bytes = _17 >> 3;
  _18 = img_width_bytes + 1;
  img_len = y * _18;
  if (raw_len < img_len) goto <D.15506>; else goto <D.15507>;
  <D.15506>:
  D.15502 = stbi__err ("not enough pixels");
  goto <D.15668>;
  <D.15507>:
  j = 0;
  <D.15508>:
  if (j >= y) goto <D.12198>; else goto <D.15509>;
  <D.15509>:
  _19 = a->out;
  _20 = stride * j;
  _21 = (sizetype) _20;
  cur = _19 + _21;
  raw.358_22 = raw;
  raw = raw.358_22 + 1;
  _23 = *raw.358_22;
  filter = (int) _23;
  if (filter > 4) goto <D.15510>; else goto <D.15511>;
  <D.15510>:
  D.15502 = stbi__err ("invalid filter");
  goto <D.15668>;
  <D.15511>:
  if (depth <= 7) goto <D.15512>; else goto <D.15513>;
  <D.15512>:
  if (img_width_bytes > x) goto <D.15514>; else goto <D.15515>;
  <D.15514>:
  D.15502 = stbi__err ("invalid width");
  goto <D.15668>;
  <D.15515>:
  out_n.359_24 = (unsigned int) out_n;
  _25 = x * out_n.359_24;
  _26 = _25 - img_width_bytes;
  _27 = (sizetype) _26;
  cur = cur + _27;
  filter_bytes = 1;
  width = (int) img_width_bytes;
  goto <D.15516>;
  <D.15513>:
  <D.15516>:
  _28 = (sizetype) stride;
  _29 = -_28;
  prior = cur + _29;
  if (j == 0) goto <D.15517>; else goto <D.15518>;
  <D.15517>:
  _30 = first_row_filter[filter];
  filter = (int) _30;
  goto <D.15519>;
  <D.15518>:
  <D.15519>:
  k = 0;
  <D.15520>:
  if (k >= filter_bytes) goto <D.12200>; else goto <D.15521>;
  <D.15521>:
  switch (filter) <default: <D.15522>, case 0: <D.12170>, case 1: <D.12171>, case 2: <D.12172>, case 3: <D.12173>, case 4: <D.12174>, case 5: <D.12175>, case 6: <D.12176>>
  <D.12170>:
  _31 = (sizetype) k;
  _32 = raw + _31;
  _33 = (sizetype) k;
  _34 = cur + _33;
  _35 = *_32;
  *_34 = _35;
  goto <D.12202>;
  <D.12171>:
  _36 = (sizetype) k;
  _37 = raw + _36;
  _38 = (sizetype) k;
  _39 = cur + _38;
  _40 = *_37;
  *_39 = _40;
  goto <D.12202>;
  <D.12172>:
  _41 = (sizetype) k;
  _42 = raw + _41;
  _43 = *_42;
  _44 = (sizetype) k;
  _45 = prior + _44;
  _46 = *_45;
  _47 = (sizetype) k;
  _48 = cur + _47;
  _49 = _43 + _46;
  *_48 = _49;
  goto <D.12202>;
  <D.12173>:
  _50 = (sizetype) k;
  _51 = raw + _50;
  _52 = *_51;
  _53 = (sizetype) k;
  _54 = prior + _53;
  _55 = *_54;
  _56 = (int) _55;
  _57 = _56 >> 1;
  _58 = (unsigned char) _57;
  _59 = (sizetype) k;
  _60 = cur + _59;
  _61 = _52 + _58;
  *_60 = _61;
  goto <D.12202>;
  <D.12174>:
  _62 = (sizetype) k;
  _63 = raw + _62;
  _64 = *_63;
  _65 = (sizetype) k;
  _66 = prior + _65;
  _67 = *_66;
  _68 = (int) _67;
  _69 = stbi__paeth (0, _68, 0);
  _70 = (unsigned char) _69;
  _71 = (sizetype) k;
  _72 = cur + _71;
  _73 = _64 + _70;
  *_72 = _73;
  goto <D.12202>;
  <D.12175>:
  _74 = (sizetype) k;
  _75 = raw + _74;
  _76 = (sizetype) k;
  _77 = cur + _76;
  _78 = *_75;
  *_77 = _78;
  goto <D.12202>;
  <D.12176>:
  _79 = (sizetype) k;
  _80 = raw + _79;
  _81 = (sizetype) k;
  _82 = cur + _81;
  _83 = *_80;
  *_82 = _83;
  goto <D.12202>;
  <D.12202>:
  <D.15522>:
  k = k + 1;
  goto <D.15520>;
  <D.12200>:
  if (depth == 8) goto <D.15523>; else goto <D.15524>;
  <D.15523>:
  if (img_n != out_n) goto <D.15525>; else goto <D.15526>;
  <D.15525>:
  _84 = (sizetype) img_n;
  _85 = cur + _84;
  *_85 = 255;
  goto <D.15527>;
  <D.15526>:
  <D.15527>:
  _86 = (sizetype) img_n;
  raw = raw + _86;
  _87 = (sizetype) out_n;
  cur = cur + _87;
  _88 = (sizetype) out_n;
  prior = prior + _88;
  goto <D.15528>;
  <D.15524>:
  if (depth == 16) goto <D.15529>; else goto <D.15530>;
  <D.15529>:
  if (img_n != out_n) goto <D.15531>; else goto <D.15532>;
  <D.15531>:
  _89 = (sizetype) filter_bytes;
  _90 = cur + _89;
  *_90 = 255;
  _91 = (sizetype) filter_bytes;
  _92 = _91 + 1;
  _93 = cur + _92;
  *_93 = 255;
  goto <D.15533>;
  <D.15532>:
  <D.15533>:
  _94 = (sizetype) filter_bytes;
  raw = raw + _94;
  _95 = (sizetype) output_bytes;
  cur = cur + _95;
  _96 = (sizetype) output_bytes;
  prior = prior + _96;
  goto <D.15534>;
  <D.15530>:
  raw = raw + 1;
  cur = cur + 1;
  prior = prior + 1;
  <D.15534>:
  <D.15528>:
  if (depth <= 7) goto <D.15535>; else goto <D.15538>;
  <D.15538>:
  if (img_n == out_n) goto <D.15535>; else goto <D.15536>;
  <D.15535>:
  _97 = width + -1;
  nk = filter_bytes * _97;
  switch (filter) <default: <D.15551>, case 0: <D.12178>, case 1: <D.12179>, case 2: <D.12180>, case 3: <D.12181>, case 4: <D.12182>, case 5: <D.12183>, case 6: <D.12184>>
  <D.12178>:
  _98 = (long long unsigned int) nk;
  memcpy (cur, raw, _98);
  goto <D.12203>;
  <D.12179>:
  k = 0;
  <D.15539>:
  if (k >= nk) goto <D.12204>; else goto <D.15540>;
  <D.15540>:
  _99 = (sizetype) k;
  _100 = raw + _99;
  _101 = *_100;
  _102 = k - filter_bytes;
  _103 = (sizetype) _102;
  _104 = cur + _103;
  _105 = *_104;
  _106 = (sizetype) k;
  _107 = cur + _106;
  _108 = _101 + _105;
  *_107 = _108;
  k = k + 1;
  goto <D.15539>;
  <D.12204>:
  goto <D.12203>;
  <D.12180>:
  k = 0;
  <D.15541>:
  if (k >= nk) goto <D.12206>; else goto <D.15542>;
  <D.15542>:
  _109 = (sizetype) k;
  _110 = raw + _109;
  _111 = *_110;
  _112 = (sizetype) k;
  _113 = prior + _112;
  _114 = *_113;
  _115 = (sizetype) k;
  _116 = cur + _115;
  _117 = _111 + _114;
  *_116 = _117;
  k = k + 1;
  goto <D.15541>;
  <D.12206>:
  goto <D.12203>;
  <D.12181>:
  k = 0;
  <D.15543>:
  if (k >= nk) goto <D.12208>; else goto <D.15544>;
  <D.15544>:
  _118 = (sizetype) k;
  _119 = raw + _118;
  _120 = *_119;
  _121 = (sizetype) k;
  _122 = prior + _121;
  _123 = *_122;
  _124 = (int) _123;
  _125 = k - filter_bytes;
  _126 = (sizetype) _125;
  _127 = cur + _126;
  _128 = *_127;
  _129 = (int) _128;
  _130 = _124 + _129;
  _131 = _130 >> 1;
  _132 = (unsigned char) _131;
  _133 = (sizetype) k;
  _134 = cur + _133;
  _135 = _120 + _132;
  *_134 = _135;
  k = k + 1;
  goto <D.15543>;
  <D.12208>:
  goto <D.12203>;
  <D.12182>:
  k = 0;
  <D.15545>:
  if (k >= nk) goto <D.12210>; else goto <D.15546>;
  <D.15546>:
  _136 = (sizetype) k;
  _137 = raw + _136;
  _138 = *_137;
  _139 = k - filter_bytes;
  _140 = (sizetype) _139;
  _141 = prior + _140;
  _142 = *_141;
  _143 = (int) _142;
  _144 = (sizetype) k;
  _145 = prior + _144;
  _146 = *_145;
  _147 = (int) _146;
  _148 = k - filter_bytes;
  _149 = (sizetype) _148;
  _150 = cur + _149;
  _151 = *_150;
  _152 = (int) _151;
  _153 = stbi__paeth (_152, _147, _143);
  _154 = (unsigned char) _153;
  _155 = (sizetype) k;
  _156 = cur + _155;
  _157 = _138 + _154;
  *_156 = _157;
  k = k + 1;
  goto <D.15545>;
  <D.12210>:
  goto <D.12203>;
  <D.12183>:
  k = 0;
  <D.15547>:
  if (k >= nk) goto <D.12212>; else goto <D.15548>;
  <D.15548>:
  _158 = (sizetype) k;
  _159 = raw + _158;
  _160 = *_159;
  _161 = k - filter_bytes;
  _162 = (sizetype) _161;
  _163 = cur + _162;
  _164 = *_163;
  _165 = (int) _164;
  _166 = _165 >> 1;
  _167 = (unsigned char) _166;
  _168 = (sizetype) k;
  _169 = cur + _168;
  _170 = _160 + _167;
  *_169 = _170;
  k = k + 1;
  goto <D.15547>;
  <D.12212>:
  goto <D.12203>;
  <D.12184>:
  k = 0;
  <D.15549>:
  if (k >= nk) goto <D.12214>; else goto <D.15550>;
  <D.15550>:
  _171 = (sizetype) k;
  _172 = raw + _171;
  _173 = *_172;
  _174 = k - filter_bytes;
  _175 = (sizetype) _174;
  _176 = cur + _175;
  _177 = *_176;
  _178 = (int) _177;
  _179 = stbi__paeth (_178, 0, 0);
  _180 = (unsigned char) _179;
  _181 = (sizetype) k;
  _182 = cur + _181;
  _183 = _173 + _180;
  *_182 = _183;
  k = k + 1;
  goto <D.15549>;
  <D.12214>:
  goto <D.12203>;
  <D.12203>:
  <D.15551>:
  _184 = (sizetype) nk;
  raw = raw + _184;
  goto <D.15537>;
  <D.15536>:
  _185 = img_n + 1;
  if (out_n == _185) goto <D.15553>; else goto <D.15556>;
  <D.15556>:
  _assert ("img_n+1 == out_n", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 4637);
  if (0 != 0) goto <D.15553>; else goto <D.15554>;
  <D.15553>:
  iftmp.360 = 1;
  goto <D.15555>;
  <D.15554>:
  iftmp.360 = 0;
  <D.15555>:
  switch (filter) <default: <D.15585>, case 0: <D.12185>, case 1: <D.12186>, case 2: <D.12187>, case 3: <D.12188>, case 4: <D.12189>, case 5: <D.12190>, case 6: <D.12191>>
  <D.12185>:
  i = x + 4294967295;
  <D.15557>:
  if (i == 0) goto <D.12217>; else goto <D.15558>;
  <D.15558>:
  k = 0;
  <D.15559>:
  if (k >= filter_bytes) goto <D.12219>; else goto <D.15560>;
  <D.15560>:
  _186 = (sizetype) k;
  _187 = raw + _186;
  _188 = (sizetype) k;
  _189 = cur + _188;
  _190 = *_187;
  *_189 = _190;
  k = k + 1;
  goto <D.15559>;
  <D.12219>:
  i = i + 4294967295;
  _191 = (sizetype) filter_bytes;
  _192 = cur + _191;
  *_192 = 255;
  _193 = (sizetype) filter_bytes;
  raw = raw + _193;
  _194 = (sizetype) output_bytes;
  cur = cur + _194;
  _195 = (sizetype) output_bytes;
  prior = prior + _195;
  goto <D.15557>;
  <D.12217>:
  goto <D.12216>;
  <D.12186>:
  i = x + 4294967295;
  <D.15561>:
  if (i == 0) goto <D.12221>; else goto <D.15562>;
  <D.15562>:
  k = 0;
  <D.15563>:
  if (k >= filter_bytes) goto <D.12223>; else goto <D.15564>;
  <D.15564>:
  _196 = (sizetype) k;
  _197 = raw + _196;
  _198 = *_197;
  _199 = k - output_bytes;
  _200 = (sizetype) _199;
  _201 = cur + _200;
  _202 = *_201;
  _203 = (sizetype) k;
  _204 = cur + _203;
  _205 = _198 + _202;
  *_204 = _205;
  k = k + 1;
  goto <D.15563>;
  <D.12223>:
  i = i + 4294967295;
  _206 = (sizetype) filter_bytes;
  _207 = cur + _206;
  *_207 = 255;
  _208 = (sizetype) filter_bytes;
  raw = raw + _208;
  _209 = (sizetype) output_bytes;
  cur = cur + _209;
  _210 = (sizetype) output_bytes;
  prior = prior + _210;
  goto <D.15561>;
  <D.12221>:
  goto <D.12216>;
  <D.12187>:
  i = x + 4294967295;
  <D.15565>:
  if (i == 0) goto <D.12225>; else goto <D.15566>;
  <D.15566>:
  k = 0;
  <D.15567>:
  if (k >= filter_bytes) goto <D.12227>; else goto <D.15568>;
  <D.15568>:
  _211 = (sizetype) k;
  _212 = raw + _211;
  _213 = *_212;
  _214 = (sizetype) k;
  _215 = prior + _214;
  _216 = *_215;
  _217 = (sizetype) k;
  _218 = cur + _217;
  _219 = _213 + _216;
  *_218 = _219;
  k = k + 1;
  goto <D.15567>;
  <D.12227>:
  i = i + 4294967295;
  _220 = (sizetype) filter_bytes;
  _221 = cur + _220;
  *_221 = 255;
  _222 = (sizetype) filter_bytes;
  raw = raw + _222;
  _223 = (sizetype) output_bytes;
  cur = cur + _223;
  _224 = (sizetype) output_bytes;
  prior = prior + _224;
  goto <D.15565>;
  <D.12225>:
  goto <D.12216>;
  <D.12188>:
  i = x + 4294967295;
  <D.15569>:
  if (i == 0) goto <D.12229>; else goto <D.15570>;
  <D.15570>:
  k = 0;
  <D.15571>:
  if (k >= filter_bytes) goto <D.12231>; else goto <D.15572>;
  <D.15572>:
  _225 = (sizetype) k;
  _226 = raw + _225;
  _227 = *_226;
  _228 = (sizetype) k;
  _229 = prior + _228;
  _230 = *_229;
  _231 = (int) _230;
  _232 = k - output_bytes;
  _233 = (sizetype) _232;
  _234 = cur + _233;
  _235 = *_234;
  _236 = (int) _235;
  _237 = _231 + _236;
  _238 = _237 >> 1;
  _239 = (unsigned char) _238;
  _240 = (sizetype) k;
  _241 = cur + _240;
  _242 = _227 + _239;
  *_241 = _242;
  k = k + 1;
  goto <D.15571>;
  <D.12231>:
  i = i + 4294967295;
  _243 = (sizetype) filter_bytes;
  _244 = cur + _243;
  *_244 = 255;
  _245 = (sizetype) filter_bytes;
  raw = raw + _245;
  _246 = (sizetype) output_bytes;
  cur = cur + _246;
  _247 = (sizetype) output_bytes;
  prior = prior + _247;
  goto <D.15569>;
  <D.12229>:
  goto <D.12216>;
  <D.12189>:
  i = x + 4294967295;
  <D.15573>:
  if (i == 0) goto <D.12233>; else goto <D.15574>;
  <D.15574>:
  k = 0;
  <D.15575>:
  if (k >= filter_bytes) goto <D.12235>; else goto <D.15576>;
  <D.15576>:
  _248 = (sizetype) k;
  _249 = raw + _248;
  _250 = *_249;
  _251 = k - output_bytes;
  _252 = (sizetype) _251;
  _253 = prior + _252;
  _254 = *_253;
  _255 = (int) _254;
  _256 = (sizetype) k;
  _257 = prior + _256;
  _258 = *_257;
  _259 = (int) _258;
  _260 = k - output_bytes;
  _261 = (sizetype) _260;
  _262 = cur + _261;
  _263 = *_262;
  _264 = (int) _263;
  _265 = stbi__paeth (_264, _259, _255);
  _266 = (unsigned char) _265;
  _267 = (sizetype) k;
  _268 = cur + _267;
  _269 = _250 + _266;
  *_268 = _269;
  k = k + 1;
  goto <D.15575>;
  <D.12235>:
  i = i + 4294967295;
  _270 = (sizetype) filter_bytes;
  _271 = cur + _270;
  *_271 = 255;
  _272 = (sizetype) filter_bytes;
  raw = raw + _272;
  _273 = (sizetype) output_bytes;
  cur = cur + _273;
  _274 = (sizetype) output_bytes;
  prior = prior + _274;
  goto <D.15573>;
  <D.12233>:
  goto <D.12216>;
  <D.12190>:
  i = x + 4294967295;
  <D.15577>:
  if (i == 0) goto <D.12237>; else goto <D.15578>;
  <D.15578>:
  k = 0;
  <D.15579>:
  if (k >= filter_bytes) goto <D.12239>; else goto <D.15580>;
  <D.15580>:
  _275 = (sizetype) k;
  _276 = raw + _275;
  _277 = *_276;
  _278 = k - output_bytes;
  _279 = (sizetype) _278;
  _280 = cur + _279;
  _281 = *_280;
  _282 = (int) _281;
  _283 = _282 >> 1;
  _284 = (unsigned char) _283;
  _285 = (sizetype) k;
  _286 = cur + _285;
  _287 = _277 + _284;
  *_286 = _287;
  k = k + 1;
  goto <D.15579>;
  <D.12239>:
  i = i + 4294967295;
  _288 = (sizetype) filter_bytes;
  _289 = cur + _288;
  *_289 = 255;
  _290 = (sizetype) filter_bytes;
  raw = raw + _290;
  _291 = (sizetype) output_bytes;
  cur = cur + _291;
  _292 = (sizetype) output_bytes;
  prior = prior + _292;
  goto <D.15577>;
  <D.12237>:
  goto <D.12216>;
  <D.12191>:
  i = x + 4294967295;
  <D.15581>:
  if (i == 0) goto <D.12241>; else goto <D.15582>;
  <D.15582>:
  k = 0;
  <D.15583>:
  if (k >= filter_bytes) goto <D.12243>; else goto <D.15584>;
  <D.15584>:
  _293 = (sizetype) k;
  _294 = raw + _293;
  _295 = *_294;
  _296 = k - output_bytes;
  _297 = (sizetype) _296;
  _298 = cur + _297;
  _299 = *_298;
  _300 = (int) _299;
  _301 = stbi__paeth (_300, 0, 0);
  _302 = (unsigned char) _301;
  _303 = (sizetype) k;
  _304 = cur + _303;
  _305 = _295 + _302;
  *_304 = _305;
  k = k + 1;
  goto <D.15583>;
  <D.12243>:
  i = i + 4294967295;
  _306 = (sizetype) filter_bytes;
  _307 = cur + _306;
  *_307 = 255;
  _308 = (sizetype) filter_bytes;
  raw = raw + _308;
  _309 = (sizetype) output_bytes;
  cur = cur + _309;
  _310 = (sizetype) output_bytes;
  prior = prior + _310;
  goto <D.15581>;
  <D.12241>:
  goto <D.12216>;
  <D.12216>:
  <D.15585>:
  if (depth == 16) goto <D.15586>; else goto <D.15587>;
  <D.15586>:
  _311 = a->out;
  _312 = stride * j;
  _313 = (sizetype) _312;
  cur = _311 + _313;
  i = 0;
  <D.15588>:
  if (i >= x) goto <D.12245>; else goto <D.15589>;
  <D.15589>:
  _314 = (sizetype) filter_bytes;
  _315 = _314 + 1;
  _316 = cur + _315;
  *_316 = 255;
  i = i + 1;
  _317 = (sizetype) output_bytes;
  cur = cur + _317;
  goto <D.15588>;
  <D.12245>:
  goto <D.15590>;
  <D.15587>:
  <D.15590>:
  <D.15537>:
  j = j + 1;
  goto <D.15508>;
  <D.12198>:
  if (depth <= 7) goto <D.15591>; else goto <D.15592>;
  <D.15591>:
  j = 0;
  <D.15593>:
  if (j >= y) goto <D.12247>; else goto <D.15594>;
  <D.15594>:
  _318 = a->out;
  _319 = stride * j;
  _320 = (sizetype) _319;
  cur = _318 + _320;
  _321 = a->out;
  _322 = stride * j;
  _323 = (sizetype) _322;
  out_n.361_324 = (unsigned int) out_n;
  _325 = x * out_n.361_324;
  _326 = (sizetype) _325;
  _327 = _323 + _326;
  _328 = (sizetype) img_width_bytes;
  _329 = _327 - _328;
  in = _321 + _329;
  if (color == 0) goto <D.15596>; else goto <D.15597>;
  <D.15596>:
  iftmp.362 = stbi__depth_scale_table[depth];
  goto <D.15598>;
  <D.15597>:
  iftmp.362 = 1;
  <D.15598>:
  scale = iftmp.362;
  if (depth == 4) goto <D.15599>; else goto <D.15600>;
  <D.15599>:
  img_n.363_330 = (unsigned int) img_n;
  _331 = x * img_n.363_330;
  k = (int) _331;
  <D.15601>:
  if (k <= 1) goto <D.12249>; else goto <D.15602>;
  <D.15602>:
  _332 = *in;
  _333 = (int) _332;
  _334 = _333 >> 4;
  _335 = (unsigned char) _334;
  cur.364_336 = cur;
  cur = cur.364_336 + 1;
  _337 = scale * _335;
  *cur.364_336 = _337;
  _338 = *in;
  _339 = _338 & 15;
  cur.365_340 = cur;
  cur = cur.365_340 + 1;
  _341 = scale * _339;
  *cur.365_340 = _341;
  k = k + -2;
  in = in + 1;
  goto <D.15601>;
  <D.12249>:
  if (k > 0) goto <D.15603>; else goto <D.15604>;
  <D.15603>:
  _342 = *in;
  _343 = (int) _342;
  _344 = _343 >> 4;
  _345 = (unsigned char) _344;
  cur.366_346 = cur;
  cur = cur.366_346 + 1;
  _347 = scale * _345;
  *cur.366_346 = _347;
  goto <D.15605>;
  <D.15604>:
  <D.15605>:
  goto <D.15606>;
  <D.15600>:
  if (depth == 2) goto <D.15607>; else goto <D.15608>;
  <D.15607>:
  img_n.367_348 = (unsigned int) img_n;
  _349 = x * img_n.367_348;
  k = (int) _349;
  <D.15609>:
  if (k <= 3) goto <D.12251>; else goto <D.15610>;
  <D.15610>:
  _350 = *in;
  _351 = (int) _350;
  _352 = _351 >> 6;
  _353 = (unsigned char) _352;
  cur.368_354 = cur;
  cur = cur.368_354 + 1;
  _355 = scale * _353;
  *cur.368_354 = _355;
  _356 = *in;
  _357 = (int) _356;
  _358 = _357 >> 4;
  _359 = (unsigned char) _358;
  _360 = _359 & 3;
  cur.369_361 = cur;
  cur = cur.369_361 + 1;
  _362 = scale * _360;
  *cur.369_361 = _362;
  _363 = *in;
  _364 = (int) _363;
  _365 = _364 >> 2;
  _366 = (unsigned char) _365;
  _367 = _366 & 3;
  cur.370_368 = cur;
  cur = cur.370_368 + 1;
  _369 = scale * _367;
  *cur.370_368 = _369;
  _370 = *in;
  _371 = _370 & 3;
  cur.371_372 = cur;
  cur = cur.371_372 + 1;
  _373 = scale * _371;
  *cur.371_372 = _373;
  k = k + -4;
  in = in + 1;
  goto <D.15609>;
  <D.12251>:
  if (k > 0) goto <D.15611>; else goto <D.15612>;
  <D.15611>:
  _374 = *in;
  _375 = (int) _374;
  _376 = _375 >> 6;
  _377 = (unsigned char) _376;
  cur.372_378 = cur;
  cur = cur.372_378 + 1;
  _379 = scale * _377;
  *cur.372_378 = _379;
  goto <D.15613>;
  <D.15612>:
  <D.15613>:
  if (k > 1) goto <D.15614>; else goto <D.15615>;
  <D.15614>:
  _380 = *in;
  _381 = (int) _380;
  _382 = _381 >> 4;
  _383 = (unsigned char) _382;
  _384 = _383 & 3;
  cur.373_385 = cur;
  cur = cur.373_385 + 1;
  _386 = scale * _384;
  *cur.373_385 = _386;
  goto <D.15616>;
  <D.15615>:
  <D.15616>:
  if (k > 2) goto <D.15617>; else goto <D.15618>;
  <D.15617>:
  _387 = *in;
  _388 = (int) _387;
  _389 = _388 >> 2;
  _390 = (unsigned char) _389;
  _391 = _390 & 3;
  cur.374_392 = cur;
  cur = cur.374_392 + 1;
  _393 = scale * _391;
  *cur.374_392 = _393;
  goto <D.15619>;
  <D.15618>:
  <D.15619>:
  goto <D.15620>;
  <D.15608>:
  if (depth == 1) goto <D.15621>; else goto <D.15622>;
  <D.15621>:
  img_n.375_394 = (unsigned int) img_n;
  _395 = x * img_n.375_394;
  k = (int) _395;
  <D.15623>:
  if (k <= 7) goto <D.12253>; else goto <D.15624>;
  <D.15624>:
  _396 = *in;
  _397 = (int) _396;
  _398 = _397 >> 7;
  _399 = (unsigned char) _398;
  cur.376_400 = cur;
  cur = cur.376_400 + 1;
  _401 = scale * _399;
  *cur.376_400 = _401;
  _402 = *in;
  _403 = (int) _402;
  _404 = _403 >> 6;
  _405 = (unsigned char) _404;
  _406 = _405 & 1;
  cur.377_407 = cur;
  cur = cur.377_407 + 1;
  _408 = scale * _406;
  *cur.377_407 = _408;
  _409 = *in;
  _410 = (int) _409;
  _411 = _410 >> 5;
  _412 = (unsigned char) _411;
  _413 = _412 & 1;
  cur.378_414 = cur;
  cur = cur.378_414 + 1;
  _415 = scale * _413;
  *cur.378_414 = _415;
  _416 = *in;
  _417 = (int) _416;
  _418 = _417 >> 4;
  _419 = (unsigned char) _418;
  _420 = _419 & 1;
  cur.379_421 = cur;
  cur = cur.379_421 + 1;
  _422 = scale * _420;
  *cur.379_421 = _422;
  _423 = *in;
  _424 = (int) _423;
  _425 = _424 >> 3;
  _426 = (unsigned char) _425;
  _427 = _426 & 1;
  cur.380_428 = cur;
  cur = cur.380_428 + 1;
  _429 = scale * _427;
  *cur.380_428 = _429;
  _430 = *in;
  _431 = (int) _430;
  _432 = _431 >> 2;
  _433 = (unsigned char) _432;
  _434 = _433 & 1;
  cur.381_435 = cur;
  cur = cur.381_435 + 1;
  _436 = scale * _434;
  *cur.381_435 = _436;
  _437 = *in;
  _438 = (int) _437;
  _439 = _438 >> 1;
  _440 = (unsigned char) _439;
  _441 = _440 & 1;
  cur.382_442 = cur;
  cur = cur.382_442 + 1;
  _443 = scale * _441;
  *cur.382_442 = _443;
  _444 = *in;
  _445 = _444 & 1;
  cur.383_446 = cur;
  cur = cur.383_446 + 1;
  _447 = scale * _445;
  *cur.383_446 = _447;
  k = k + -8;
  in = in + 1;
  goto <D.15623>;
  <D.12253>:
  if (k > 0) goto <D.15625>; else goto <D.15626>;
  <D.15625>:
  _448 = *in;
  _449 = (int) _448;
  _450 = _449 >> 7;
  _451 = (unsigned char) _450;
  cur.384_452 = cur;
  cur = cur.384_452 + 1;
  _453 = scale * _451;
  *cur.384_452 = _453;
  goto <D.15627>;
  <D.15626>:
  <D.15627>:
  if (k > 1) goto <D.15628>; else goto <D.15629>;
  <D.15628>:
  _454 = *in;
  _455 = (int) _454;
  _456 = _455 >> 6;
  _457 = (unsigned char) _456;
  _458 = _457 & 1;
  cur.385_459 = cur;
  cur = cur.385_459 + 1;
  _460 = scale * _458;
  *cur.385_459 = _460;
  goto <D.15630>;
  <D.15629>:
  <D.15630>:
  if (k > 2) goto <D.15631>; else goto <D.15632>;
  <D.15631>:
  _461 = *in;
  _462 = (int) _461;
  _463 = _462 >> 5;
  _464 = (unsigned char) _463;
  _465 = _464 & 1;
  cur.386_466 = cur;
  cur = cur.386_466 + 1;
  _467 = scale * _465;
  *cur.386_466 = _467;
  goto <D.15633>;
  <D.15632>:
  <D.15633>:
  if (k > 3) goto <D.15634>; else goto <D.15635>;
  <D.15634>:
  _468 = *in;
  _469 = (int) _468;
  _470 = _469 >> 4;
  _471 = (unsigned char) _470;
  _472 = _471 & 1;
  cur.387_473 = cur;
  cur = cur.387_473 + 1;
  _474 = scale * _472;
  *cur.387_473 = _474;
  goto <D.15636>;
  <D.15635>:
  <D.15636>:
  if (k > 4) goto <D.15637>; else goto <D.15638>;
  <D.15637>:
  _475 = *in;
  _476 = (int) _475;
  _477 = _476 >> 3;
  _478 = (unsigned char) _477;
  _479 = _478 & 1;
  cur.388_480 = cur;
  cur = cur.388_480 + 1;
  _481 = scale * _479;
  *cur.388_480 = _481;
  goto <D.15639>;
  <D.15638>:
  <D.15639>:
  if (k > 5) goto <D.15640>; else goto <D.15641>;
  <D.15640>:
  _482 = *in;
  _483 = (int) _482;
  _484 = _483 >> 2;
  _485 = (unsigned char) _484;
  _486 = _485 & 1;
  cur.389_487 = cur;
  cur = cur.389_487 + 1;
  _488 = scale * _486;
  *cur.389_487 = _488;
  goto <D.15642>;
  <D.15641>:
  <D.15642>:
  if (k > 6) goto <D.15643>; else goto <D.15644>;
  <D.15643>:
  _489 = *in;
  _490 = (int) _489;
  _491 = _490 >> 1;
  _492 = (unsigned char) _491;
  _493 = _492 & 1;
  cur.390_494 = cur;
  cur = cur.390_494 + 1;
  _495 = scale * _493;
  *cur.390_494 = _495;
  goto <D.15645>;
  <D.15644>:
  <D.15645>:
  goto <D.15646>;
  <D.15622>:
  <D.15646>:
  <D.15620>:
  <D.15606>:
  if (img_n != out_n) goto <D.15647>; else goto <D.15648>;
  <D.15647>:
  _496 = a->out;
  _497 = stride * j;
  _498 = (sizetype) _497;
  cur = _496 + _498;
  if (img_n == 1) goto <D.15649>; else goto <D.15650>;
  <D.15649>:
  _499 = x + 4294967295;
  q = (int) _499;
  <D.15651>:
  if (q < 0) goto <D.12255>; else goto <D.15652>;
  <D.15652>:
  _500 = q * 2;
  _501 = (sizetype) _500;
  _502 = _501 + 1;
  _503 = cur + _502;
  *_503 = 255;
  _504 = (sizetype) q;
  _505 = cur + _504;
  _506 = q * 2;
  _507 = (sizetype) _506;
  _508 = cur + _507;
  _509 = *_505;
  *_508 = _509;
  q = q + -1;
  goto <D.15651>;
  <D.12255>:
  goto <D.15653>;
  <D.15650>:
  if (img_n == 3) goto <D.15655>; else goto <D.15658>;
  <D.15658>:
  _assert ("img_n == 3", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 4726);
  if (0 != 0) goto <D.15655>; else goto <D.15656>;
  <D.15655>:
  iftmp.391 = 1;
  goto <D.15657>;
  <D.15656>:
  iftmp.391 = 0;
  <D.15657>:
  _510 = x + 4294967295;
  q = (int) _510;
  <D.15659>:
  if (q < 0) goto <D.12257>; else goto <D.15660>;
  <D.15660>:
  _511 = q * 4;
  _512 = (sizetype) _511;
  _513 = _512 + 3;
  _514 = cur + _513;
  *_514 = 255;
  _515 = q * 3;
  _516 = (sizetype) _515;
  _517 = _516 + 2;
  _518 = cur + _517;
  _519 = q * 4;
  _520 = (sizetype) _519;
  _521 = _520 + 2;
  _522 = cur + _521;
  _523 = *_518;
  *_522 = _523;
  _524 = q * 3;
  _525 = (sizetype) _524;
  _526 = _525 + 1;
  _527 = cur + _526;
  _528 = q * 4;
  _529 = (sizetype) _528;
  _530 = _529 + 1;
  _531 = cur + _530;
  _532 = *_527;
  *_531 = _532;
  _533 = q * 3;
  _534 = (sizetype) _533;
  _535 = cur + _534;
  _536 = q * 4;
  _537 = (sizetype) _536;
  _538 = cur + _537;
  _539 = *_535;
  *_538 = _539;
  q = q + -1;
  goto <D.15659>;
  <D.12257>:
  <D.15653>:
  goto <D.15661>;
  <D.15648>:
  <D.15661>:
  j = j + 1;
  goto <D.15593>;
  <D.12247>:
  goto <D.15662>;
  <D.15592>:
  if (depth == 16) goto <D.15663>; else goto <D.15664>;
  <D.15663>:
  cur = a->out;
  cur16 = cur;
  i = 0;
  <D.15665>:
  _540 = x * y;
  out_n.392_541 = (unsigned int) out_n;
  _542 = _540 * out_n.392_541;
  if (i >= _542) goto <D.12259>; else goto <D.15666>;
  <D.15666>:
  _543 = *cur;
  _544 = (int) _543;
  _545 = _544 << 8;
  _546 = (signed short) _545;
  _547 = cur + 1;
  _548 = *_547;
  _549 = (signed short) _548;
  _550 = _546 | _549;
  _551 = (short unsigned int) _550;
  *cur16 = _551;
  i = i + 1;
  cur16 = cur16 + 2;
  cur = cur + 2;
  goto <D.15665>;
  <D.12259>:
  goto <D.15667>;
  <D.15664>:
  <D.15667>:
  <D.15662>:
  D.15502 = 1;
  goto <D.15668>;
  <D.15668>:
  return D.15502;
}



;; Function stbi__create_png_image (_ZL22stbi__create_png_imageP9stbi__pngPhjiiii, funcdef_no=904, decl_uid=12268, cgraph_uid=810, symbol_order=835)

stbi__create_png_image (struct stbi__png * a, stbi_uc * image_data, stbi__uint32 image_data_len, int out_n, int depth, int color, int interlaced)
{
  int D.15692;
  int D.15691;
  int out_x;
  int out_y;
  stbi__uint32 img_len;
  int y;
  int x;
  int j;
  int i;
  int yspc[7];
  int xspc[7];
  int yorig[7];
  int xorig[7];
  int p;
  stbi_uc * final;
  int out_bytes;
  int bytes;
  bool retval.394;
  int D.15675;
  int iftmp.393;

  if (depth == 16) goto <D.15670>; else goto <D.15671>;
  <D.15670>:
  iftmp.393 = 2;
  goto <D.15672>;
  <D.15671>:
  iftmp.393 = 1;
  <D.15672>:
  bytes = iftmp.393;
  out_bytes = out_n * bytes;
  if (interlaced == 0) goto <D.15673>; else goto <D.15674>;
  <D.15673>:
  _1 = a->s;
  _2 = _1->img_y;
  _3 = a->s;
  _4 = _3->img_x;
  D.15691 = stbi__create_png_image_raw (a, image_data, image_data_len, out_n, _4, _2, depth, color);
  D.15675 = D.15691;
  goto <D.15690>;
  <D.15674>:
  _5 = a->s;
  _6 = _5->img_y;
  _7 = (int) _6;
  _8 = a->s;
  _9 = _8->img_x;
  _10 = (int) _9;
  final = stbi__malloc_mad3 (_10, _7, out_bytes, 0);
  p = 0;
  <D.15676>:
  if (p > 6) goto <D.12285>; else goto <D.15677>;
  <D.15677>:
  xorig[0] = 0;
  xorig[1] = 4;
  xorig[2] = 0;
  xorig[3] = 2;
  xorig[4] = 0;
  xorig[5] = 1;
  xorig[6] = 0;
  yorig[0] = 0;
  yorig[1] = 0;
  yorig[2] = 4;
  yorig[3] = 0;
  yorig[4] = 2;
  yorig[5] = 0;
  yorig[6] = 1;
  xspc[0] = 8;
  xspc[1] = 8;
  xspc[2] = 4;
  xspc[3] = 4;
  xspc[4] = 2;
  xspc[5] = 2;
  xspc[6] = 1;
  yspc[0] = 8;
  yspc[1] = 8;
  yspc[2] = 8;
  yspc[3] = 4;
  yspc[4] = 4;
  yspc[5] = 2;
  yspc[6] = 2;
  _11 = a->s;
  _12 = _11->img_x;
  _13 = xorig[p];
  _14 = (unsigned int) _13;
  _15 = _12 - _14;
  _16 = xspc[p];
  _17 = (unsigned int) _16;
  _18 = _15 + _17;
  _19 = _18 + 4294967295;
  _20 = xspc[p];
  _21 = (unsigned int) _20;
  _22 = _19 / _21;
  x = (int) _22;
  _23 = a->s;
  _24 = _23->img_y;
  _25 = yorig[p];
  _26 = (unsigned int) _25;
  _27 = _24 - _26;
  _28 = yspc[p];
  _29 = (unsigned int) _28;
  _30 = _27 + _29;
  _31 = _30 + 4294967295;
  _32 = yspc[p];
  _33 = (unsigned int) _32;
  _34 = _31 / _33;
  y = (int) _34;
  if (x != 0) goto <D.15678>; else goto <D.15679>;
  <D.15678>:
  if (y != 0) goto <D.15680>; else goto <D.15681>;
  <D.15680>:
  _35 = a->s;
  _36 = _35->img_n;
  _37 = x * _36;
  _38 = depth * _37;
  _39 = _38 + 7;
  _40 = _39 >> 3;
  _41 = _40 + 1;
  _42 = y * _41;
  img_len = (stbi__uint32) _42;
  y.395_43 = (unsigned int) y;
  x.396_44 = (unsigned int) x;
  D.15692 = stbi__create_png_image_raw (a, image_data, image_data_len, out_n, x.396_44, y.395_43, depth, color);
  _45 = D.15692;
  retval.394 = _45 == 0;
  if (retval.394 != 0) goto <D.15683>; else goto <D.15684>;
  <D.15683>:
  free (final);
  D.15675 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15695>;
  <D.15684>:
  j = 0;
  <D.15685>:
  if (j >= y) goto <D.12287>; else goto <D.15686>;
  <D.15686>:
  i = 0;
  <D.15687>:
  if (i >= x) goto <D.12289>; else goto <D.15688>;
  <D.15688>:
  _46 = yspc[p];
  _47 = j * _46;
  _48 = yorig[p];
  out_y = _47 + _48;
  _49 = xspc[p];
  _50 = i * _49;
  _51 = xorig[p];
  out_x = _50 + _51;
  _52 = (long long unsigned int) out_bytes;
  _53 = a->out;
  _54 = j * x;
  _55 = i + _54;
  _56 = out_bytes * _55;
  _57 = (sizetype) _56;
  _58 = _53 + _57;
  _59 = a->s;
  _60 = _59->img_x;
  out_y.397_61 = (unsigned int) out_y;
  _62 = _60 * out_y.397_61;
  out_bytes.398_63 = (unsigned int) out_bytes;
  _64 = _62 * out_bytes.398_63;
  _65 = (sizetype) _64;
  _66 = out_x * out_bytes;
  _67 = (sizetype) _66;
  _68 = _65 + _67;
  _69 = final + _68;
  memcpy (_69, _58, _52);
  i = i + 1;
  goto <D.15687>;
  <D.12289>:
  j = j + 1;
  goto <D.15685>;
  <D.12287>:
  _70 = a->out;
  free (_70);
  _71 = (sizetype) img_len;
  image_data = image_data + _71;
  image_data_len = image_data_len - img_len;
  goto <D.15689>;
  <D.15681>:
  <D.15689>:
  <D.15679>:
  xorig = {CLOBBER};
  yorig = {CLOBBER};
  xspc = {CLOBBER};
  yspc = {CLOBBER};
  goto <D.15694>;
  <D.15695>:
  xorig = {CLOBBER};
  yorig = {CLOBBER};
  xspc = {CLOBBER};
  yspc = {CLOBBER};
  goto <D.15690>;
  <D.15694>:
  p = p + 1;
  goto <D.15676>;
  <D.12285>:
  a->out = final;
  D.15675 = 1;
  goto <D.15690>;
  <D.15690>:
  return D.15675;
  <D.15693>:
  xorig = {CLOBBER};
  yorig = {CLOBBER};
  xspc = {CLOBBER};
  yspc = {CLOBBER};
  resx 1
}



;; Function stbi__compute_transparency (_ZL26stbi__compute_transparencyP9stbi__pngPhi, funcdef_no=905, decl_uid=12294, cgraph_uid=811, symbol_order=836)

stbi__compute_transparency (struct stbi__png * z, stbi_uc * tc, int out_n)
{
  stbi_uc * p;
  stbi__uint32 pixel_count;
  stbi__uint32 i;
  struct stbi__context * s;
  int D.15720;
  stbi_uc iftmp.400;
  bool iftmp.399;

  s = z->s;
  _1 = s->img_x;
  _2 = s->img_y;
  pixel_count = _1 * _2;
  p = z->out;
  if (out_n == 2) goto <D.15697>; else goto <D.15700>;
  <D.15700>:
  if (out_n == 4) goto <D.15697>; else goto <D.15701>;
  <D.15701>:
  _assert ("out_n == 2 || out_n == 4", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 4804);
  if (0 != 0) goto <D.15697>; else goto <D.15698>;
  <D.15697>:
  iftmp.399 = 1;
  goto <D.15699>;
  <D.15698>:
  iftmp.399 = 0;
  <D.15699>:
  if (out_n == 2) goto <D.15702>; else goto <D.15703>;
  <D.15702>:
  i = 0;
  <D.15704>:
  if (i >= pixel_count) goto <D.12300>; else goto <D.15705>;
  <D.15705>:
  _3 = *p;
  _4 = *tc;
  if (_3 == _4) goto <D.15707>; else goto <D.15708>;
  <D.15707>:
  iftmp.400 = 0;
  goto <D.15709>;
  <D.15708>:
  iftmp.400 = 255;
  <D.15709>:
  _5 = p + 1;
  *_5 = iftmp.400;
  p = p + 2;
  i = i + 1;
  goto <D.15704>;
  <D.12300>:
  goto <D.15710>;
  <D.15703>:
  i = 0;
  <D.15711>:
  if (i >= pixel_count) goto <D.12302>; else goto <D.15712>;
  <D.15712>:
  _6 = *p;
  _7 = *tc;
  if (_6 == _7) goto <D.15713>; else goto <D.15714>;
  <D.15713>:
  _8 = p + 1;
  _9 = *_8;
  _10 = tc + 1;
  _11 = *_10;
  if (_9 == _11) goto <D.15715>; else goto <D.15716>;
  <D.15715>:
  _12 = p + 2;
  _13 = *_12;
  _14 = tc + 2;
  _15 = *_14;
  if (_13 == _15) goto <D.15717>; else goto <D.15718>;
  <D.15717>:
  _16 = p + 3;
  *_16 = 0;
  goto <D.15719>;
  <D.15718>:
  <D.15719>:
  <D.15716>:
  <D.15714>:
  p = p + 4;
  i = i + 1;
  goto <D.15711>;
  <D.12302>:
  <D.15710>:
  D.15720 = 1;
  goto <D.15721>;
  <D.15721>:
  return D.15720;
}



;; Function stbi__compute_transparency16 (_ZL28stbi__compute_transparency16P9stbi__pngPti, funcdef_no=906, decl_uid=12307, cgraph_uid=812, symbol_order=837)

stbi__compute_transparency16 (struct stbi__png * z, stbi__uint16 * tc, int out_n)
{
  stbi__uint16 * p;
  stbi__uint32 pixel_count;
  stbi__uint32 i;
  struct stbi__context * s;
  int D.15746;
  stbi__uint16 iftmp.402;
  bool iftmp.401;

  s = z->s;
  _1 = s->img_x;
  _2 = s->img_y;
  pixel_count = _1 * _2;
  p = z->out;
  if (out_n == 2) goto <D.15723>; else goto <D.15726>;
  <D.15726>:
  if (out_n == 4) goto <D.15723>; else goto <D.15727>;
  <D.15727>:
  _assert ("out_n == 2 || out_n == 4", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 4829);
  if (0 != 0) goto <D.15723>; else goto <D.15724>;
  <D.15723>:
  iftmp.401 = 1;
  goto <D.15725>;
  <D.15724>:
  iftmp.401 = 0;
  <D.15725>:
  if (out_n == 2) goto <D.15728>; else goto <D.15729>;
  <D.15728>:
  i = 0;
  <D.15730>:
  if (i >= pixel_count) goto <D.12313>; else goto <D.15731>;
  <D.15731>:
  _3 = *p;
  _4 = *tc;
  if (_3 == _4) goto <D.15733>; else goto <D.15734>;
  <D.15733>:
  iftmp.402 = 0;
  goto <D.15735>;
  <D.15734>:
  iftmp.402 = 65535;
  <D.15735>:
  _5 = p + 2;
  *_5 = iftmp.402;
  p = p + 4;
  i = i + 1;
  goto <D.15730>;
  <D.12313>:
  goto <D.15736>;
  <D.15729>:
  i = 0;
  <D.15737>:
  if (i >= pixel_count) goto <D.12315>; else goto <D.15738>;
  <D.15738>:
  _6 = *p;
  _7 = *tc;
  if (_6 == _7) goto <D.15739>; else goto <D.15740>;
  <D.15739>:
  _8 = p + 2;
  _9 = *_8;
  _10 = tc + 2;
  _11 = *_10;
  if (_9 == _11) goto <D.15741>; else goto <D.15742>;
  <D.15741>:
  _12 = p + 4;
  _13 = *_12;
  _14 = tc + 4;
  _15 = *_14;
  if (_13 == _15) goto <D.15743>; else goto <D.15744>;
  <D.15743>:
  _16 = p + 6;
  *_16 = 0;
  goto <D.15745>;
  <D.15744>:
  <D.15745>:
  <D.15742>:
  <D.15740>:
  p = p + 8;
  i = i + 1;
  goto <D.15737>;
  <D.12315>:
  <D.15736>:
  D.15746 = 1;
  goto <D.15747>;
  <D.15747>:
  return D.15746;
}



;; Function stbi__expand_png_palette (_ZL24stbi__expand_png_paletteP9stbi__pngPhii, funcdef_no=907, decl_uid=12321, cgraph_uid=813, symbol_order=838)

stbi__expand_png_palette (struct stbi__png * a, stbi_uc * palette, int len, int pal_img_n)
{
  int n;
  int n;
  stbi_uc * orig;
  stbi_uc * temp_out;
  stbi_uc * p;
  stbi__uint32 pixel_count;
  stbi__uint32 i;
  int D.15750;

  _1 = a->s;
  _2 = _1->img_x;
  _3 = a->s;
  _4 = _3->img_y;
  pixel_count = _2 * _4;
  orig = a->out;
  pixel_count.403_5 = (int) pixel_count;
  p = stbi__malloc_mad2 (pixel_count.403_5, pal_img_n, 0);
  if (p == 0B) goto <D.15748>; else goto <D.15749>;
  <D.15748>:
  D.15750 = stbi__err ("outofmem");
  goto <D.15758>;
  <D.15749>:
  temp_out = p;
  if (pal_img_n == 3) goto <D.15751>; else goto <D.15752>;
  <D.15751>:
  i = 0;
  <D.15753>:
  if (i >= pixel_count) goto <D.12330>; else goto <D.15754>;
  <D.15754>:
  _6 = (sizetype) i;
  _7 = orig + _6;
  _8 = *_7;
  _9 = (int) _8;
  n = _9 * 4;
  _10 = (sizetype) n;
  _11 = palette + _10;
  _12 = *_11;
  *p = _12;
  _13 = (sizetype) n;
  _14 = _13 + 1;
  _15 = palette + _14;
  _16 = p + 1;
  _17 = *_15;
  *_16 = _17;
  _18 = (sizetype) n;
  _19 = _18 + 2;
  _20 = palette + _19;
  _21 = p + 2;
  _22 = *_20;
  *_21 = _22;
  p = p + 3;
  i = i + 1;
  goto <D.15753>;
  <D.12330>:
  goto <D.15755>;
  <D.15752>:
  i = 0;
  <D.15756>:
  if (i >= pixel_count) goto <D.12332>; else goto <D.15757>;
  <D.15757>:
  _23 = (sizetype) i;
  _24 = orig + _23;
  _25 = *_24;
  _26 = (int) _25;
  n = _26 * 4;
  _27 = (sizetype) n;
  _28 = palette + _27;
  _29 = *_28;
  *p = _29;
  _30 = (sizetype) n;
  _31 = _30 + 1;
  _32 = palette + _31;
  _33 = p + 1;
  _34 = *_32;
  *_33 = _34;
  _35 = (sizetype) n;
  _36 = _35 + 2;
  _37 = palette + _36;
  _38 = p + 2;
  _39 = *_37;
  *_38 = _39;
  _40 = (sizetype) n;
  _41 = _40 + 3;
  _42 = palette + _41;
  _43 = p + 3;
  _44 = *_42;
  *_43 = _44;
  p = p + 4;
  i = i + 1;
  goto <D.15756>;
  <D.12332>:
  <D.15755>:
  _45 = a->out;
  free (_45);
  a->out = temp_out;
  D.15750 = 1;
  goto <D.15758>;
  <D.15758>:
  return D.15750;
}



;; Function stbi_set_unpremultiply_on_load (stbi_set_unpremultiply_on_load, funcdef_no=908, decl_uid=5108, cgraph_uid=814, symbol_order=841)

stbi_set_unpremultiply_on_load (int flag_true_if_should_unpremultiply)
{
  stbi__unpremultiply_on_load = flag_true_if_should_unpremultiply;
  return;
}



;; Function stbi_convert_iphone_png_to_rgb (stbi_convert_iphone_png_to_rgb, funcdef_no=909, decl_uid=5110, cgraph_uid=815, symbol_order=842)

stbi_convert_iphone_png_to_rgb (int flag_true_if_should_convert)
{
  stbi__de_iphone_flag = flag_true_if_should_convert;
  return;
}



;; Function stbi__de_iphone (_ZL15stbi__de_iphoneP9stbi__png, funcdef_no=910, decl_uid=12343, cgraph_uid=816, symbol_order=843)

stbi__de_iphone (struct stbi__png * z)
{
  stbi_uc t;
  stbi_uc half;
  stbi_uc t;
  stbi_uc a;
  stbi_uc t;
  stbi_uc * p;
  stbi__uint32 pixel_count;
  stbi__uint32 i;
  struct stbi__context * s;
  bool iftmp.404;

  s = z->s;
  _1 = s->img_x;
  _2 = s->img_y;
  pixel_count = _1 * _2;
  p = z->out;
  _3 = s->img_out_n;
  if (_3 == 3) goto <D.15759>; else goto <D.15760>;
  <D.15759>:
  i = 0;
  <D.15761>:
  if (i >= pixel_count) goto <D.12354>; else goto <D.15762>;
  <D.15762>:
  t = *p;
  _4 = MEM[(stbi_uc *)p + 2B];
  *p = _4;
  _5 = p + 2;
  *_5 = t;
  p = p + 3;
  i = i + 1;
  goto <D.15761>;
  <D.12354>:
  goto <D.15763>;
  <D.15760>:
  _6 = s->img_out_n;
  if (_6 == 4) goto <D.15765>; else goto <D.15768>;
  <D.15768>:
  _assert ("s->img_out_n == 4", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 4910);
  if (0 != 0) goto <D.15765>; else goto <D.15766>;
  <D.15765>:
  iftmp.404 = 1;
  goto <D.15767>;
  <D.15766>:
  iftmp.404 = 0;
  <D.15767>:
  stbi__unpremultiply_on_load.405_7 = stbi__unpremultiply_on_load;
  if (stbi__unpremultiply_on_load.405_7 != 0) goto <D.15769>; else goto <D.15770>;
  <D.15769>:
  i = 0;
  <D.15771>:
  if (i >= pixel_count) goto <D.12356>; else goto <D.15772>;
  <D.15772>:
  a = MEM[(stbi_uc *)p + 3B];
  t = *p;
  if (a != 0) goto <D.15773>; else goto <D.15774>;
  <D.15773>:
  half = a / 2;
  _8 = p + 2;
  _9 = *_8;
  _10 = (int) _9;
  _11 = _10 * 255;
  _12 = (int) half;
  _13 = _11 + _12;
  _14 = (int) a;
  _15 = _13 / _14;
  _16 = (unsigned char) _15;
  *p = _16;
  _17 = p + 1;
  _18 = *_17;
  _19 = (int) _18;
  _20 = _19 * 255;
  _21 = (int) half;
  _22 = _20 + _21;
  _23 = (int) a;
  _24 = _22 / _23;
  _25 = p + 1;
  _26 = (unsigned char) _24;
  *_25 = _26;
  _27 = (int) t;
  _28 = _27 * 255;
  _29 = (int) half;
  _30 = _28 + _29;
  _31 = (int) a;
  _32 = _30 / _31;
  _33 = p + 2;
  _34 = (unsigned char) _32;
  *_33 = _34;
  goto <D.15775>;
  <D.15774>:
  _35 = MEM[(stbi_uc *)p + 2B];
  *p = _35;
  _36 = p + 2;
  *_36 = t;
  <D.15775>:
  p = p + 4;
  i = i + 1;
  goto <D.15771>;
  <D.12356>:
  goto <D.15776>;
  <D.15770>:
  i = 0;
  <D.15777>:
  if (i >= pixel_count) goto <D.12358>; else goto <D.15778>;
  <D.15778>:
  t = *p;
  _37 = MEM[(stbi_uc *)p + 2B];
  *p = _37;
  _38 = p + 2;
  *_38 = t;
  p = p + 4;
  i = i + 1;
  goto <D.15777>;
  <D.12358>:
  <D.15776>:
  <D.15763>:
  return;
}



;; Function stbi__parse_png_file (_ZL20stbi__parse_png_fileP9stbi__pngii, funcdef_no=911, decl_uid=12363, cgraph_uid=817, symbol_order=845)

stbi__parse_png_file (struct stbi__png * z, int scan, int req_comp)
{
  int D.15965;
  int D.15964;
  int D.15963;
  char * D.15962;
  int D.15961;
  int D.15960;
  int D.15959;
  unsigned char D.15958;
  unsigned char D.15957;
  unsigned char D.15956;
  unsigned char D.15955;
  unsigned char D.15954;
  unsigned char D.15953;
  unsigned char D.15952;
  unsigned char D.15951;
  unsigned char D.15950;
  unsigned int D.15949;
  unsigned int D.15948;
  int D.15947;
  static char invalid_chunk[25] = "XXXX PNG chunk not known";
  stbi__uint32 bpl;
  stbi__uint32 raw_len;
  stbi_uc * p;
  stbi__uint32 idata_limit_old;
  int filter;
  int comp;
  struct stbi__pngchunk c;
  struct stbi__context * s;
  int is_iphone;
  int color;
  int interlace;
  int k;
  int first;
  stbi__uint32 pal_len;
  stbi__uint32 i;
  stbi__uint32 idata_limit;
  stbi__uint32 ioff;
  stbi__uint16 tc16[3];
  stbi_uc tc[3];
  stbi_uc has_trans;
  stbi_uc pal_img_n;
  stbi_uc palette[1024];
  bool retval.418;
  bool retval.416;
  bool retval.415;
  bool retval.413;
  bool retval.409;
  int iftmp.407;
  int D.15782;
  bool retval.406;

  pal_img_n = 0;
  has_trans = 0;
  tc = {};
  ioff = 0;
  idata_limit = 0;
  pal_len = 0;
  first = 1;
  interlace = 0;
  color = 0;
  is_iphone = 0;
  s = z->s;
  z->expanded = 0B;
  z->idata = 0B;
  z->out = 0B;
  D.15947 = stbi__check_png_header (s);
  _1 = D.15947;
  retval.406 = _1 == 0;
  if (retval.406 != 0) goto <D.15780>; else goto <D.15781>;
  <D.15780>:
  D.15782 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15972>;
  <D.15781>:
  if (scan == 1) goto <D.15783>; else goto <D.15784>;
  <D.15783>:
  D.15782 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15972>;
  <D.15784>:
  <D.15785>:
  c = stbi__get_chunk_header (s);
  _2 = c.type;
  switch (_2) <default: <D.12394>, case 1130840649: <D.12382>, case 1229209940: <D.12388>, case 1229278788: <D.12391>, case 1229472850: <D.12383>, case 1347179589: <D.12386>, case 1951551059: <D.12387>>
  <D.12382>:
  is_iphone = 1;
  _3 = c.length;
  _4 = (int) _3;
  stbi__skip (s, _4);
  goto <D.12398>;
  <D.12383>:
  if (first == 0) goto <D.15786>; else goto <D.15787>;
  <D.15786>:
  D.15782 = stbi__err ("multiple IHDR");
  goto <D.15970>;
  <D.15787>:
  first = 0;
  _5 = c.length;
  if (_5 != 13) goto <D.15788>; else goto <D.15789>;
  <D.15788>:
  D.15782 = stbi__err ("bad IHDR len");
  goto <D.15970>;
  <D.15789>:
  D.15948 = stbi__get32be (s);
  _6 = D.15948;
  s->img_x = _6;
  D.15949 = stbi__get32be (s);
  _7 = D.15949;
  s->img_y = _7;
  _8 = s->img_y;
  if (_8 > 16777216) goto <D.15790>; else goto <D.15791>;
  <D.15790>:
  D.15782 = stbi__err ("too large");
  goto <D.15970>;
  <D.15791>:
  _9 = s->img_x;
  if (_9 > 16777216) goto <D.15792>; else goto <D.15793>;
  <D.15792>:
  D.15782 = stbi__err ("too large");
  goto <D.15970>;
  <D.15793>:
  D.15950 = stbi__get8 (s);
  _10 = D.15950;
  _11 = (int) _10;
  z->depth = _11;
  _12 = z->depth;
  if (_12 != 1) goto <D.15794>; else goto <D.15795>;
  <D.15794>:
  _13 = z->depth;
  if (_13 != 2) goto <D.15796>; else goto <D.15797>;
  <D.15796>:
  _14 = z->depth;
  if (_14 != 4) goto <D.15798>; else goto <D.15799>;
  <D.15798>:
  _15 = z->depth;
  if (_15 != 8) goto <D.15800>; else goto <D.15801>;
  <D.15800>:
  _16 = z->depth;
  if (_16 != 16) goto <D.15802>; else goto <D.15803>;
  <D.15802>:
  D.15782 = stbi__err ("1/2/4/8/16-bit only");
  goto <D.15970>;
  <D.15803>:
  <D.15801>:
  <D.15799>:
  <D.15797>:
  <D.15795>:
  D.15951 = stbi__get8 (s);
  _17 = D.15951;
  color = (int) _17;
  if (color > 6) goto <D.15804>; else goto <D.15805>;
  <D.15804>:
  D.15782 = stbi__err ("bad ctype");
  goto <D.15970>;
  <D.15805>:
  if (color == 3) goto <D.15806>; else goto <D.15807>;
  <D.15806>:
  _18 = z->depth;
  if (_18 == 16) goto <D.15808>; else goto <D.15809>;
  <D.15808>:
  D.15782 = stbi__err ("bad ctype");
  goto <D.15970>;
  <D.15809>:
  <D.15807>:
  if (color == 3) goto <D.15810>; else goto <D.15811>;
  <D.15810>:
  pal_img_n = 3;
  goto <D.15812>;
  <D.15811>:
  _19 = color & 1;
  if (_19 != 0) goto <D.15813>; else goto <D.15814>;
  <D.15813>:
  D.15782 = stbi__err ("bad ctype");
  goto <D.15970>;
  <D.15814>:
  <D.15812>:
  D.15952 = stbi__get8 (s);
  _20 = D.15952;
  comp = (int) _20;
  if (comp != 0) goto <D.15815>; else goto <D.15816>;
  <D.15815>:
  D.15782 = stbi__err ("bad comp method");
  goto <D.15970>;
  <D.15816>:
  D.15953 = stbi__get8 (s);
  _21 = D.15953;
  filter = (int) _21;
  if (filter != 0) goto <D.15817>; else goto <D.15818>;
  <D.15817>:
  D.15782 = stbi__err ("bad filter method");
  goto <D.15970>;
  <D.15818>:
  D.15954 = stbi__get8 (s);
  _22 = D.15954;
  interlace = (int) _22;
  if (interlace > 1) goto <D.15819>; else goto <D.15820>;
  <D.15819>:
  D.15782 = stbi__err ("bad interlace method");
  goto <D.15970>;
  <D.15820>:
  _23 = s->img_x;
  if (_23 == 0) goto <D.15821>; else goto <D.15823>;
  <D.15823>:
  _24 = s->img_y;
  if (_24 == 0) goto <D.15821>; else goto <D.15822>;
  <D.15821>:
  D.15782 = stbi__err ("0-pixel image");
  goto <D.15970>;
  <D.15822>:
  if (pal_img_n == 0) goto <D.15824>; else goto <D.15825>;
  <D.15824>:
  _25 = color & 2;
  if (_25 != 0) goto <D.15827>; else goto <D.15828>;
  <D.15827>:
  iftmp.407 = 3;
  goto <D.15829>;
  <D.15828>:
  iftmp.407 = 1;
  <D.15829>:
  _26 = color >> 2;
  _27 = _26 & 1;
  _28 = iftmp.407 + _27;
  s->img_n = _28;
  _29 = s->img_x;
  _30 = 1073741824 / _29;
  _31 = s->img_n;
  _32 = (unsigned int) _31;
  _33 = _30 / _32;
  _34 = s->img_y;
  if (_33 < _34) goto <D.15830>; else goto <D.15831>;
  <D.15830>:
  D.15782 = stbi__err ("too large");
  goto <D.15970>;
  <D.15831>:
  if (scan == 2) goto <D.15832>; else goto <D.15833>;
  <D.15832>:
  D.15782 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15970>;
  <D.15833>:
  goto <D.15834>;
  <D.15825>:
  s->img_n = 1;
  _35 = s->img_x;
  _36 = 268435456 / _35;
  _37 = s->img_y;
  if (_36 < _37) goto <D.15835>; else goto <D.15836>;
  <D.15835>:
  D.15782 = stbi__err ("too large");
  goto <D.15970>;
  <D.15836>:
  <D.15834>:
  goto <D.12398>;
  <D.12386>:
  if (first != 0) goto <D.15837>; else goto <D.15838>;
  <D.15837>:
  D.15782 = stbi__err ("first not IHDR");
  goto <D.15970>;
  <D.15838>:
  _38 = c.length;
  if (_38 > 768) goto <D.15839>; else goto <D.15840>;
  <D.15839>:
  D.15782 = stbi__err ("invalid PLTE");
  goto <D.15970>;
  <D.15840>:
  _39 = c.length;
  pal_len = _39 / 3;
  _40 = pal_len * 3;
  _41 = c.length;
  if (_40 != _41) goto <D.15841>; else goto <D.15842>;
  <D.15841>:
  D.15782 = stbi__err ("invalid PLTE");
  goto <D.15970>;
  <D.15842>:
  i = 0;
  <D.15843>:
  if (i >= pal_len) goto <D.12399>; else goto <D.15844>;
  <D.15844>:
  _42 = i * 4;
  D.15955 = stbi__get8 (s);
  _43 = D.15955;
  palette[_42] = _43;
  _44 = i * 4;
  _45 = _44 + 1;
  D.15956 = stbi__get8 (s);
  _46 = D.15956;
  palette[_45] = _46;
  _47 = i * 4;
  _48 = _47 + 2;
  D.15957 = stbi__get8 (s);
  _49 = D.15957;
  palette[_48] = _49;
  _50 = i * 4;
  _51 = _50 + 3;
  palette[_51] = 255;
  i = i + 1;
  goto <D.15843>;
  <D.12399>:
  goto <D.12398>;
  <D.12387>:
  if (first != 0) goto <D.15845>; else goto <D.15846>;
  <D.15845>:
  D.15782 = stbi__err ("first not IHDR");
  goto <D.15970>;
  <D.15846>:
  _52 = z->idata;
  if (_52 != 0B) goto <D.15847>; else goto <D.15848>;
  <D.15847>:
  D.15782 = stbi__err ("tRNS after IDAT");
  goto <D.15970>;
  <D.15848>:
  if (pal_img_n != 0) goto <D.15849>; else goto <D.15850>;
  <D.15849>:
  if (scan == 2) goto <D.15851>; else goto <D.15852>;
  <D.15851>:
  s->img_n = 4;
  D.15782 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15970>;
  <D.15852>:
  if (pal_len == 0) goto <D.15853>; else goto <D.15854>;
  <D.15853>:
  D.15782 = stbi__err ("tRNS before PLTE");
  goto <D.15970>;
  <D.15854>:
  _53 = c.length;
  if (pal_len < _53) goto <D.15855>; else goto <D.15856>;
  <D.15855>:
  D.15782 = stbi__err ("bad tRNS len");
  goto <D.15970>;
  <D.15856>:
  pal_img_n = 4;
  i = 0;
  <D.15857>:
  _54 = c.length;
  if (i >= _54) goto <D.12401>; else goto <D.15858>;
  <D.15858>:
  _55 = i * 4;
  _56 = _55 + 3;
  D.15958 = stbi__get8 (s);
  _57 = D.15958;
  palette[_56] = _57;
  i = i + 1;
  goto <D.15857>;
  <D.12401>:
  goto <D.15859>;
  <D.15850>:
  _58 = s->img_n;
  _59 = _58 & 1;
  if (_59 == 0) goto <D.15860>; else goto <D.15861>;
  <D.15860>:
  D.15782 = stbi__err ("tRNS with alpha");
  goto <D.15970>;
  <D.15861>:
  _60 = c.length;
  _61 = s->img_n;
  _62 = (unsigned int) _61;
  _63 = _62 * 2;
  if (_60 != _63) goto <D.15862>; else goto <D.15863>;
  <D.15862>:
  D.15782 = stbi__err ("bad tRNS len");
  goto <D.15970>;
  <D.15863>:
  has_trans = 1;
  _64 = z->depth;
  if (_64 == 16) goto <D.15864>; else goto <D.15865>;
  <D.15864>:
  k = 0;
  <D.15866>:
  _65 = s->img_n;
  if (k >= _65) goto <D.12403>; else goto <D.15867>;
  <D.15867>:
  D.15959 = stbi__get16be (s);
  _66 = D.15959;
  _67 = (short unsigned int) _66;
  tc16[k] = _67;
  k = k + 1;
  goto <D.15866>;
  <D.12403>:
  goto <D.15868>;
  <D.15865>:
  k = 0;
  <D.15869>:
  _68 = s->img_n;
  if (k >= _68) goto <D.12405>; else goto <D.15870>;
  <D.15870>:
  D.15960 = stbi__get16be (s);
  _69 = D.15960;
  _70 = (unsigned char) _69;
  _71 = z->depth;
  _72 = stbi__depth_scale_table[_71];
  _73 = _70 * _72;
  tc[k] = _73;
  k = k + 1;
  goto <D.15869>;
  <D.12405>:
  <D.15868>:
  <D.15859>:
  goto <D.12398>;
  <D.12388>:
  if (first != 0) goto <D.15871>; else goto <D.15872>;
  <D.15871>:
  D.15782 = stbi__err ("first not IHDR");
  goto <D.15970>;
  <D.15872>:
  if (pal_img_n != 0) goto <D.15873>; else goto <D.15874>;
  <D.15873>:
  if (pal_len == 0) goto <D.15875>; else goto <D.15876>;
  <D.15875>:
  D.15782 = stbi__err ("no PLTE");
  goto <D.15970>;
  <D.15876>:
  <D.15874>:
  if (scan == 2) goto <D.15877>; else goto <D.15878>;
  <D.15877>:
  _74 = (int) pal_img_n;
  s->img_n = _74;
  D.15782 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15970>;
  <D.15878>:
  _75 = c.length;
  _76 = ioff + _75;
  _77 = (int) _76;
  ioff.408_78 = (int) ioff;
  if (_77 < ioff.408_78) goto <D.15879>; else goto <D.15880>;
  <D.15879>:
  D.15782 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15970>;
  <D.15880>:
  _79 = c.length;
  _80 = ioff + _79;
  if (idata_limit < _80) goto <D.15881>; else goto <D.15882>;
  <D.15881>:
  idata_limit_old = idata_limit;
  if (idata_limit == 0) goto <D.15883>; else goto <D.15884>;
  <D.15883>:
  _81 = c.length;
  idata_limit = MAX_EXPR <_81, 4096>;
  goto <D.15885>;
  <D.15884>:
  <D.15885>:
  <D.15886>:
  _82 = c.length;
  _83 = ioff + _82;
  if (idata_limit >= _83) goto <D.12407>; else goto <D.15887>;
  <D.15887>:
  idata_limit = idata_limit * 2;
  goto <D.15886>;
  <D.12407>:
  _84 = (long long unsigned int) idata_limit;
  _85 = z->idata;
  p = realloc (_85, _84);
  if (p == 0B) goto <D.15888>; else goto <D.15889>;
  <D.15888>:
  D.15782 = stbi__err ("outofmem");
  goto <D.15970>;
  <D.15889>:
  z->idata = p;
  goto <D.15890>;
  <D.15882>:
  <D.15890>:
  _86 = c.length;
  _87 = (int) _86;
  _88 = z->idata;
  _89 = (sizetype) ioff;
  _90 = _88 + _89;
  D.15961 = stbi__getn (s, _90, _87);
  _91 = D.15961;
  retval.409 = _91 == 0;
  if (retval.409 != 0) goto <D.15892>; else goto <D.15893>;
  <D.15892>:
  D.15782 = stbi__err ("outofdata");
  goto <D.15970>;
  <D.15893>:
  _92 = c.length;
  ioff = ioff + _92;
  goto <D.12398>;
  <D.12391>:
  if (first != 0) goto <D.15894>; else goto <D.15895>;
  <D.15894>:
  D.15782 = stbi__err ("first not IHDR");
  goto <D.15967>;
  <D.15895>:
  if (scan != 0) goto <D.15896>; else goto <D.15897>;
  <D.15896>:
  D.15782 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15967>;
  <D.15897>:
  _93 = z->idata;
  if (_93 == 0B) goto <D.15898>; else goto <D.15899>;
  <D.15898>:
  D.15782 = stbi__err ("no IDAT");
  goto <D.15967>;
  <D.15899>:
  _94 = s->img_x;
  _95 = z->depth;
  _96 = (unsigned int) _95;
  _97 = _94 * _96;
  _98 = _97 + 7;
  bpl = _98 / 8;
  _99 = s->img_y;
  _100 = bpl * _99;
  _101 = s->img_n;
  _102 = (unsigned int) _101;
  _103 = _100 * _102;
  _104 = s->img_y;
  _105 = _103 + _104;
  raw_len = _105;
  _106 = is_iphone == 0;
  _107 = (int) _106;
  raw_len.410_108 = raw_len;
  raw_len.411_109 = (int) raw_len.410_108;
  ioff.412_110 = (int) ioff;
  _111 = z->idata;
  D.15962 = stbi_zlib_decode_malloc_guesssize_headerflag (_111, ioff.412_110, raw_len.411_109, &raw_len, _107);
  _112 = D.15962;
  z->expanded = _112;
  _113 = z->expanded;
  if (_113 == 0B) goto <D.15900>; else goto <D.15901>;
  <D.15900>:
  D.15782 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15967>;
  <D.15901>:
  _114 = z->idata;
  free (_114);
  z->idata = 0B;
  _115 = s->img_n;
  _116 = _115 + 1;
  if (req_comp == _116) goto <D.15906>; else goto <D.15902>;
  <D.15906>:
  if (req_comp != 3) goto <D.15907>; else goto <D.15902>;
  <D.15907>:
  if (pal_img_n == 0) goto <D.15903>; else goto <D.15902>;
  <D.15902>:
  if (has_trans != 0) goto <D.15903>; else goto <D.15904>;
  <D.15903>:
  _117 = s->img_n;
  _118 = _117 + 1;
  s->img_out_n = _118;
  goto <D.15905>;
  <D.15904>:
  _119 = s->img_n;
  s->img_out_n = _119;
  <D.15905>:
  _120 = z->depth;
  _121 = s->img_out_n;
  raw_len.414_122 = raw_len;
  _123 = z->expanded;
  D.15963 = stbi__create_png_image (z, _123, raw_len.414_122, _121, _120, color, interlace);
  _124 = D.15963;
  retval.413 = _124 == 0;
  if (retval.413 != 0) goto <D.15909>; else goto <D.15910>;
  <D.15909>:
  D.15782 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15967>;
  <D.15910>:
  if (has_trans != 0) goto <D.15911>; else goto <D.15912>;
  <D.15911>:
  _125 = z->depth;
  if (_125 == 16) goto <D.15913>; else goto <D.15914>;
  <D.15913>:
  _126 = s->img_out_n;
  D.15964 = stbi__compute_transparency16 (z, &tc16, _126);
  _127 = D.15964;
  retval.415 = _127 == 0;
  if (retval.415 != 0) goto <D.15916>; else goto <D.15917>;
  <D.15916>:
  D.15782 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15967>;
  <D.15917>:
  goto <D.15918>;
  <D.15914>:
  _128 = s->img_out_n;
  D.15965 = stbi__compute_transparency (z, &tc, _128);
  _129 = D.15965;
  retval.416 = _129 == 0;
  if (retval.416 != 0) goto <D.15920>; else goto <D.15921>;
  <D.15920>:
  D.15782 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15967>;
  <D.15921>:
  <D.15918>:
  goto <D.15922>;
  <D.15912>:
  <D.15922>:
  if (is_iphone != 0) goto <D.15923>; else goto <D.15924>;
  <D.15923>:
  stbi__de_iphone_flag.417_130 = stbi__de_iphone_flag;
  if (stbi__de_iphone_flag.417_130 != 0) goto <D.15925>; else goto <D.15926>;
  <D.15925>:
  _131 = s->img_out_n;
  if (_131 > 2) goto <D.15927>; else goto <D.15928>;
  <D.15927>:
  stbi__de_iphone (z);
  goto <D.15929>;
  <D.15928>:
  <D.15929>:
  <D.15926>:
  <D.15924>:
  if (pal_img_n != 0) goto <D.15930>; else goto <D.15931>;
  <D.15930>:
  _132 = (int) pal_img_n;
  s->img_n = _132;
  _133 = (int) pal_img_n;
  s->img_out_n = _133;
  if (req_comp > 2) goto <D.15932>; else goto <D.15933>;
  <D.15932>:
  s->img_out_n = req_comp;
  goto <D.15934>;
  <D.15933>:
  <D.15934>:
  _134 = s->img_out_n;
  pal_len.419_135 = (int) pal_len;
  _136 = stbi__expand_png_palette (z, &palette, pal_len.419_135, _134);
  retval.418 = _136 == 0;
  if (retval.418 != 0) goto <D.15936>; else goto <D.15937>;
  <D.15936>:
  D.15782 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.15967>;
  <D.15937>:
  goto <D.15938>;
  <D.15931>:
  if (has_trans != 0) goto <D.15939>; else goto <D.15940>;
  <D.15939>:
  _137 = s->img_n;
  _138 = _137 + 1;
  s->img_n = _138;
  goto <D.15941>;
  <D.15940>:
  <D.15941>:
  <D.15938>:
  _139 = z->expanded;
  free (_139);
  z->expanded = 0B;
  stbi__get32be (s);
  D.15782 = 1;
  goto <D.15967>;
  <D.15967>:
  raw_len = {CLOBBER};
  goto <D.15970>;
  <D.12394>:
  if (first != 0) goto <D.15942>; else goto <D.15943>;
  <D.15942>:
  D.15782 = stbi__err ("first not IHDR");
  goto <D.15970>;
  <D.15943>:
  _140 = c.type;
  _141 = _140 & 536870912;
  if (_141 == 0) goto <D.15944>; else goto <D.15945>;
  <D.15944>:
  _142 = c.type;
  _143 = _142 >> 24;
  _144 = (char) _143;
  invalid_chunk[0] = _144;
  _145 = c.type;
  _146 = _145 >> 16;
  _147 = (char) _146;
  invalid_chunk[1] = _147;
  _148 = c.type;
  _149 = _148 >> 8;
  _150 = (char) _149;
  invalid_chunk[2] = _150;
  _151 = c.type;
  _152 = (char) _151;
  invalid_chunk[3] = _152;
  D.15782 = stbi__err (&invalid_chunk);
  goto <D.15970>;
  <D.15945>:
  _153 = c.length;
  _154 = (int) _153;
  stbi__skip (s, _154);
  goto <D.12398>;
  <D.12398>:
  stbi__get32be (s);
  c = {CLOBBER};
  goto <D.15969>;
  <D.15970>:
  c = {CLOBBER};
  goto <D.15972>;
  <D.15969>:
  goto <D.15785>;
  <D.15972>:
  palette = {CLOBBER};
  tc = {CLOBBER};
  tc16 = {CLOBBER};
  goto <D.15946>;
  <D.15946>:
  return D.15782;
  <D.15966>:
  raw_len = {CLOBBER};
  resx 3
  <D.15968>:
  c = {CLOBBER};
  resx 2
  <D.15971>:
  palette = {CLOBBER};
  tc = {CLOBBER};
  tc16 = {CLOBBER};
  resx 1
}



;; Function stbi__do_png (_ZL12stbi__do_pngP9stbi__pngPiS1_S1_iP17stbi__result_info, funcdef_no=912, decl_uid=12415, cgraph_uid=818, symbol_order=846)

stbi__do_png (struct stbi__png * p, int * x, int * y, int * n, int req_comp, struct stbi__result_info * ri)
{
  void * D.16003;
  void * D.16002;
  int D.16001;
  void * result;
  bool retval.420;
  void * D.15976;

  result = 0B;
  if (req_comp < 0) goto <D.15973>; else goto <D.15975>;
  <D.15975>:
  if (req_comp > 4) goto <D.15973>; else goto <D.15974>;
  <D.15973>:
  stbi__err ("bad req_comp");
  D.15976 = 0B;
  goto <D.16000>;
  <D.15974>:
  D.16001 = stbi__parse_png_file (p, 0, req_comp);
  _1 = D.16001;
  retval.420 = _1 != 0;
  if (retval.420 != 0) goto <D.15978>; else goto <D.15979>;
  <D.15978>:
  _2 = p->depth;
  if (_2 <= 8) goto <D.15980>; else goto <D.15981>;
  <D.15980>:
  ri->bits_per_channel = 8;
  goto <D.15982>;
  <D.15981>:
  _3 = p->depth;
  if (_3 == 16) goto <D.15983>; else goto <D.15984>;
  <D.15983>:
  ri->bits_per_channel = 16;
  goto <D.15985>;
  <D.15984>:
  stbi__err ("bad bits_per_channel");
  D.15976 = 0B;
  goto <D.16000>;
  <D.15985>:
  <D.15982>:
  result = p->out;
  p->out = 0B;
  if (req_comp != 0) goto <D.15986>; else goto <D.15987>;
  <D.15986>:
  _4 = p->s;
  _5 = _4->img_out_n;
  if (req_comp != _5) goto <D.15988>; else goto <D.15989>;
  <D.15988>:
  _6 = ri->bits_per_channel;
  if (_6 == 8) goto <D.15990>; else goto <D.15991>;
  <D.15990>:
  _7 = p->s;
  _8 = _7->img_y;
  _9 = p->s;
  _10 = _9->img_x;
  _11 = p->s;
  _12 = _11->img_out_n;
  D.16002 = stbi__convert_format (result, _12, req_comp, _10, _8);
  result = D.16002;
  goto <D.15992>;
  <D.15991>:
  _13 = p->s;
  _14 = _13->img_y;
  _15 = p->s;
  _16 = _15->img_x;
  _17 = p->s;
  _18 = _17->img_out_n;
  D.16003 = stbi__convert_format16 (result, _18, req_comp, _16, _14);
  result = D.16003;
  <D.15992>:
  _19 = p->s;
  _19->img_out_n = req_comp;
  if (result == 0B) goto <D.15993>; else goto <D.15994>;
  <D.15993>:
  D.15976 = result;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16000>;
  <D.15994>:
  goto <D.15995>;
  <D.15989>:
  <D.15995>:
  <D.15987>:
  _20 = p->s;
  _21 = _20->img_x;
  _22 = (int) _21;
  *x = _22;
  _23 = p->s;
  _24 = _23->img_y;
  _25 = (int) _24;
  *y = _25;
  if (n != 0B) goto <D.15996>; else goto <D.15997>;
  <D.15996>:
  _26 = p->s;
  _27 = _26->img_n;
  *n = _27;
  goto <D.15998>;
  <D.15997>:
  <D.15998>:
  goto <D.15999>;
  <D.15979>:
  <D.15999>:
  _28 = p->out;
  free (_28);
  p->out = 0B;
  _29 = p->expanded;
  free (_29);
  p->expanded = 0B;
  _30 = p->idata;
  free (_30);
  p->idata = 0B;
  D.15976 = result;
  goto <D.16000>;
  <D.16000>:
  return D.15976;
}



;; Function stbi__png_load (_ZL14stbi__png_loadP13stbi__contextPiS1_S1_iP17stbi__result_info, funcdef_no=913, decl_uid=10135, cgraph_uid=819, symbol_order=847)

stbi__png_load (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri)
{
  void * D.16006;
  struct stbi__png p;
  void * D.16004;

  p.s = s;
  D.16006 = stbi__do_png (&p, x, y, comp, req_comp, ri);
  D.16004 = D.16006;
  goto <D.16008>;
  <D.16008>:
  p = {CLOBBER};
  goto <D.16005>;
  <D.16005>:
  return D.16004;
  <D.16007>:
  p = {CLOBBER};
  resx 1
}



;; Function stbi__png_test (_ZL14stbi__png_testP13stbi__context, funcdef_no=914, decl_uid=10128, cgraph_uid=820, symbol_order=848)

stbi__png_test (struct stbi__context * s)
{
  int D.16011;
  int r;
  int D.16009;

  D.16011 = stbi__check_png_header (s);
  r = D.16011;
  stbi__rewind (s);
  D.16009 = r;
  goto <D.16010>;
  <D.16010>:
  return D.16009;
}



;; Function stbi__png_info_raw (_ZL18stbi__png_info_rawP9stbi__pngPiS1_S1_, funcdef_no=915, decl_uid=12468, cgraph_uid=821, symbol_order=849)

stbi__png_info_raw (struct stbi__png * p, int * x, int * y, int * comp)
{
  int D.16026;
  int D.16015;
  bool retval.421;

  D.16026 = stbi__parse_png_file (p, 2, 0);
  _1 = D.16026;
  retval.421 = _1 == 0;
  if (retval.421 != 0) goto <D.16013>; else goto <D.16014>;
  <D.16013>:
  _2 = p->s;
  stbi__rewind (_2);
  D.16015 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16025>;
  <D.16014>:
  if (x != 0B) goto <D.16016>; else goto <D.16017>;
  <D.16016>:
  _3 = p->s;
  _4 = _3->img_x;
  _5 = (int) _4;
  *x = _5;
  goto <D.16018>;
  <D.16017>:
  <D.16018>:
  if (y != 0B) goto <D.16019>; else goto <D.16020>;
  <D.16019>:
  _6 = p->s;
  _7 = _6->img_y;
  _8 = (int) _7;
  *y = _8;
  goto <D.16021>;
  <D.16020>:
  <D.16021>:
  if (comp != 0B) goto <D.16022>; else goto <D.16023>;
  <D.16022>:
  _9 = p->s;
  _10 = _9->img_n;
  *comp = _10;
  goto <D.16024>;
  <D.16023>:
  <D.16024>:
  D.16015 = 1;
  goto <D.16025>;
  <D.16025>:
  return D.16015;
}



;; Function stbi__png_info (_ZL14stbi__png_infoP13stbi__contextPiS1_S1_, funcdef_no=916, decl_uid=10140, cgraph_uid=822, symbol_order=850)

stbi__png_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  int D.16029;
  struct stbi__png p;
  int D.16027;

  p.s = s;
  D.16029 = stbi__png_info_raw (&p, x, y, comp);
  D.16027 = D.16029;
  goto <D.16031>;
  <D.16031>:
  p = {CLOBBER};
  goto <D.16028>;
  <D.16028>:
  return D.16027;
  <D.16030>:
  p = {CLOBBER};
  resx 1
}



;; Function stbi__png_is16 (_ZL14stbi__png_is16P13stbi__context, funcdef_no=917, decl_uid=10142, cgraph_uid=823, symbol_order=851)

stbi__png_is16 (struct stbi__context * s)
{
  int D.16039;
  struct stbi__png p;
  int D.16035;
  bool retval.422;

  p.s = s;
  D.16039 = stbi__png_info_raw (&p, 0B, 0B, 0B);
  _1 = D.16039;
  retval.422 = _1 == 0;
  if (retval.422 != 0) goto <D.16033>; else goto <D.16034>;
  <D.16033>:
  D.16035 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16041>;
  <D.16034>:
  _2 = p.depth;
  if (_2 != 16) goto <D.16036>; else goto <D.16037>;
  <D.16036>:
  _3 = p.s;
  stbi__rewind (_3);
  D.16035 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16041>;
  <D.16037>:
  D.16035 = 1;
  goto <D.16041>;
  <D.16041>:
  p = {CLOBBER};
  goto <D.16038>;
  <D.16038>:
  return D.16035;
  <D.16040>:
  p = {CLOBBER};
  resx 1
}



;; Function stbi__bmp_test_raw (_ZL18stbi__bmp_test_rawP13stbi__context, funcdef_no=918, decl_uid=12482, cgraph_uid=824, symbol_order=852)

stbi__bmp_test_raw (struct stbi__context * s)
{
  unsigned int D.16060;
  unsigned char D.16059;
  unsigned char D.16058;
  int sz;
  int r;
  bool iftmp.425;
  bool retval.424;
  int D.16045;
  bool retval.423;

  D.16058 = stbi__get8 (s);
  _1 = D.16058;
  retval.423 = _1 != 66;
  if (retval.423 != 0) goto <D.16043>; else goto <D.16044>;
  <D.16043>:
  D.16045 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16057>;
  <D.16044>:
  D.16059 = stbi__get8 (s);
  _2 = D.16059;
  retval.424 = _2 != 77;
  if (retval.424 != 0) goto <D.16047>; else goto <D.16048>;
  <D.16047>:
  D.16045 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16057>;
  <D.16048>:
  stbi__get32le (s);
  stbi__get16le (s);
  stbi__get16le (s);
  stbi__get32le (s);
  D.16060 = stbi__get32le (s);
  _3 = D.16060;
  sz = (int) _3;
  if (sz == 12) goto <D.16050>; else goto <D.16053>;
  <D.16053>:
  if (sz == 40) goto <D.16050>; else goto <D.16054>;
  <D.16054>:
  if (sz == 56) goto <D.16050>; else goto <D.16055>;
  <D.16055>:
  if (sz == 108) goto <D.16050>; else goto <D.16056>;
  <D.16056>:
  if (sz == 124) goto <D.16050>; else goto <D.16051>;
  <D.16050>:
  iftmp.425 = 1;
  goto <D.16052>;
  <D.16051>:
  iftmp.425 = 0;
  <D.16052>:
  r = (int) iftmp.425;
  D.16045 = r;
  goto <D.16057>;
  <D.16057>:
  return D.16045;
}



;; Function stbi__bmp_test (_ZL14stbi__bmp_testP13stbi__context, funcdef_no=919, decl_uid=10144, cgraph_uid=825, symbol_order=853)

stbi__bmp_test (struct stbi__context * s)
{
  int D.16063;
  int r;
  int D.16061;

  D.16063 = stbi__bmp_test_raw (s);
  r = D.16063;
  stbi__rewind (s);
  D.16061 = r;
  goto <D.16062>;
  <D.16062>:
  return D.16061;
}



;; Function stbi__high_bit (_ZL14stbi__high_bitj, funcdef_no=920, decl_uid=12491, cgraph_uid=826, symbol_order=854)

stbi__high_bit (unsigned int z)
{
  int n;
  int D.16066;

  n = 0;
  if (z == 0) goto <D.16064>; else goto <D.16065>;
  <D.16064>:
  D.16066 = -1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16082>;
  <D.16065>:
  if (z > 65535) goto <D.16067>; else goto <D.16068>;
  <D.16067>:
  n = n + 16;
  z = z >> 16;
  goto <D.16069>;
  <D.16068>:
  <D.16069>:
  if (z > 255) goto <D.16070>; else goto <D.16071>;
  <D.16070>:
  n = n + 8;
  z = z >> 8;
  goto <D.16072>;
  <D.16071>:
  <D.16072>:
  if (z > 15) goto <D.16073>; else goto <D.16074>;
  <D.16073>:
  n = n + 4;
  z = z >> 4;
  goto <D.16075>;
  <D.16074>:
  <D.16075>:
  if (z > 3) goto <D.16076>; else goto <D.16077>;
  <D.16076>:
  n = n + 2;
  z = z >> 2;
  goto <D.16078>;
  <D.16077>:
  <D.16078>:
  if (z > 1) goto <D.16079>; else goto <D.16080>;
  <D.16079>:
  n = n + 1;
  goto <D.16081>;
  <D.16080>:
  <D.16081>:
  D.16066 = n;
  goto <D.16082>;
  <D.16082>:
  return D.16066;
}



;; Function stbi__bitcount (_ZL14stbi__bitcountj, funcdef_no=921, decl_uid=12495, cgraph_uid=827, symbol_order=855)

stbi__bitcount (unsigned int a)
{
  int D.16083;

  _1 = a & 1431655765;
  _2 = a >> 1;
  _3 = _2 & 1431655765;
  a = _1 + _3;
  _4 = a & 858993459;
  _5 = a >> 2;
  _6 = _5 & 858993459;
  a = _4 + _6;
  _7 = a >> 4;
  _8 = a + _7;
  a = _8 & 252645135;
  _9 = a >> 8;
  a = a + _9;
  _10 = a >> 16;
  a = a + _10;
  a.426_11 = (int) a;
  D.16083 = a.426_11 & 255;
  goto <D.16084>;
  <D.16084>:
  return D.16083;
}



;; Function stbi__shiftsigned (_ZL17stbi__shiftsignedjii, funcdef_no=922, decl_uid=12500, cgraph_uid=828, symbol_order=858)

stbi__shiftsigned (unsigned int v, int shift, int bits)
{
  static unsigned int shift_table[9] = {0, 0, 0, 1, 0, 2, 4, 6, 0};
  static unsigned int mul_table[9] = {0, 255, 85, 73, 17, 33, 65, 129, 1};
  int D.16099;
  bool iftmp.428;
  bool iftmp.427;

  if (shift < 0) goto <D.16085>; else goto <D.16086>;
  <D.16085>:
  _1 = -shift;
  v = v << _1;
  goto <D.16087>;
  <D.16086>:
  v = v >> shift;
  <D.16087>:
  if (v <= 255) goto <D.16089>; else goto <D.16092>;
  <D.16092>:
  _assert ("v < 256", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 5263);
  if (0 != 0) goto <D.16089>; else goto <D.16090>;
  <D.16089>:
  iftmp.427 = 1;
  goto <D.16091>;
  <D.16090>:
  iftmp.427 = 0;
  <D.16091>:
  _2 = 8 - bits;
  v = v >> _2;
  if (bits >= 0) goto <D.16098>; else goto <D.16094>;
  <D.16098>:
  if (bits <= 8) goto <D.16095>; else goto <D.16094>;
  <D.16094>:
  _assert ("bits >= 0 && bits <= 8", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 5265);
  if (0 != 0) goto <D.16095>; else goto <D.16096>;
  <D.16095>:
  iftmp.428 = 1;
  goto <D.16097>;
  <D.16096>:
  iftmp.428 = 0;
  <D.16097>:
  _3 = mul_table[bits];
  _4 = v * _3;
  _5 = (int) _4;
  _6 = shift_table[bits];
  D.16099 = _5 >> _6;
  goto <D.16100>;
  <D.16100>:
  return D.16099;
}



;; Function stbi__bmp_parse_header (_ZL22stbi__bmp_parse_headerP13stbi__contextP14stbi__bmp_data, funcdef_no=923, decl_uid=12518, cgraph_uid=829, symbol_order=859)

stbi__bmp_parse_header (struct stbi__context * s, struct stbi__bmp_data * info)
{
  unsigned int D.16184;
  unsigned int D.16183;
  unsigned int D.16182;
  unsigned int D.16181;
  unsigned int D.16180;
  unsigned int D.16179;
  unsigned int D.16178;
  unsigned int D.16177;
  int D.16176;
  int D.16175;
  unsigned int D.16174;
  unsigned int D.16173;
  int D.16172;
  int D.16171;
  unsigned int D.16170;
  unsigned int D.16169;
  unsigned char D.16168;
  unsigned char D.16167;
  int i;
  int compress;
  int hsz;
  bool retval.431;
  void * D.16109;
  bool iftmp.430;
  bool retval.429;

  D.16167 = stbi__get8 (s);
  _1 = D.16167;
  if (_1 != 66) goto <D.16103>; else goto <D.16106>;
  <D.16106>:
  D.16168 = stbi__get8 (s);
  _2 = D.16168;
  if (_2 != 77) goto <D.16103>; else goto <D.16104>;
  <D.16103>:
  iftmp.430 = 1;
  goto <D.16105>;
  <D.16104>:
  iftmp.430 = 0;
  <D.16105>:
  retval.429 = iftmp.430;
  if (retval.429 != 0) goto <D.16107>; else goto <D.16108>;
  <D.16107>:
  stbi__err ("not BMP");
  D.16109 = 0B;
  goto <D.16166>;
  <D.16108>:
  stbi__get32le (s);
  stbi__get16le (s);
  stbi__get16le (s);
  D.16169 = stbi__get32le (s);
  _3 = D.16169;
  _4 = (int) _3;
  info->offset = _4;
  D.16170 = stbi__get32le (s);
  _5 = D.16170;
  hsz = (int) _5;
  info->hsz = hsz;
  info->ma = 0;
  _6 = info->ma;
  info->mb = _6;
  _7 = info->mb;
  info->mg = _7;
  _8 = info->mg;
  info->mr = _8;
  info->extra_read = 14;
  _9 = info->offset;
  if (_9 < 0) goto <D.16110>; else goto <D.16111>;
  <D.16110>:
  stbi__err ("bad BMP");
  D.16109 = 0B;
  goto <D.16166>;
  <D.16111>:
  if (hsz != 12) goto <D.16112>; else goto <D.16113>;
  <D.16112>:
  if (hsz != 40) goto <D.16114>; else goto <D.16115>;
  <D.16114>:
  if (hsz != 56) goto <D.16116>; else goto <D.16117>;
  <D.16116>:
  if (hsz != 108) goto <D.16118>; else goto <D.16119>;
  <D.16118>:
  if (hsz != 124) goto <D.16120>; else goto <D.16121>;
  <D.16120>:
  stbi__err ("unknown BMP");
  D.16109 = 0B;
  goto <D.16166>;
  <D.16121>:
  <D.16119>:
  <D.16117>:
  <D.16115>:
  <D.16113>:
  if (hsz == 12) goto <D.16122>; else goto <D.16123>;
  <D.16122>:
  D.16171 = stbi__get16le (s);
  _10 = D.16171;
  _11 = (unsigned int) _10;
  s->img_x = _11;
  D.16172 = stbi__get16le (s);
  _12 = D.16172;
  _13 = (unsigned int) _12;
  s->img_y = _13;
  goto <D.16124>;
  <D.16123>:
  D.16173 = stbi__get32le (s);
  _14 = D.16173;
  s->img_x = _14;
  D.16174 = stbi__get32le (s);
  _15 = D.16174;
  s->img_y = _15;
  <D.16124>:
  D.16175 = stbi__get16le (s);
  _16 = D.16175;
  retval.431 = _16 != 1;
  if (retval.431 != 0) goto <D.16126>; else goto <D.16127>;
  <D.16126>:
  stbi__err ("bad BMP");
  D.16109 = 0B;
  goto <D.16166>;
  <D.16127>:
  D.16176 = stbi__get16le (s);
  _17 = D.16176;
  info->bpp = _17;
  if (hsz != 12) goto <D.16128>; else goto <D.16129>;
  <D.16128>:
  D.16177 = stbi__get32le (s);
  _18 = D.16177;
  compress = (int) _18;
  if (compress == 1) goto <D.16130>; else goto <D.16132>;
  <D.16132>:
  if (compress == 2) goto <D.16130>; else goto <D.16131>;
  <D.16130>:
  stbi__err ("BMP RLE");
  D.16109 = 0B;
  goto <D.16166>;
  <D.16131>:
  stbi__get32le (s);
  stbi__get32le (s);
  stbi__get32le (s);
  stbi__get32le (s);
  stbi__get32le (s);
  if (hsz == 40) goto <D.16133>; else goto <D.16136>;
  <D.16136>:
  if (hsz == 56) goto <D.16133>; else goto <D.16134>;
  <D.16133>:
  if (hsz == 56) goto <D.16137>; else goto <D.16138>;
  <D.16137>:
  stbi__get32le (s);
  stbi__get32le (s);
  stbi__get32le (s);
  stbi__get32le (s);
  goto <D.16139>;
  <D.16138>:
  <D.16139>:
  _19 = info->bpp;
  if (_19 == 16) goto <D.16140>; else goto <D.16142>;
  <D.16142>:
  _20 = info->bpp;
  if (_20 == 32) goto <D.16140>; else goto <D.16141>;
  <D.16140>:
  if (compress == 0) goto <D.16143>; else goto <D.16144>;
  <D.16143>:
  _21 = info->bpp;
  if (_21 == 32) goto <D.16145>; else goto <D.16146>;
  <D.16145>:
  info->mr = 16711680;
  info->mg = 65280;
  info->mb = 255;
  info->ma = 4278190080;
  info->all_a = 0;
  goto <D.16147>;
  <D.16146>:
  info->mr = 31744;
  info->mg = 992;
  info->mb = 31;
  <D.16147>:
  goto <D.16148>;
  <D.16144>:
  if (compress == 3) goto <D.16149>; else goto <D.16150>;
  <D.16149>:
  D.16178 = stbi__get32le (s);
  _22 = D.16178;
  info->mr = _22;
  D.16179 = stbi__get32le (s);
  _23 = D.16179;
  info->mg = _23;
  D.16180 = stbi__get32le (s);
  _24 = D.16180;
  info->mb = _24;
  _25 = info->extra_read;
  _26 = _25 + 12;
  info->extra_read = _26;
  _27 = info->mr;
  _28 = info->mg;
  if (_27 == _28) goto <D.16151>; else goto <D.16152>;
  <D.16151>:
  _29 = info->mg;
  _30 = info->mb;
  if (_29 == _30) goto <D.16153>; else goto <D.16154>;
  <D.16153>:
  stbi__err ("bad BMP");
  D.16109 = 0B;
  goto <D.16166>;
  <D.16154>:
  <D.16152>:
  goto <D.16155>;
  <D.16150>:
  stbi__err ("bad BMP");
  D.16109 = 0B;
  goto <D.16166>;
  <D.16155>:
  <D.16148>:
  <D.16141>:
  goto <D.16135>;
  <D.16134>:
  if (hsz != 108) goto <D.16156>; else goto <D.16157>;
  <D.16156>:
  if (hsz != 124) goto <D.16158>; else goto <D.16159>;
  <D.16158>:
  stbi__err ("bad BMP");
  D.16109 = 0B;
  goto <D.16166>;
  <D.16159>:
  <D.16157>:
  D.16181 = stbi__get32le (s);
  _31 = D.16181;
  info->mr = _31;
  D.16182 = stbi__get32le (s);
  _32 = D.16182;
  info->mg = _32;
  D.16183 = stbi__get32le (s);
  _33 = D.16183;
  info->mb = _33;
  D.16184 = stbi__get32le (s);
  _34 = D.16184;
  info->ma = _34;
  stbi__get32le (s);
  i = 0;
  <D.16160>:
  if (i > 11) goto <D.12523>; else goto <D.16161>;
  <D.16161>:
  stbi__get32le (s);
  i = i + 1;
  goto <D.16160>;
  <D.12523>:
  if (hsz == 124) goto <D.16162>; else goto <D.16163>;
  <D.16162>:
  stbi__get32le (s);
  stbi__get32le (s);
  stbi__get32le (s);
  stbi__get32le (s);
  goto <D.16164>;
  <D.16163>:
  <D.16164>:
  <D.16135>:
  goto <D.16165>;
  <D.16129>:
  <D.16165>:
  D.16109 = 1B;
  goto <D.16166>;
  <D.16166>:
  return D.16109;
}



;; Function stbi__bmp_load (_ZL14stbi__bmp_loadP13stbi__contextPiS1_S1_iP17stbi__result_info, funcdef_no=924, decl_uid=10151, cgraph_uid=830, symbol_order=860)

stbi__bmp_load (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri)
{
  stbi_uc * D.16392;
  int D.16390;
  int D.16389;
  int D.16388;
  int D.16387;
  stbi__uint32 D.16386;
  int D.16385;
  unsigned char D.16384;
  unsigned char D.16383;
  unsigned char D.16382;
  unsigned char D.16381;
  unsigned char D.16380;
  unsigned char D.16379;
  unsigned char D.16378;
  unsigned char D.16377;
  unsigned char D.16376;
  unsigned char D.16375;
  unsigned char D.16374;
  void * D.16373;
  stbi_uc * p2;
  stbi_uc * p1;
  stbi_uc t;
  unsigned int a;
  stbi__uint32 v;
  int bpp;
  unsigned char a;
  int easy;
  int z;
  int acount;
  int bcount;
  int gcount;
  int rcount;
  int ashift;
  int bshift;
  int gshift;
  int rshift;
  int v2;
  int v;
  int color;
  int v;
  int bit_offset;
  int z;
  struct stbi__bmp_data info;
  int target;
  int pad;
  int flip_vertically;
  int width;
  int j;
  int i;
  int psize;
  stbi_uc pal[256][4];
  unsigned int all_a;
  unsigned int ma;
  unsigned int mb;
  unsigned int mg;
  unsigned int mr;
  stbi_uc * out;
  unsigned int iftmp.457;
  stbi__uint32 iftmp.453;
  unsigned char iftmp.451;
  int iftmp.446;
  bool retval.441;
  int iftmp.436;
  bool retval.435;
  int iftmp.434;
  bool iftmp.433;
  void * D.16188;
  bool retval.432;

  mr = 0;
  mg = 0;
  mb = 0;
  ma = 0;
  psize = 0;
  info.all_a = 255;
  D.16373 = stbi__bmp_parse_header (s, &info);
  _1 = D.16373;
  retval.432 = _1 == 0B;
  if (retval.432 != 0) goto <D.16186>; else goto <D.16187>;
  <D.16186>:
  D.16188 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16394>;
  <D.16187>:
  _2 = s->img_y;
  _3 = (int) _2;
  _4 = _3 > 0;
  flip_vertically = (int) _4;
  _5 = s->img_y;
  _6 = (int) _5;
  _7 = ABS_EXPR <_6>;
  _8 = (unsigned int) _7;
  s->img_y = _8;
  _9 = s->img_y;
  if (_9 > 16777216) goto <D.16189>; else goto <D.16190>;
  <D.16189>:
  stbi__err ("too large");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16190>:
  _10 = s->img_x;
  if (_10 > 16777216) goto <D.16191>; else goto <D.16192>;
  <D.16191>:
  stbi__err ("too large");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16192>:
  mr = info.mr;
  mg = info.mg;
  mb = info.mb;
  ma = info.ma;
  all_a = info.all_a;
  _11 = info.hsz;
  if (_11 == 12) goto <D.16193>; else goto <D.16194>;
  <D.16193>:
  _12 = info.bpp;
  if (_12 <= 23) goto <D.16195>; else goto <D.16196>;
  <D.16195>:
  _13 = info.offset;
  _14 = info.extra_read;
  _15 = _13 - _14;
  _16 = _15 + -24;
  psize = _16 / 3;
  goto <D.16197>;
  <D.16196>:
  <D.16197>:
  goto <D.16198>;
  <D.16194>:
  _17 = info.bpp;
  if (_17 <= 15) goto <D.16199>; else goto <D.16200>;
  <D.16199>:
  _18 = info.offset;
  _19 = info.extra_read;
  _20 = _18 - _19;
  _21 = info.hsz;
  _22 = _20 - _21;
  psize = _22 >> 2;
  goto <D.16201>;
  <D.16200>:
  <D.16201>:
  <D.16198>:
  if (psize == 0) goto <D.16202>; else goto <D.16203>;
  <D.16202>:
  _23 = info.offset;
  _24 = s->callback_already_read;
  _25 = s->img_buffer;
  _26 = s->img_buffer_original;
  _27 = _25 - _26;
  _28 = (int) _27;
  _29 = _24 + _28;
  if (_23 == _29) goto <D.16205>; else goto <D.16208>;
  <D.16208>:
  _assert ("info.offset == s->callback_already_read + (int) (s->img_buffer - s->img_buffer_original)", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 5398);
  if (0 != 0) goto <D.16205>; else goto <D.16206>;
  <D.16205>:
  iftmp.433 = 1;
  goto <D.16207>;
  <D.16206>:
  iftmp.433 = 0;
  <D.16207>:
  _30 = info.offset;
  _31 = (long long int) _30;
  _32 = s->callback_already_read;
  _33 = (long long int) _32;
  _34 = s->img_buffer;
  _35 = &s->buffer_start;
  _36 = _34 - _35;
  _37 = _33 + _36;
  if (_31 != _37) goto <D.16209>; else goto <D.16210>;
  <D.16209>:
  stbi__err ("bad offset");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16210>:
  goto <D.16211>;
  <D.16203>:
  <D.16211>:
  _38 = info.bpp;
  if (_38 == 24) goto <D.16214>; else goto <D.16212>;
  <D.16214>:
  if (ma == 4278190080) goto <D.16215>; else goto <D.16212>;
  <D.16215>:
  s->img_n = 3;
  goto <D.16213>;
  <D.16212>:
  if (ma != 0) goto <D.16217>; else goto <D.16218>;
  <D.16217>:
  iftmp.434 = 4;
  goto <D.16219>;
  <D.16218>:
  iftmp.434 = 3;
  <D.16219>:
  s->img_n = iftmp.434;
  <D.16213>:
  if (req_comp != 0) goto <D.16222>; else goto <D.16220>;
  <D.16222>:
  if (req_comp > 2) goto <D.16223>; else goto <D.16220>;
  <D.16223>:
  target = req_comp;
  goto <D.16221>;
  <D.16220>:
  target = s->img_n;
  <D.16221>:
  _39 = s->img_y;
  _40 = (int) _39;
  _41 = s->img_x;
  _42 = (int) _41;
  _43 = stbi__mad3sizes_valid (target, _42, _40, 0);
  retval.435 = _43 == 0;
  if (retval.435 != 0) goto <D.16225>; else goto <D.16226>;
  <D.16225>:
  stbi__err ("too large");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16226>:
  _44 = s->img_y;
  _45 = (int) _44;
  _46 = s->img_x;
  _47 = (int) _46;
  out = stbi__malloc_mad3 (target, _47, _45, 0);
  if (out == 0B) goto <D.16227>; else goto <D.16228>;
  <D.16227>:
  stbi__err ("outofmem");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16228>:
  _48 = info.bpp;
  if (_48 <= 15) goto <D.16229>; else goto <D.16230>;
  <D.16229>:
  z = 0;
  if (psize == 0) goto <D.16231>; else goto <D.16233>;
  <D.16233>:
  if (psize > 256) goto <D.16231>; else goto <D.16232>;
  <D.16231>:
  free (out);
  stbi__err ("invalid");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16232>:
  i = 0;
  <D.16234>:
  if (i >= psize) goto <D.12604>; else goto <D.16235>;
  <D.16235>:
  D.16374 = stbi__get8 (s);
  _49 = D.16374;
  pal[i][2] = _49;
  D.16375 = stbi__get8 (s);
  _50 = D.16375;
  pal[i][1] = _50;
  D.16376 = stbi__get8 (s);
  _51 = D.16376;
  pal[i][0] = _51;
  _52 = info.hsz;
  if (_52 != 12) goto <D.16236>; else goto <D.16237>;
  <D.16236>:
  stbi__get8 (s);
  goto <D.16238>;
  <D.16237>:
  <D.16238>:
  pal[i][3] = 255;
  i = i + 1;
  goto <D.16234>;
  <D.12604>:
  _53 = info.offset;
  _54 = info.extra_read;
  _55 = _53 - _54;
  _56 = info.hsz;
  _57 = _55 - _56;
  _58 = info.hsz;
  if (_58 == 12) goto <D.16240>; else goto <D.16241>;
  <D.16240>:
  iftmp.436 = 3;
  goto <D.16242>;
  <D.16241>:
  iftmp.436 = 4;
  <D.16242>:
  _59 = iftmp.436 * psize;
  _60 = _57 - _59;
  stbi__skip (s, _60);
  _61 = info.bpp;
  if (_61 == 1) goto <D.16243>; else goto <D.16244>;
  <D.16243>:
  _62 = s->img_x;
  _63 = _62 + 7;
  _64 = _63 >> 3;
  width = (int) _64;
  goto <D.16245>;
  <D.16244>:
  _65 = info.bpp;
  if (_65 == 4) goto <D.16246>; else goto <D.16247>;
  <D.16246>:
  _66 = s->img_x;
  _67 = _66 + 1;
  _68 = _67 >> 1;
  width = (int) _68;
  goto <D.16248>;
  <D.16247>:
  _69 = info.bpp;
  if (_69 == 8) goto <D.16249>; else goto <D.16250>;
  <D.16249>:
  _70 = s->img_x;
  width = (int) _70;
  goto <D.16251>;
  <D.16250>:
  free (out);
  stbi__err ("bad bpp");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16251>:
  <D.16248>:
  <D.16245>:
  _71 = -width;
  pad = _71 & 3;
  _72 = info.bpp;
  if (_72 == 1) goto <D.16252>; else goto <D.16253>;
  <D.16252>:
  j = 0;
  <D.16254>:
  _73 = s->img_y;
  _74 = (int) _73;
  if (j >= _74) goto <D.12606>; else goto <D.16255>;
  <D.16255>:
  bit_offset = 7;
  D.16377 = stbi__get8 (s);
  _75 = D.16377;
  v = (int) _75;
  i = 0;
  <D.16256>:
  _76 = s->img_x;
  _77 = (int) _76;
  if (i >= _77) goto <D.12608>; else goto <D.16257>;
  <D.16257>:
  _78 = v >> bit_offset;
  color = _78 & 1;
  z.437_79 = z;
  z = z.437_79 + 1;
  _80 = (sizetype) z.437_79;
  _81 = out + _80;
  _82 = pal[color][0];
  *_81 = _82;
  z.438_83 = z;
  z = z.438_83 + 1;
  _84 = (sizetype) z.438_83;
  _85 = out + _84;
  _86 = pal[color][1];
  *_85 = _86;
  z.439_87 = z;
  z = z.439_87 + 1;
  _88 = (sizetype) z.439_87;
  _89 = out + _88;
  _90 = pal[color][2];
  *_89 = _90;
  if (target == 4) goto <D.16258>; else goto <D.16259>;
  <D.16258>:
  z.440_91 = z;
  z = z.440_91 + 1;
  _92 = (sizetype) z.440_91;
  _93 = out + _92;
  *_93 = 255;
  goto <D.16260>;
  <D.16259>:
  <D.16260>:
  _94 = i + 1;
  _95 = s->img_x;
  _96 = (int) _95;
  if (_94 == _96) goto <D.16261>; else goto <D.16262>;
  <D.16261>:
  goto <D.12608>;
  <D.16262>:
  bit_offset = bit_offset + -1;
  retval.441 = bit_offset < 0;
  if (retval.441 != 0) goto <D.16264>; else goto <D.16265>;
  <D.16264>:
  bit_offset = 7;
  D.16378 = stbi__get8 (s);
  _97 = D.16378;
  v = (int) _97;
  goto <D.16266>;
  <D.16265>:
  <D.16266>:
  i = i + 1;
  goto <D.16256>;
  <D.12608>:
  stbi__skip (s, pad);
  j = j + 1;
  goto <D.16254>;
  <D.12606>:
  goto <D.16267>;
  <D.16253>:
  j = 0;
  <D.16268>:
  _98 = s->img_y;
  _99 = (int) _98;
  if (j >= _99) goto <D.12610>; else goto <D.16269>;
  <D.16269>:
  i = 0;
  <D.16270>:
  _100 = s->img_x;
  _101 = (int) _100;
  if (i >= _101) goto <D.12612>; else goto <D.16271>;
  <D.16271>:
  D.16379 = stbi__get8 (s);
  _102 = D.16379;
  v = (int) _102;
  v2 = 0;
  _103 = info.bpp;
  if (_103 == 4) goto <D.16272>; else goto <D.16273>;
  <D.16272>:
  v2 = v & 15;
  v = v >> 4;
  goto <D.16274>;
  <D.16273>:
  <D.16274>:
  z.442_104 = z;
  z = z.442_104 + 1;
  _105 = (sizetype) z.442_104;
  _106 = out + _105;
  _107 = pal[v][0];
  *_106 = _107;
  z.443_108 = z;
  z = z.443_108 + 1;
  _109 = (sizetype) z.443_108;
  _110 = out + _109;
  _111 = pal[v][1];
  *_110 = _111;
  z.444_112 = z;
  z = z.444_112 + 1;
  _113 = (sizetype) z.444_112;
  _114 = out + _113;
  _115 = pal[v][2];
  *_114 = _115;
  if (target == 4) goto <D.16275>; else goto <D.16276>;
  <D.16275>:
  z.445_116 = z;
  z = z.445_116 + 1;
  _117 = (sizetype) z.445_116;
  _118 = out + _117;
  *_118 = 255;
  goto <D.16277>;
  <D.16276>:
  <D.16277>:
  _119 = i + 1;
  _120 = s->img_x;
  _121 = (int) _120;
  if (_119 == _121) goto <D.16278>; else goto <D.16279>;
  <D.16278>:
  goto <D.12612>;
  <D.16279>:
  _122 = info.bpp;
  if (_122 == 8) goto <D.16281>; else goto <D.16282>;
  <D.16281>:
  D.16380 = stbi__get8 (s);
  _123 = D.16380;
  iftmp.446 = (int) _123;
  goto <D.16283>;
  <D.16282>:
  iftmp.446 = v2;
  <D.16283>:
  v = iftmp.446;
  z.447_124 = z;
  z = z.447_124 + 1;
  _125 = (sizetype) z.447_124;
  _126 = out + _125;
  _127 = pal[v][0];
  *_126 = _127;
  z.448_128 = z;
  z = z.448_128 + 1;
  _129 = (sizetype) z.448_128;
  _130 = out + _129;
  _131 = pal[v][1];
  *_130 = _131;
  z.449_132 = z;
  z = z.449_132 + 1;
  _133 = (sizetype) z.449_132;
  _134 = out + _133;
  _135 = pal[v][2];
  *_134 = _135;
  if (target == 4) goto <D.16284>; else goto <D.16285>;
  <D.16284>:
  z.450_136 = z;
  z = z.450_136 + 1;
  _137 = (sizetype) z.450_136;
  _138 = out + _137;
  *_138 = 255;
  goto <D.16286>;
  <D.16285>:
  <D.16286>:
  i = i + 2;
  goto <D.16270>;
  <D.12612>:
  stbi__skip (s, pad);
  j = j + 1;
  goto <D.16268>;
  <D.12610>:
  <D.16267>:
  goto <D.16287>;
  <D.16230>:
  rshift = 0;
  gshift = 0;
  bshift = 0;
  ashift = 0;
  rcount = 0;
  gcount = 0;
  bcount = 0;
  acount = 0;
  z = 0;
  easy = 0;
  _139 = info.offset;
  _140 = info.extra_read;
  _141 = _139 - _140;
  _142 = info.hsz;
  _143 = _141 - _142;
  stbi__skip (s, _143);
  _144 = info.bpp;
  if (_144 == 24) goto <D.16288>; else goto <D.16289>;
  <D.16288>:
  _145 = s->img_x;
  _146 = _145 * 3;
  width = (int) _146;
  goto <D.16290>;
  <D.16289>:
  _147 = info.bpp;
  if (_147 == 16) goto <D.16291>; else goto <D.16292>;
  <D.16291>:
  _148 = s->img_x;
  _149 = _148 * 2;
  width = (int) _149;
  goto <D.16293>;
  <D.16292>:
  width = 0;
  <D.16293>:
  <D.16290>:
  _150 = -width;
  pad = _150 & 3;
  _151 = info.bpp;
  if (_151 == 24) goto <D.16294>; else goto <D.16295>;
  <D.16294>:
  easy = 1;
  goto <D.16296>;
  <D.16295>:
  _152 = info.bpp;
  if (_152 == 32) goto <D.16297>; else goto <D.16298>;
  <D.16297>:
  if (mb == 255) goto <D.16299>; else goto <D.16300>;
  <D.16299>:
  if (mg == 65280) goto <D.16301>; else goto <D.16302>;
  <D.16301>:
  if (mr == 16711680) goto <D.16303>; else goto <D.16304>;
  <D.16303>:
  if (ma == 4278190080) goto <D.16305>; else goto <D.16306>;
  <D.16305>:
  easy = 2;
  goto <D.16307>;
  <D.16306>:
  <D.16307>:
  <D.16304>:
  <D.16302>:
  <D.16300>:
  goto <D.16308>;
  <D.16298>:
  <D.16308>:
  <D.16296>:
  if (easy == 0) goto <D.16309>; else goto <D.16310>;
  <D.16309>:
  if (mr == 0) goto <D.16311>; else goto <D.16313>;
  <D.16313>:
  if (mg == 0) goto <D.16311>; else goto <D.16314>;
  <D.16314>:
  if (mb == 0) goto <D.16311>; else goto <D.16312>;
  <D.16311>:
  free (out);
  stbi__err ("bad masks");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16312>:
  _153 = stbi__high_bit (mr);
  rshift = _153 + -7;
  rcount = stbi__bitcount (mr);
  _154 = stbi__high_bit (mg);
  gshift = _154 + -7;
  gcount = stbi__bitcount (mg);
  _155 = stbi__high_bit (mb);
  bshift = _155 + -7;
  bcount = stbi__bitcount (mb);
  _156 = stbi__high_bit (ma);
  ashift = _156 + -7;
  acount = stbi__bitcount (ma);
  if (rcount > 8) goto <D.16315>; else goto <D.16317>;
  <D.16317>:
  if (gcount > 8) goto <D.16315>; else goto <D.16318>;
  <D.16318>:
  if (bcount > 8) goto <D.16315>; else goto <D.16319>;
  <D.16319>:
  if (acount > 8) goto <D.16315>; else goto <D.16316>;
  <D.16315>:
  free (out);
  stbi__err ("bad masks");
  D.16188 = 0B;
  goto <D.16394>;
  <D.16316>:
  goto <D.16320>;
  <D.16310>:
  <D.16320>:
  j = 0;
  <D.16321>:
  _157 = s->img_y;
  _158 = (int) _157;
  if (j >= _158) goto <D.12614>; else goto <D.16322>;
  <D.16322>:
  if (easy != 0) goto <D.16323>; else goto <D.16324>;
  <D.16323>:
  i = 0;
  <D.16325>:
  _159 = s->img_x;
  _160 = (int) _159;
  if (i >= _160) goto <D.12616>; else goto <D.16326>;
  <D.16326>:
  _161 = (sizetype) z;
  _162 = _161 + 2;
  _163 = out + _162;
  D.16381 = stbi__get8 (s);
  _164 = D.16381;
  *_163 = _164;
  _165 = (sizetype) z;
  _166 = _165 + 1;
  _167 = out + _166;
  D.16382 = stbi__get8 (s);
  _168 = D.16382;
  *_167 = _168;
  _169 = (sizetype) z;
  _170 = out + _169;
  D.16383 = stbi__get8 (s);
  _171 = D.16383;
  *_170 = _171;
  z = z + 3;
  if (easy == 2) goto <D.16328>; else goto <D.16329>;
  <D.16328>:
  D.16384 = stbi__get8 (s);
  iftmp.451 = D.16384;
  goto <D.16330>;
  <D.16329>:
  iftmp.451 = 255;
  <D.16330>:
  a = iftmp.451;
  _172 = (unsigned int) a;
  all_a = all_a | _172;
  if (target == 4) goto <D.16331>; else goto <D.16332>;
  <D.16331>:
  z.452_173 = z;
  z = z.452_173 + 1;
  _174 = (sizetype) z.452_173;
  _175 = out + _174;
  *_175 = a;
  goto <D.16333>;
  <D.16332>:
  <D.16333>:
  i = i + 1;
  goto <D.16325>;
  <D.12616>:
  goto <D.16334>;
  <D.16324>:
  bpp = info.bpp;
  i = 0;
  <D.16335>:
  _176 = s->img_x;
  _177 = (int) _176;
  if (i >= _177) goto <D.12618>; else goto <D.16336>;
  <D.16336>:
  if (bpp == 16) goto <D.16338>; else goto <D.16339>;
  <D.16338>:
  D.16385 = stbi__get16le (s);
  _178 = D.16385;
  iftmp.453 = (stbi__uint32) _178;
  goto <D.16340>;
  <D.16339>:
  D.16386 = stbi__get32le (s);
  iftmp.453 = D.16386;
  <D.16340>:
  v = iftmp.453;
  _179 = v & mr;
  D.16387 = stbi__shiftsigned (_179, rshift, rcount);
  _180 = D.16387;
  z.454_181 = z;
  z = z.454_181 + 1;
  _182 = (sizetype) z.454_181;
  _183 = out + _182;
  _184 = (unsigned char) _180;
  *_183 = _184;
  _185 = v & mg;
  D.16388 = stbi__shiftsigned (_185, gshift, gcount);
  _186 = D.16388;
  z.455_187 = z;
  z = z.455_187 + 1;
  _188 = (sizetype) z.455_187;
  _189 = out + _188;
  _190 = (unsigned char) _186;
  *_189 = _190;
  _191 = v & mb;
  D.16389 = stbi__shiftsigned (_191, bshift, bcount);
  _192 = D.16389;
  z.456_193 = z;
  z = z.456_193 + 1;
  _194 = (sizetype) z.456_193;
  _195 = out + _194;
  _196 = (unsigned char) _192;
  *_195 = _196;
  if (ma != 0) goto <D.16342>; else goto <D.16343>;
  <D.16342>:
  _197 = v & ma;
  D.16390 = stbi__shiftsigned (_197, ashift, acount);
  _198 = D.16390;
  iftmp.457 = (unsigned int) _198;
  goto <D.16344>;
  <D.16343>:
  iftmp.457 = 255;
  <D.16344>:
  a = iftmp.457;
  a.458_199 = a;
  all_a = all_a | a.458_199;
  if (target == 4) goto <D.16345>; else goto <D.16346>;
  <D.16345>:
  a.459_200 = a;
  z.460_201 = z;
  z = z.460_201 + 1;
  _202 = (sizetype) z.460_201;
  _203 = out + _202;
  _204 = (unsigned char) a.459_200;
  *_203 = _204;
  goto <D.16347>;
  <D.16346>:
  <D.16347>:
  a = {CLOBBER};
  i = i + 1;
  goto <D.16335>;
  <D.12618>:
  <D.16334>:
  stbi__skip (s, pad);
  j = j + 1;
  goto <D.16321>;
  <D.12614>:
  <D.16287>:
  if (target == 4) goto <D.16348>; else goto <D.16349>;
  <D.16348>:
  if (all_a == 0) goto <D.16350>; else goto <D.16351>;
  <D.16350>:
  _205 = s->img_x;
  _206 = s->img_y;
  _207 = _205 * _206;
  _208 = _207 * 4;
  _209 = _208 + 4294967295;
  i = (int) _209;
  <D.16352>:
  if (i < 0) goto <D.12620>; else goto <D.16353>;
  <D.16353>:
  _210 = (sizetype) i;
  _211 = out + _210;
  *_211 = 255;
  i = i + -4;
  goto <D.16352>;
  <D.12620>:
  goto <D.16354>;
  <D.16351>:
  <D.16354>:
  <D.16349>:
  if (flip_vertically != 0) goto <D.16355>; else goto <D.16356>;
  <D.16355>:
  j = 0;
  <D.16357>:
  _212 = s->img_y;
  _213 = (int) _212;
  _214 = _213 >> 1;
  if (j >= _214) goto <D.12622>; else goto <D.16358>;
  <D.16358>:
  _215 = s->img_x;
  j.461_216 = (unsigned int) j;
  _217 = _215 * j.461_216;
  target.462_218 = (unsigned int) target;
  _219 = _217 * target.462_218;
  _220 = (sizetype) _219;
  p1 = out + _220;
  _221 = s->img_y;
  j.463_222 = (unsigned int) j;
  _223 = _221 - j.463_222;
  _224 = _223 + 4294967295;
  _225 = s->img_x;
  _226 = _224 * _225;
  target.464_227 = (unsigned int) target;
  _228 = _226 * target.464_227;
  _229 = (sizetype) _228;
  p2 = out + _229;
  i = 0;
  <D.16359>:
  _230 = s->img_x;
  _231 = (int) _230;
  _232 = target * _231;
  if (i >= _232) goto <D.12624>; else goto <D.16360>;
  <D.16360>:
  _233 = (sizetype) i;
  _234 = p1 + _233;
  t = *_234;
  _235 = (sizetype) i;
  _236 = p2 + _235;
  _237 = (sizetype) i;
  _238 = p1 + _237;
  _239 = *_236;
  *_238 = _239;
  _240 = (sizetype) i;
  _241 = p2 + _240;
  *_241 = t;
  i = i + 1;
  goto <D.16359>;
  <D.12624>:
  j = j + 1;
  goto <D.16357>;
  <D.12622>:
  goto <D.16361>;
  <D.16356>:
  <D.16361>:
  if (req_comp != 0) goto <D.16362>; else goto <D.16363>;
  <D.16362>:
  if (req_comp != target) goto <D.16364>; else goto <D.16365>;
  <D.16364>:
  _242 = s->img_y;
  _243 = s->img_x;
  D.16392 = stbi__convert_format (out, target, req_comp, _243, _242);
  out = D.16392;
  if (out == 0B) goto <D.16366>; else goto <D.16367>;
  <D.16366>:
  D.16188 = out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16394>;
  <D.16367>:
  goto <D.16368>;
  <D.16365>:
  <D.16368>:
  <D.16363>:
  _244 = s->img_x;
  _245 = (int) _244;
  *x = _245;
  _246 = s->img_y;
  _247 = (int) _246;
  *y = _247;
  if (comp != 0B) goto <D.16369>; else goto <D.16370>;
  <D.16369>:
  _248 = s->img_n;
  *comp = _248;
  goto <D.16371>;
  <D.16370>:
  <D.16371>:
  D.16188 = out;
  goto <D.16394>;
  <D.16394>:
  pal = {CLOBBER};
  info = {CLOBBER};
  goto <D.16372>;
  <D.16372>:
  return D.16188;
  <D.16391>:
  a = {CLOBBER};
  resx 2
  <D.16393>:
  pal = {CLOBBER};
  info = {CLOBBER};
  resx 1
}



;; Function stbi__tga_get_comp (_ZL18stbi__tga_get_compiiPi, funcdef_no=925, decl_uid=12629, cgraph_uid=831, symbol_order=861)

stbi__tga_get_comp (int bits_per_pixel, int is_grey, int * is_rgb16)
{
  int D.16398;

  if (is_rgb16 != 0B) goto <D.16395>; else goto <D.16396>;
  <D.16395>:
  *is_rgb16 = 0;
  goto <D.16397>;
  <D.16396>:
  <D.16397>:
  switch (bits_per_pixel) <default: <D.12636>, case 8: <D.12631>, case 15: <D.12633>, case 16: <D.12632>, case 24: <D.12634>, case 32: <D.12635>>
  <D.12631>:
  D.16398 = 1;
  goto <D.16404>;
  <D.12632>:
  if (is_grey != 0) goto <D.16399>; else goto <D.16400>;
  <D.16399>:
  D.16398 = 2;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16404>;
  <D.16400>:
  <D.12633>:
  if (is_rgb16 != 0B) goto <D.16401>; else goto <D.16402>;
  <D.16401>:
  *is_rgb16 = 1;
  goto <D.16403>;
  <D.16402>:
  <D.16403>:
  D.16398 = 3;
  goto <D.16404>;
  <D.12634>:
  <D.12635>:
  D.16398 = bits_per_pixel / 8;
  goto <D.16404>;
  <D.12636>:
  D.16398 = 0;
  goto <D.16404>;
  <D.16404>:
  return D.16398;
}



;; Function stbi__tga_info (_ZL14stbi__tga_infoP13stbi__contextPiS1_S1_, funcdef_no=926, decl_uid=10170, cgraph_uid=832, symbol_order=862)

stbi__tga_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  unsigned char D.16466;
  int D.16465;
  int D.16464;
  unsigned char D.16463;
  unsigned char D.16462;
  unsigned char D.16461;
  int tga_colormap_type;
  int sz;
  int tga_colormap_bpp;
  int tga_bits_per_pixel;
  int tga_image_type;
  int tga_comp;
  int tga_h;
  int tga_w;
  bool iftmp.465;
  int D.16407;

  stbi__get8 (s);
  D.16461 = stbi__get8 (s);
  _1 = D.16461;
  tga_colormap_type = (int) _1;
  if (tga_colormap_type > 1) goto <D.16405>; else goto <D.16406>;
  <D.16405>:
  stbi__rewind (s);
  D.16407 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16460>;
  <D.16406>:
  D.16462 = stbi__get8 (s);
  _2 = D.16462;
  tga_image_type = (int) _2;
  if (tga_colormap_type == 1) goto <D.16408>; else goto <D.16409>;
  <D.16408>:
  if (tga_image_type != 1) goto <D.16410>; else goto <D.16411>;
  <D.16410>:
  if (tga_image_type != 9) goto <D.16412>; else goto <D.16413>;
  <D.16412>:
  stbi__rewind (s);
  D.16407 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16460>;
  <D.16413>:
  <D.16411>:
  stbi__skip (s, 4);
  D.16463 = stbi__get8 (s);
  _3 = D.16463;
  sz = (int) _3;
  if (sz != 8) goto <D.16414>; else goto <D.16415>;
  <D.16414>:
  if (sz != 15) goto <D.16416>; else goto <D.16417>;
  <D.16416>:
  if (sz != 16) goto <D.16418>; else goto <D.16419>;
  <D.16418>:
  if (sz != 24) goto <D.16420>; else goto <D.16421>;
  <D.16420>:
  if (sz != 32) goto <D.16422>; else goto <D.16423>;
  <D.16422>:
  stbi__rewind (s);
  D.16407 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16460>;
  <D.16423>:
  <D.16421>:
  <D.16419>:
  <D.16417>:
  <D.16415>:
  stbi__skip (s, 4);
  tga_colormap_bpp = sz;
  goto <D.16424>;
  <D.16409>:
  if (tga_image_type != 2) goto <D.16425>; else goto <D.16426>;
  <D.16425>:
  if (tga_image_type != 3) goto <D.16427>; else goto <D.16428>;
  <D.16427>:
  if (tga_image_type != 10) goto <D.16429>; else goto <D.16430>;
  <D.16429>:
  if (tga_image_type != 11) goto <D.16431>; else goto <D.16432>;
  <D.16431>:
  stbi__rewind (s);
  D.16407 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16460>;
  <D.16432>:
  <D.16430>:
  <D.16428>:
  <D.16426>:
  stbi__skip (s, 9);
  tga_colormap_bpp = 0;
  <D.16424>:
  D.16464 = stbi__get16le (s);
  tga_w = D.16464;
  if (tga_w <= 0) goto <D.16433>; else goto <D.16434>;
  <D.16433>:
  stbi__rewind (s);
  D.16407 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16460>;
  <D.16434>:
  D.16465 = stbi__get16le (s);
  tga_h = D.16465;
  if (tga_h <= 0) goto <D.16435>; else goto <D.16436>;
  <D.16435>:
  stbi__rewind (s);
  D.16407 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16460>;
  <D.16436>:
  D.16466 = stbi__get8 (s);
  _4 = D.16466;
  tga_bits_per_pixel = (int) _4;
  stbi__get8 (s);
  if (tga_colormap_bpp != 0) goto <D.16437>; else goto <D.16438>;
  <D.16437>:
  if (tga_bits_per_pixel != 8) goto <D.16439>; else goto <D.16440>;
  <D.16439>:
  if (tga_bits_per_pixel != 16) goto <D.16441>; else goto <D.16442>;
  <D.16441>:
  stbi__rewind (s);
  D.16407 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16460>;
  <D.16442>:
  <D.16440>:
  tga_comp = stbi__tga_get_comp (tga_colormap_bpp, 0, 0B);
  goto <D.16443>;
  <D.16438>:
  if (tga_image_type == 3) goto <D.16445>; else goto <D.16448>;
  <D.16448>:
  if (tga_image_type == 11) goto <D.16445>; else goto <D.16446>;
  <D.16445>:
  iftmp.465 = 1;
  goto <D.16447>;
  <D.16446>:
  iftmp.465 = 0;
  <D.16447>:
  _5 = (int) iftmp.465;
  tga_comp = stbi__tga_get_comp (tga_bits_per_pixel, _5, 0B);
  <D.16443>:
  if (tga_comp == 0) goto <D.16449>; else goto <D.16450>;
  <D.16449>:
  stbi__rewind (s);
  D.16407 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16460>;
  <D.16450>:
  if (x != 0B) goto <D.16451>; else goto <D.16452>;
  <D.16451>:
  *x = tga_w;
  goto <D.16453>;
  <D.16452>:
  <D.16453>:
  if (y != 0B) goto <D.16454>; else goto <D.16455>;
  <D.16454>:
  *y = tga_h;
  goto <D.16456>;
  <D.16455>:
  <D.16456>:
  if (comp != 0B) goto <D.16457>; else goto <D.16458>;
  <D.16457>:
  *comp = tga_comp;
  goto <D.16459>;
  <D.16458>:
  <D.16459>:
  D.16407 = 1;
  goto <D.16460>;
  <D.16460>:
  return D.16407;
}



;; Function stbi__tga_test (_ZL14stbi__tga_testP13stbi__context, funcdef_no=927, decl_uid=10158, cgraph_uid=833, symbol_order=863)

stbi__tga_test (struct stbi__context * s)
{
  unsigned char D.16523;
  int D.16522;
  int D.16521;
  unsigned char D.16520;
  unsigned char D.16519;
  unsigned char D.16518;
  int tga_color_type;
  int sz;
  int res;
  int D.16516;
  bool retval.467;
  bool retval.466;

  res = 0;
  stbi__get8 (s);
  D.16518 = stbi__get8 (s);
  _1 = D.16518;
  tga_color_type = (int) _1;
  if (tga_color_type > 1) goto <D.16467>; else goto <D.16468>;
  <D.16467>:
  // predicted unlikely by goto predictor.
  goto errorEnd;
  <D.16468>:
  D.16519 = stbi__get8 (s);
  _2 = D.16519;
  sz = (int) _2;
  if (tga_color_type == 1) goto <D.16469>; else goto <D.16470>;
  <D.16469>:
  if (sz != 1) goto <D.16471>; else goto <D.16472>;
  <D.16471>:
  if (sz != 9) goto <D.16473>; else goto <D.16474>;
  <D.16473>:
  // predicted unlikely by goto predictor.
  goto errorEnd;
  <D.16474>:
  <D.16472>:
  stbi__skip (s, 4);
  D.16520 = stbi__get8 (s);
  _3 = D.16520;
  sz = (int) _3;
  if (sz != 8) goto <D.16475>; else goto <D.16476>;
  <D.16475>:
  if (sz != 15) goto <D.16477>; else goto <D.16478>;
  <D.16477>:
  if (sz != 16) goto <D.16479>; else goto <D.16480>;
  <D.16479>:
  if (sz != 24) goto <D.16481>; else goto <D.16482>;
  <D.16481>:
  if (sz != 32) goto <D.16483>; else goto <D.16484>;
  <D.16483>:
  // predicted unlikely by goto predictor.
  goto errorEnd;
  <D.16484>:
  <D.16482>:
  <D.16480>:
  <D.16478>:
  <D.16476>:
  stbi__skip (s, 4);
  goto <D.16485>;
  <D.16470>:
  if (sz != 2) goto <D.16486>; else goto <D.16487>;
  <D.16486>:
  if (sz != 3) goto <D.16488>; else goto <D.16489>;
  <D.16488>:
  if (sz != 10) goto <D.16490>; else goto <D.16491>;
  <D.16490>:
  if (sz != 11) goto <D.16492>; else goto <D.16493>;
  <D.16492>:
  // predicted unlikely by goto predictor.
  goto errorEnd;
  <D.16493>:
  <D.16491>:
  <D.16489>:
  <D.16487>:
  stbi__skip (s, 9);
  <D.16485>:
  D.16521 = stbi__get16le (s);
  _4 = D.16521;
  retval.466 = _4 <= 0;
  if (retval.466 != 0) goto <D.16495>; else goto <D.16496>;
  <D.16495>:
  // predicted unlikely by goto predictor.
  goto errorEnd;
  <D.16496>:
  D.16522 = stbi__get16le (s);
  _5 = D.16522;
  retval.467 = _5 <= 0;
  if (retval.467 != 0) goto <D.16498>; else goto <D.16499>;
  <D.16498>:
  // predicted unlikely by goto predictor.
  goto errorEnd;
  <D.16499>:
  D.16523 = stbi__get8 (s);
  _6 = D.16523;
  sz = (int) _6;
  if (tga_color_type == 1) goto <D.16500>; else goto <D.16501>;
  <D.16500>:
  if (sz != 8) goto <D.16502>; else goto <D.16503>;
  <D.16502>:
  if (sz != 16) goto <D.16504>; else goto <D.16505>;
  <D.16504>:
  // predicted unlikely by goto predictor.
  goto errorEnd;
  <D.16505>:
  <D.16503>:
  <D.16501>:
  if (sz != 8) goto <D.16506>; else goto <D.16507>;
  <D.16506>:
  if (sz != 15) goto <D.16508>; else goto <D.16509>;
  <D.16508>:
  if (sz != 16) goto <D.16510>; else goto <D.16511>;
  <D.16510>:
  if (sz != 24) goto <D.16512>; else goto <D.16513>;
  <D.16512>:
  if (sz != 32) goto <D.16514>; else goto <D.16515>;
  <D.16514>:
  // predicted unlikely by goto predictor.
  goto errorEnd;
  <D.16515>:
  <D.16513>:
  <D.16511>:
  <D.16509>:
  <D.16507>:
  res = 1;
  errorEnd:
  stbi__rewind (s);
  D.16516 = res;
  goto <D.16517>;
  <D.16517>:
  return D.16516;
}



;; Function stbi__tga_read_rgb16 (_ZL20stbi__tga_read_rgb16P13stbi__contextPh, funcdef_no=928, decl_uid=12661, cgraph_uid=834, symbol_order=864)

stbi__tga_read_rgb16 (struct stbi__context * s, stbi_uc * out)
{
  int D.16524;
  int b;
  int g;
  int r;
  stbi__uint16 fiveBitMask;
  stbi__uint16 px;

  D.16524 = stbi__get16le (s);
  _1 = D.16524;
  px = (stbi__uint16) _1;
  fiveBitMask = 31;
  _2 = (int) px;
  _3 = _2 >> 10;
  _4 = (int) fiveBitMask;
  r = _3 & _4;
  _5 = (int) px;
  _6 = _5 >> 5;
  _7 = (int) fiveBitMask;
  g = _6 & _7;
  _8 = px & fiveBitMask;
  b = (int) _8;
  _9 = r * 255;
  _10 = _9 / 31;
  _11 = (unsigned char) _10;
  *out = _11;
  _12 = g * 255;
  _13 = _12 / 31;
  _14 = out + 1;
  _15 = (unsigned char) _13;
  *_14 = _15;
  _16 = b * 255;
  _17 = _16 / 31;
  _18 = out + 2;
  _19 = (unsigned char) _17;
  *_18 = _19;
  return;
}



;; Function stbi__tga_load (_ZL14stbi__tga_loadP13stbi__contextPiS1_S1_iP17stbi__result_info, funcdef_no=929, decl_uid=10165, cgraph_uid=835, symbol_order=865)

stbi__tga_load (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri)
{
  unsigned char * D.16655;
  unsigned char D.16654;
  int D.16653;
  unsigned char D.16652;
  unsigned char D.16651;
  int D.16650;
  unsigned char D.16649;
  unsigned char D.16648;
  int D.16647;
  int D.16646;
  int D.16645;
  int D.16644;
  unsigned char D.16643;
  int D.16642;
  int D.16641;
  unsigned char D.16640;
  unsigned char D.16639;
  unsigned char D.16638;
  unsigned char temp;
  unsigned char * tga_pixel;
  unsigned char temp;
  int index2;
  int index1;
  int pal_idx;
  int RLE_cmd;
  stbi_uc * pal_entry;
  stbi_uc * tga_row;
  int row;
  int read_next_pixel;
  int RLE_repeating;
  int RLE_count;
  unsigned char raw_data[4];
  int j;
  int i;
  unsigned char * tga_palette;
  unsigned char * tga_data;
  int tga_inverted;
  int tga_rgb16;
  int tga_comp;
  int tga_bits_per_pixel;
  int tga_height;
  int tga_width;
  int tga_y_origin;
  int tga_x_origin;
  int tga_palette_bits;
  int tga_palette_len;
  int tga_palette_start;
  int tga_is_RLE;
  int tga_image_type;
  int tga_indexed;
  int tga_offset;
  bool iftmp.476;
  int iftmp.474;
  bool retval.473;
  bool iftmp.472;
  int iftmp.470;
  bool retval.468;
  void * D.16527;

  D.16638 = stbi__get8 (s);
  _1 = D.16638;
  tga_offset = (int) _1;
  D.16639 = stbi__get8 (s);
  _2 = D.16639;
  tga_indexed = (int) _2;
  D.16640 = stbi__get8 (s);
  _3 = D.16640;
  tga_image_type = (int) _3;
  tga_is_RLE = 0;
  D.16641 = stbi__get16le (s);
  tga_palette_start = D.16641;
  D.16642 = stbi__get16le (s);
  tga_palette_len = D.16642;
  D.16643 = stbi__get8 (s);
  _4 = D.16643;
  tga_palette_bits = (int) _4;
  D.16644 = stbi__get16le (s);
  tga_x_origin = D.16644;
  D.16645 = stbi__get16le (s);
  tga_y_origin = D.16645;
  D.16646 = stbi__get16le (s);
  tga_width = D.16646;
  D.16647 = stbi__get16le (s);
  tga_height = D.16647;
  D.16648 = stbi__get8 (s);
  _5 = D.16648;
  tga_bits_per_pixel = (int) _5;
  tga_rgb16 = 0;
  D.16649 = stbi__get8 (s);
  _6 = D.16649;
  tga_inverted = (int) _6;
  tga_palette = 0B;
  raw_data = {};
  RLE_count = 0;
  RLE_repeating = 0;
  read_next_pixel = 1;
  if (tga_height > 16777216) goto <D.16525>; else goto <D.16526>;
  <D.16525>:
  stbi__err ("too large");
  D.16527 = 0B;
  goto <D.16657>;
  <D.16526>:
  if (tga_width > 16777216) goto <D.16528>; else goto <D.16529>;
  <D.16528>:
  stbi__err ("too large");
  D.16527 = 0B;
  goto <D.16657>;
  <D.16529>:
  if (tga_image_type > 7) goto <D.16530>; else goto <D.16531>;
  <D.16530>:
  tga_image_type = tga_image_type + -8;
  tga_is_RLE = 1;
  goto <D.16532>;
  <D.16531>:
  <D.16532>:
  _7 = tga_inverted & 32;
  _8 = _7 == 0;
  tga_inverted = (int) _8;
  if (tga_indexed != 0) goto <D.16533>; else goto <D.16534>;
  <D.16533>:
  tga_comp = stbi__tga_get_comp (tga_palette_bits, 0, &tga_rgb16);
  goto <D.16535>;
  <D.16534>:
  _9 = tga_image_type == 3;
  _10 = (int) _9;
  tga_comp = stbi__tga_get_comp (tga_bits_per_pixel, _10, &tga_rgb16);
  <D.16535>:
  if (tga_comp == 0) goto <D.16536>; else goto <D.16537>;
  <D.16536>:
  stbi__err ("bad format");
  D.16527 = 0B;
  goto <D.16657>;
  <D.16537>:
  *x = tga_width;
  *y = tga_height;
  if (comp != 0B) goto <D.16538>; else goto <D.16539>;
  <D.16538>:
  *comp = tga_comp;
  goto <D.16540>;
  <D.16539>:
  <D.16540>:
  _11 = stbi__mad3sizes_valid (tga_width, tga_height, tga_comp, 0);
  retval.468 = _11 == 0;
  if (retval.468 != 0) goto <D.16542>; else goto <D.16543>;
  <D.16542>:
  stbi__err ("too large");
  D.16527 = 0B;
  goto <D.16657>;
  <D.16543>:
  tga_data = stbi__malloc_mad3 (tga_width, tga_height, tga_comp, 0);
  if (tga_data == 0B) goto <D.16544>; else goto <D.16545>;
  <D.16544>:
  stbi__err ("outofmem");
  D.16527 = 0B;
  goto <D.16657>;
  <D.16545>:
  stbi__skip (s, tga_offset);
  if (tga_indexed == 0) goto <D.16548>; else goto <D.16546>;
  <D.16548>:
  if (tga_is_RLE == 0) goto <D.16549>; else goto <D.16546>;
  <D.16549>:
  tga_rgb16.469_12 = tga_rgb16;
  if (tga_rgb16.469_12 == 0) goto <D.16550>; else goto <D.16546>;
  <D.16550>:
  i = 0;
  <D.16551>:
  if (i >= tga_height) goto <D.12709>; else goto <D.16552>;
  <D.16552>:
  if (tga_inverted != 0) goto <D.16554>; else goto <D.16555>;
  <D.16554>:
  _13 = tga_height - i;
  iftmp.470 = _13 + -1;
  goto <D.16556>;
  <D.16555>:
  iftmp.470 = i;
  <D.16556>:
  row = iftmp.470;
  _14 = row * tga_width;
  _15 = tga_comp * _14;
  _16 = (sizetype) _15;
  tga_row = tga_data + _16;
  _17 = tga_width * tga_comp;
  stbi__getn (s, tga_row, _17);
  i = i + 1;
  goto <D.16551>;
  <D.12709>:
  goto <D.16547>;
  <D.16546>:
  if (tga_indexed != 0) goto <D.16557>; else goto <D.16558>;
  <D.16557>:
  if (tga_palette_len == 0) goto <D.16559>; else goto <D.16560>;
  <D.16559>:
  free (tga_data);
  stbi__err ("bad palette");
  D.16527 = 0B;
  goto <D.16657>;
  <D.16560>:
  stbi__skip (s, tga_palette_start);
  tga_palette = stbi__malloc_mad2 (tga_palette_len, tga_comp, 0);
  if (tga_palette == 0B) goto <D.16561>; else goto <D.16562>;
  <D.16561>:
  free (tga_data);
  stbi__err ("outofmem");
  D.16527 = 0B;
  goto <D.16657>;
  <D.16562>:
  tga_rgb16.471_18 = tga_rgb16;
  if (tga_rgb16.471_18 != 0) goto <D.16563>; else goto <D.16564>;
  <D.16563>:
  pal_entry = tga_palette;
  if (tga_comp == 3) goto <D.16566>; else goto <D.16569>;
  <D.16569>:
  _assert ("tga_comp == STBI_rgb", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 5778);
  if (0 != 0) goto <D.16566>; else goto <D.16567>;
  <D.16566>:
  iftmp.472 = 1;
  goto <D.16568>;
  <D.16567>:
  iftmp.472 = 0;
  <D.16568>:
  i = 0;
  <D.16570>:
  if (i >= tga_palette_len) goto <D.12711>; else goto <D.16571>;
  <D.16571>:
  stbi__tga_read_rgb16 (s, pal_entry);
  _19 = (sizetype) tga_comp;
  pal_entry = pal_entry + _19;
  i = i + 1;
  goto <D.16570>;
  <D.12711>:
  goto <D.16572>;
  <D.16564>:
  _20 = tga_palette_len * tga_comp;
  D.16650 = stbi__getn (s, tga_palette, _20);
  _21 = D.16650;
  retval.473 = _21 == 0;
  if (retval.473 != 0) goto <D.16574>; else goto <D.16575>;
  <D.16574>:
  free (tga_data);
  free (tga_palette);
  stbi__err ("bad palette");
  D.16527 = 0B;
  goto <D.16657>;
  <D.16575>:
  <D.16572>:
  goto <D.16576>;
  <D.16558>:
  <D.16576>:
  i = 0;
  <D.16577>:
  _22 = tga_width * tga_height;
  if (i >= _22) goto <D.12713>; else goto <D.16578>;
  <D.16578>:
  if (tga_is_RLE != 0) goto <D.16579>; else goto <D.16580>;
  <D.16579>:
  if (RLE_count == 0) goto <D.16581>; else goto <D.16582>;
  <D.16581>:
  D.16651 = stbi__get8 (s);
  _23 = D.16651;
  RLE_cmd = (int) _23;
  _24 = RLE_cmd & 127;
  RLE_count = _24 + 1;
  RLE_repeating = RLE_cmd >> 7;
  read_next_pixel = 1;
  goto <D.16583>;
  <D.16582>:
  if (RLE_repeating == 0) goto <D.16584>; else goto <D.16585>;
  <D.16584>:
  read_next_pixel = 1;
  goto <D.16586>;
  <D.16585>:
  <D.16586>:
  <D.16583>:
  goto <D.16587>;
  <D.16580>:
  read_next_pixel = 1;
  <D.16587>:
  if (read_next_pixel != 0) goto <D.16588>; else goto <D.16589>;
  <D.16588>:
  if (tga_indexed != 0) goto <D.16590>; else goto <D.16591>;
  <D.16590>:
  if (tga_bits_per_pixel == 8) goto <D.16593>; else goto <D.16594>;
  <D.16593>:
  D.16652 = stbi__get8 (s);
  _25 = D.16652;
  iftmp.474 = (int) _25;
  goto <D.16595>;
  <D.16594>:
  D.16653 = stbi__get16le (s);
  iftmp.474 = D.16653;
  <D.16595>:
  pal_idx = iftmp.474;
  if (pal_idx >= tga_palette_len) goto <D.16596>; else goto <D.16597>;
  <D.16596>:
  pal_idx = 0;
  goto <D.16598>;
  <D.16597>:
  <D.16598>:
  pal_idx = pal_idx * tga_comp;
  j = 0;
  <D.16599>:
  if (j >= tga_comp) goto <D.12715>; else goto <D.16600>;
  <D.16600>:
  _26 = pal_idx + j;
  _27 = (sizetype) _26;
  _28 = tga_palette + _27;
  _29 = *_28;
  raw_data[j] = _29;
  j = j + 1;
  goto <D.16599>;
  <D.12715>:
  goto <D.16601>;
  <D.16591>:
  tga_rgb16.475_30 = tga_rgb16;
  if (tga_rgb16.475_30 != 0) goto <D.16602>; else goto <D.16603>;
  <D.16602>:
  if (tga_comp == 3) goto <D.16605>; else goto <D.16608>;
  <D.16608>:
  _assert ("tga_comp == STBI_rgb", "D:\\WSCodeblocks\\ComputacaoGrafica\\GLFW_TDE2\\include\\stb_image.h", 5827);
  if (0 != 0) goto <D.16605>; else goto <D.16606>;
  <D.16605>:
  iftmp.476 = 1;
  goto <D.16607>;
  <D.16606>:
  iftmp.476 = 0;
  <D.16607>:
  stbi__tga_read_rgb16 (s, &raw_data);
  goto <D.16609>;
  <D.16603>:
  j = 0;
  <D.16610>:
  if (j >= tga_comp) goto <D.12717>; else goto <D.16611>;
  <D.16611>:
  D.16654 = stbi__get8 (s);
  _31 = D.16654;
  raw_data[j] = _31;
  j = j + 1;
  goto <D.16610>;
  <D.12717>:
  <D.16609>:
  <D.16601>:
  read_next_pixel = 0;
  goto <D.16612>;
  <D.16589>:
  <D.16612>:
  j = 0;
  <D.16613>:
  if (j >= tga_comp) goto <D.12719>; else goto <D.16614>;
  <D.16614>:
  _32 = i * tga_comp;
  _33 = j + _32;
  _34 = (sizetype) _33;
  _35 = tga_data + _34;
  _36 = raw_data[j];
  *_35 = _36;
  j = j + 1;
  goto <D.16613>;
  <D.12719>:
  RLE_count = RLE_count + -1;
  i = i + 1;
  goto <D.16577>;
  <D.12713>:
  if (tga_inverted != 0) goto <D.16615>; else goto <D.16616>;
  <D.16615>:
  j = 0;
  <D.16617>:
  _37 = j * 2;
  if (tga_height <= _37) goto <D.12721>; else goto <D.16618>;
  <D.16618>:
  _38 = j * tga_width;
  index1 = tga_comp * _38;
  _39 = tga_height + -1;
  _40 = _39 - j;
  _41 = tga_width * _40;
  index2 = tga_comp * _41;
  i = tga_width * tga_comp;
  <D.16619>:
  if (i <= 0) goto <D.12723>; else goto <D.16620>;
  <D.16620>:
  _42 = (sizetype) index1;
  _43 = tga_data + _42;
  temp = *_43;
  _44 = (sizetype) index2;
  _45 = tga_data + _44;
  _46 = (sizetype) index1;
  _47 = tga_data + _46;
  _48 = *_45;
  *_47 = _48;
  _49 = (sizetype) index2;
  _50 = tga_data + _49;
  *_50 = temp;
  index1 = index1 + 1;
  index2 = index2 + 1;
  i = i + -1;
  goto <D.16619>;
  <D.12723>:
  j = j + 1;
  goto <D.16617>;
  <D.12721>:
  goto <D.16621>;
  <D.16616>:
  <D.16621>:
  if (tga_palette != 0B) goto <D.16622>; else goto <D.16623>;
  <D.16622>:
  free (tga_palette);
  goto <D.16624>;
  <D.16623>:
  <D.16624>:
  <D.16547>:
  if (tga_comp > 2) goto <D.16625>; else goto <D.16626>;
  <D.16625>:
  tga_rgb16.477_51 = tga_rgb16;
  if (tga_rgb16.477_51 == 0) goto <D.16627>; else goto <D.16628>;
  <D.16627>:
  tga_pixel = tga_data;
  i = 0;
  <D.16629>:
  _52 = tga_width * tga_height;
  if (i >= _52) goto <D.12725>; else goto <D.16630>;
  <D.16630>:
  temp = *tga_pixel;
  _53 = MEM[(unsigned char *)tga_pixel + 2B];
  *tga_pixel = _53;
  _54 = tga_pixel + 2;
  *_54 = temp;
  _55 = (sizetype) tga_comp;
  tga_pixel = tga_pixel + _55;
  i = i + 1;
  goto <D.16629>;
  <D.12725>:
  goto <D.16631>;
  <D.16628>:
  <D.16631>:
  <D.16626>:
  if (req_comp != 0) goto <D.16632>; else goto <D.16633>;
  <D.16632>:
  if (req_comp != tga_comp) goto <D.16634>; else goto <D.16635>;
  <D.16634>:
  tga_height.478_56 = (unsigned int) tga_height;
  tga_width.479_57 = (unsigned int) tga_width;
  D.16655 = stbi__convert_format (tga_data, tga_comp, req_comp, tga_width.479_57, tga_height.478_56);
  tga_data = D.16655;
  goto <D.16636>;
  <D.16635>:
  <D.16636>:
  <D.16633>:
  tga_y_origin = 0;
  tga_x_origin = tga_y_origin;
  tga_palette_bits = tga_x_origin;
  tga_palette_len = tga_palette_bits;
  tga_palette_start = tga_palette_len;
  D.16527 = tga_data;
  goto <D.16657>;
  <D.16657>:
  tga_rgb16 = {CLOBBER};
  raw_data = {CLOBBER};
  goto <D.16637>;
  <D.16637>:
  return D.16527;
  <D.16656>:
  tga_rgb16 = {CLOBBER};
  raw_data = {CLOBBER};
  resx 1
}



;; Function stbi__psd_test (_ZL14stbi__psd_testP13stbi__context, funcdef_no=930, decl_uid=10172, cgraph_uid=836, symbol_order=866)

stbi__psd_test (struct stbi__context * s)
{
  unsigned int D.16660;
  int r;
  int D.16658;

  D.16660 = stbi__get32be (s);
  _1 = D.16660;
  _2 = _1 == 943870035;
  r = (int) _2;
  stbi__rewind (s);
  D.16658 = r;
  goto <D.16659>;
  <D.16659>:
  return D.16658;
}



;; Function stbi__psd_decode_rle (_ZL20stbi__psd_decode_rleP13stbi__contextPhi, funcdef_no=931, decl_uid=12734, cgraph_uid=837, symbol_order=867)

stbi__psd_decode_rle (struct stbi__context * s, stbi_uc * p, int pixelCount)
{
  stbi_uc D.16685;
  unsigned char D.16684;
  unsigned char D.16683;
  stbi_uc val;
  int len;
  int nleft;
  int count;
  int D.16671;
  bool retval.480;

  count = 0;
  <D.16661>:
  nleft = pixelCount - count;
  retval.480 = nleft > 0;
  if (retval.480 != 0) goto <D.16663>; else goto <D.12740>;
  <D.16663>:
  D.16683 = stbi__get8 (s);
  _1 = D.16683;
  len = (int) _1;
  if (len == 128) goto <D.16664>; else goto <D.16665>;
  <D.16664>:
  goto <D.16666>;
  <D.16665>:
  if (len <= 127) goto <D.16667>; else goto <D.16668>;
  <D.16667>:
  len = len + 1;
  if (len > nleft) goto <D.16669>; else goto <D.16670>;
  <D.16669>:
  D.16671 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16682>;
  <D.16670>:
  count = count + len;
  <D.16672>:
  if (len == 0) goto <D.12742>; else goto <D.16673>;
  <D.16673>:
  D.16684 = stbi__get8 (s);
  _2 = D.16684;
  *p = _2;
  p = p + 4;
  len = len + -1;
  goto <D.16672>;
  <D.12742>:
  goto <D.16674>;
  <D.16668>:
  if (len > 128) goto <D.16675>; else goto <D.16676>;
  <D.16675>:
  len = 257 - len;
  if (len > nleft) goto <D.16677>; else goto <D.16678>;
  <D.16677>:
  D.16671 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16682>;
  <D.16678>:
  D.16685 = stbi__get8 (s);
  val = D.16685;
  count = count + len;
  <D.16679>:
  if (len == 0) goto <D.12744>; else goto <D.16680>;
  <D.16680>:
  *p = val;
  p = p + 4;
  len = len + -1;
  goto <D.16679>;
  <D.12744>:
  goto <D.16681>;
  <D.16676>:
  <D.16681>:
  <D.16674>:
  <D.16666>:
  goto <D.16661>;
  <D.12740>:
  D.16671 = 1;
  goto <D.16682>;
  <D.16682>:
  return D.16671;
}



;; Function stbi__psd_load (_ZL14stbi__psd_loadP13stbi__contextPiS1_S1_iP17stbi__result_infoi, funcdef_no=932, decl_uid=10180, cgraph_uid=838, symbol_order=868)

stbi__psd_load (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri, int bpc)
{
  stbi_uc * D.16819;
  stbi_uc * D.16818;
  unsigned char D.16817;
  int D.16816;
  int D.16815;
  int D.16814;
  int D.16813;
  unsigned int D.16812;
  unsigned int D.16811;
  unsigned int D.16810;
  int D.16809;
  int D.16808;
  unsigned int D.16807;
  unsigned int D.16806;
  int D.16805;
  int D.16804;
  unsigned int D.16803;
  float inv_a;
  float ra;
  float a;
  unsigned char * pixel;
  float inv_a;
  float ra;
  float a;
  stbi__uint16 * pixel;
  stbi_uc * p;
  stbi__uint16 * q;
  stbi_uc val;
  stbi_uc * p;
  stbi__uint16 val;
  stbi__uint16 * q;
  stbi_uc * p;
  stbi_uc * out;
  int h;
  int w;
  int bitdepth;
  int i;
  int channel;
  int compression;
  int channelCount;
  int pixelCount;
  stbi_uc iftmp.488;
  stbi__uint16 iftmp.487;
  bool retval.486;
  stbi_uc iftmp.485;
  bool retval.484;
  bool retval.483;
  bool retval.482;
  void * D.16689;
  bool retval.481;

  D.16803 = stbi__get32be (s);
  _1 = D.16803;
  retval.481 = _1 != 943870035;
  if (retval.481 != 0) goto <D.16687>; else goto <D.16688>;
  <D.16687>:
  stbi__err ("not PSD");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16688>:
  D.16804 = stbi__get16be (s);
  _2 = D.16804;
  retval.482 = _2 != 1;
  if (retval.482 != 0) goto <D.16691>; else goto <D.16692>;
  <D.16691>:
  stbi__err ("wrong version");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16692>:
  stbi__skip (s, 6);
  D.16805 = stbi__get16be (s);
  channelCount = D.16805;
  if (channelCount < 0) goto <D.16693>; else goto <D.16695>;
  <D.16695>:
  if (channelCount > 16) goto <D.16693>; else goto <D.16694>;
  <D.16693>:
  stbi__err ("wrong channel count");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16694>:
  D.16806 = stbi__get32be (s);
  _3 = D.16806;
  h = (int) _3;
  D.16807 = stbi__get32be (s);
  _4 = D.16807;
  w = (int) _4;
  if (h > 16777216) goto <D.16696>; else goto <D.16697>;
  <D.16696>:
  stbi__err ("too large");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16697>:
  if (w > 16777216) goto <D.16698>; else goto <D.16699>;
  <D.16698>:
  stbi__err ("too large");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16699>:
  D.16808 = stbi__get16be (s);
  bitdepth = D.16808;
  if (bitdepth != 8) goto <D.16700>; else goto <D.16701>;
  <D.16700>:
  if (bitdepth != 16) goto <D.16702>; else goto <D.16703>;
  <D.16702>:
  stbi__err ("unsupported bit depth");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16703>:
  <D.16701>:
  D.16809 = stbi__get16be (s);
  _5 = D.16809;
  retval.483 = _5 != 3;
  if (retval.483 != 0) goto <D.16705>; else goto <D.16706>;
  <D.16705>:
  stbi__err ("wrong color format");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16706>:
  D.16810 = stbi__get32be (s);
  _6 = D.16810;
  _7 = (int) _6;
  stbi__skip (s, _7);
  D.16811 = stbi__get32be (s);
  _8 = D.16811;
  _9 = (int) _8;
  stbi__skip (s, _9);
  D.16812 = stbi__get32be (s);
  _10 = D.16812;
  _11 = (int) _10;
  stbi__skip (s, _11);
  D.16813 = stbi__get16be (s);
  compression = D.16813;
  if (compression > 1) goto <D.16707>; else goto <D.16708>;
  <D.16707>:
  stbi__err ("bad compression");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16708>:
  _12 = stbi__mad3sizes_valid (4, w, h, 0);
  retval.484 = _12 == 0;
  if (retval.484 != 0) goto <D.16710>; else goto <D.16711>;
  <D.16710>:
  stbi__err ("too large");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16711>:
  if (compression == 0) goto <D.16714>; else goto <D.16712>;
  <D.16714>:
  if (bitdepth == 16) goto <D.16715>; else goto <D.16712>;
  <D.16715>:
  if (bpc == 16) goto <D.16716>; else goto <D.16712>;
  <D.16716>:
  out = stbi__malloc_mad3 (8, w, h, 0);
  ri->bits_per_channel = 16;
  goto <D.16713>;
  <D.16712>:
  _13 = w * h;
  _14 = _13 * 4;
  _15 = (long long unsigned int) _14;
  out = stbi__malloc (_15);
  <D.16713>:
  if (out == 0B) goto <D.16717>; else goto <D.16718>;
  <D.16717>:
  stbi__err ("outofmem");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16718>:
  pixelCount = w * h;
  if (compression != 0) goto <D.16719>; else goto <D.16720>;
  <D.16719>:
  _16 = h * channelCount;
  _17 = _16 * 2;
  stbi__skip (s, _17);
  channel = 0;
  <D.16721>:
  if (channel > 3) goto <D.12779>; else goto <D.16722>;
  <D.16722>:
  _18 = (sizetype) channel;
  p = out + _18;
  if (channel >= channelCount) goto <D.16723>; else goto <D.16724>;
  <D.16723>:
  i = 0;
  <D.16725>:
  if (i >= pixelCount) goto <D.12781>; else goto <D.16726>;
  <D.16726>:
  if (channel == 3) goto <D.16728>; else goto <D.16729>;
  <D.16728>:
  iftmp.485 = 255;
  goto <D.16730>;
  <D.16729>:
  iftmp.485 = 0;
  <D.16730>:
  *p = iftmp.485;
  i = i + 1;
  p = p + 4;
  goto <D.16725>;
  <D.12781>:
  goto <D.16731>;
  <D.16724>:
  D.16814 = stbi__psd_decode_rle (s, p, pixelCount);
  _19 = D.16814;
  retval.486 = _19 == 0;
  if (retval.486 != 0) goto <D.16733>; else goto <D.16734>;
  <D.16733>:
  free (out);
  stbi__err ("corrupt");
  D.16689 = 0B;
  goto <D.16802>;
  <D.16734>:
  <D.16731>:
  channel = channel + 1;
  goto <D.16721>;
  <D.12779>:
  goto <D.16735>;
  <D.16720>:
  channel = 0;
  <D.16736>:
  if (channel > 3) goto <D.12783>; else goto <D.16737>;
  <D.16737>:
  if (channel >= channelCount) goto <D.16738>; else goto <D.16739>;
  <D.16738>:
  if (bitdepth == 16) goto <D.16742>; else goto <D.16740>;
  <D.16742>:
  if (bpc == 16) goto <D.16743>; else goto <D.16740>;
  <D.16743>:
  _20 = (long long unsigned int) channel;
  _21 = _20 * 2;
  q = out + _21;
  if (channel == 3) goto <D.16745>; else goto <D.16746>;
  <D.16745>:
  iftmp.487 = 65535;
  goto <D.16747>;
  <D.16746>:
  iftmp.487 = 0;
  <D.16747>:
  val = iftmp.487;
  i = 0;
  <D.16748>:
  if (i >= pixelCount) goto <D.12785>; else goto <D.16749>;
  <D.16749>:
  *q = val;
  i = i + 1;
  q = q + 8;
  goto <D.16748>;
  <D.12785>:
  goto <D.16741>;
  <D.16740>:
  _22 = (sizetype) channel;
  p = out + _22;
  if (channel == 3) goto <D.16751>; else goto <D.16752>;
  <D.16751>:
  iftmp.488 = 255;
  goto <D.16753>;
  <D.16752>:
  iftmp.488 = 0;
  <D.16753>:
  val = iftmp.488;
  i = 0;
  <D.16754>:
  if (i >= pixelCount) goto <D.12787>; else goto <D.16755>;
  <D.16755>:
  *p = val;
  i = i + 1;
  p = p + 4;
  goto <D.16754>;
  <D.12787>:
  <D.16741>:
  goto <D.16756>;
  <D.16739>:
  _23 = ri->bits_per_channel;
  if (_23 == 16) goto <D.16757>; else goto <D.16758>;
  <D.16757>:
  _24 = (long long unsigned int) channel;
  _25 = _24 * 2;
  q = out + _25;
  i = 0;
  <D.16759>:
  if (i >= pixelCount) goto <D.12789>; else goto <D.16760>;
  <D.16760>:
  D.16815 = stbi__get16be (s);
  _26 = D.16815;
  _27 = (short unsigned int) _26;
  *q = _27;
  i = i + 1;
  q = q + 8;
  goto <D.16759>;
  <D.12789>:
  goto <D.16761>;
  <D.16758>:
  _28 = (sizetype) channel;
  p = out + _28;
  if (bitdepth == 16) goto <D.16762>; else goto <D.16763>;
  <D.16762>:
  i = 0;
  <D.16764>:
  if (i >= pixelCount) goto <D.12791>; else goto <D.16765>;
  <D.16765>:
  D.16816 = stbi__get16be (s);
  _29 = D.16816;
  _30 = _29 >> 8;
  _31 = (unsigned char) _30;
  *p = _31;
  i = i + 1;
  p = p + 4;
  goto <D.16764>;
  <D.12791>:
  goto <D.16766>;
  <D.16763>:
  i = 0;
  <D.16767>:
  if (i >= pixelCount) goto <D.12793>; else goto <D.16768>;
  <D.16768>:
  D.16817 = stbi__get8 (s);
  _32 = D.16817;
  *p = _32;
  i = i + 1;
  p = p + 4;
  goto <D.16767>;
  <D.12793>:
  <D.16766>:
  <D.16761>:
  <D.16756>:
  channel = channel + 1;
  goto <D.16736>;
  <D.12783>:
  <D.16735>:
  if (channelCount > 3) goto <D.16769>; else goto <D.16770>;
  <D.16769>:
  _33 = ri->bits_per_channel;
  if (_33 == 16) goto <D.16771>; else goto <D.16772>;
  <D.16771>:
  i = 0;
  <D.16773>:
  _34 = w * h;
  if (i >= _34) goto <D.12795>; else goto <D.16774>;
  <D.16774>:
  _35 = i * 4;
  _36 = (long long unsigned int) _35;
  _37 = _36 * 2;
  pixel = out + _37;
  _38 = pixel + 6;
  _39 = *_38;
  if (_39 != 0) goto <D.16775>; else goto <D.16776>;
  <D.16775>:
  _40 = pixel + 6;
  _41 = *_40;
  if (_41 != 65535) goto <D.16777>; else goto <D.16778>;
  <D.16777>:
  _42 = pixel + 6;
  _43 = *_42;
  _44 = (int) _43;
  _45 = (float) _44;
  a = _45 / 6.5535e+4;
  ra = 1.0e+0 / a;
  _46 = 1.0e+0 - ra;
  inv_a = _46 * 6.5535e+4;
  _47 = *pixel;
  _48 = (int) _47;
  _49 = (float) _48;
  _50 = ra * _49;
  _51 = inv_a + _50;
  _52 = (short unsigned int) _51;
  *pixel = _52;
  _53 = pixel + 2;
  _54 = *_53;
  _55 = (int) _54;
  _56 = (float) _55;
  _57 = ra * _56;
  _58 = inv_a + _57;
  _59 = pixel + 2;
  _60 = (short unsigned int) _58;
  *_59 = _60;
  _61 = pixel + 4;
  _62 = *_61;
  _63 = (int) _62;
  _64 = (float) _63;
  _65 = ra * _64;
  _66 = inv_a + _65;
  _67 = pixel + 4;
  _68 = (short unsigned int) _66;
  *_67 = _68;
  goto <D.16779>;
  <D.16778>:
  <D.16779>:
  <D.16776>:
  i = i + 1;
  goto <D.16773>;
  <D.12795>:
  goto <D.16780>;
  <D.16772>:
  i = 0;
  <D.16781>:
  _69 = w * h;
  if (i >= _69) goto <D.12797>; else goto <D.16782>;
  <D.16782>:
  _70 = i * 4;
  _71 = (sizetype) _70;
  pixel = out + _71;
  _72 = pixel + 3;
  _73 = *_72;
  if (_73 != 0) goto <D.16783>; else goto <D.16784>;
  <D.16783>:
  _74 = pixel + 3;
  _75 = *_74;
  if (_75 != 255) goto <D.16785>; else goto <D.16786>;
  <D.16785>:
  _76 = pixel + 3;
  _77 = *_76;
  _78 = (int) _77;
  _79 = (float) _78;
  a = _79 / 2.55e+2;
  ra = 1.0e+0 / a;
  _80 = 1.0e+0 - ra;
  inv_a = _80 * 2.55e+2;
  _81 = *pixel;
  _82 = (int) _81;
  _83 = (float) _82;
  _84 = ra * _83;
  _85 = inv_a + _84;
  _86 = (unsigned char) _85;
  *pixel = _86;
  _87 = pixel + 1;
  _88 = *_87;
  _89 = (int) _88;
  _90 = (float) _89;
  _91 = ra * _90;
  _92 = inv_a + _91;
  _93 = pixel + 1;
  _94 = (unsigned char) _92;
  *_93 = _94;
  _95 = pixel + 2;
  _96 = *_95;
  _97 = (int) _96;
  _98 = (float) _97;
  _99 = ra * _98;
  _100 = inv_a + _99;
  _101 = pixel + 2;
  _102 = (unsigned char) _100;
  *_101 = _102;
  goto <D.16787>;
  <D.16786>:
  <D.16787>:
  <D.16784>:
  i = i + 1;
  goto <D.16781>;
  <D.12797>:
  <D.16780>:
  goto <D.16788>;
  <D.16770>:
  <D.16788>:
  if (req_comp != 0) goto <D.16789>; else goto <D.16790>;
  <D.16789>:
  if (req_comp != 4) goto <D.16791>; else goto <D.16792>;
  <D.16791>:
  _103 = ri->bits_per_channel;
  if (_103 == 16) goto <D.16793>; else goto <D.16794>;
  <D.16793>:
  h.489_104 = (unsigned int) h;
  w.490_105 = (unsigned int) w;
  D.16818 = stbi__convert_format16 (out, 4, req_comp, w.490_105, h.489_104);
  out = D.16818;
  goto <D.16795>;
  <D.16794>:
  h.491_106 = (unsigned int) h;
  w.492_107 = (unsigned int) w;
  D.16819 = stbi__convert_format (out, 4, req_comp, w.492_107, h.491_106);
  out = D.16819;
  <D.16795>:
  if (out == 0B) goto <D.16796>; else goto <D.16797>;
  <D.16796>:
  D.16689 = out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16802>;
  <D.16797>:
  goto <D.16798>;
  <D.16792>:
  <D.16798>:
  <D.16790>:
  if (comp != 0B) goto <D.16799>; else goto <D.16800>;
  <D.16799>:
  *comp = 4;
  goto <D.16801>;
  <D.16800>:
  <D.16801>:
  *y = h;
  *x = w;
  D.16689 = out;
  goto <D.16802>;
  <D.16802>:
  return D.16689;
}



;; Function stbi__pic_is4 (_ZL13stbi__pic_is4P13stbi__contextPKc, funcdef_no=933, decl_uid=12801, cgraph_uid=839, symbol_order=869)

stbi__pic_is4 (struct stbi__context * s, const char * str)
{
  unsigned char D.16827;
  int i;
  int D.16825;
  bool retval.493;

  i = 0;
  <D.16820>:
  if (i > 3) goto <D.12804>; else goto <D.16821>;
  <D.16821>:
  D.16827 = stbi__get8 (s);
  _1 = D.16827;
  _2 = (sizetype) i;
  _3 = str + _2;
  _4 = *_3;
  _5 = (unsigned char) _4;
  retval.493 = _1 != _5;
  if (retval.493 != 0) goto <D.16823>; else goto <D.16824>;
  <D.16823>:
  D.16825 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16826>;
  <D.16824>:
  i = i + 1;
  goto <D.16820>;
  <D.12804>:
  D.16825 = 1;
  goto <D.16826>;
  <D.16826>:
  return D.16825;
}



;; Function stbi__pic_test_core (_ZL19stbi__pic_test_coreP13stbi__context, funcdef_no=934, decl_uid=12807, cgraph_uid=840, symbol_order=870)

stbi__pic_test_core (struct stbi__context * s)
{
  int D.16839;
  int D.16838;
  int i;
  bool retval.495;
  int D.16831;
  bool retval.494;

  D.16838 = stbi__pic_is4 (s, "S\x80\xf64");
  _1 = D.16838;
  retval.494 = _1 == 0;
  if (retval.494 != 0) goto <D.16829>; else goto <D.16830>;
  <D.16829>:
  D.16831 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16837>;
  <D.16830>:
  i = 0;
  <D.16832>:
  if (i > 83) goto <D.12810>; else goto <D.16833>;
  <D.16833>:
  stbi__get8 (s);
  i = i + 1;
  goto <D.16832>;
  <D.12810>:
  D.16839 = stbi__pic_is4 (s, "PICT");
  _2 = D.16839;
  retval.495 = _2 == 0;
  if (retval.495 != 0) goto <D.16835>; else goto <D.16836>;
  <D.16835>:
  D.16831 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16837>;
  <D.16836>:
  D.16831 = 1;
  goto <D.16837>;
  <D.16837>:
  return D.16831;
}



;; Function stbi__readval (_ZL13stbi__readvalP13stbi__contextiPh, funcdef_no=935, decl_uid=12821, cgraph_uid=841, symbol_order=871)

stbi__readval (struct stbi__context * s, int channel, stbi_uc * dest)
{
  unsigned char D.16851;
  int D.16850;
  int i;
  int mask;
  stbi_uc * D.16847;
  bool retval.496;

  mask = 128;
  i = 0;
  <D.16840>:
  if (i > 3) goto <D.12825>; else goto <D.16841>;
  <D.16841>:
  _1 = channel & mask;
  if (_1 != 0) goto <D.16842>; else goto <D.16843>;
  <D.16842>:
  D.16850 = stbi__at_eof (s);
  _2 = D.16850;
  retval.496 = _2 != 0;
  if (retval.496 != 0) goto <D.16845>; else goto <D.16846>;
  <D.16845>:
  stbi__err ("bad file");
  D.16847 = 0B;
  goto <D.16849>;
  <D.16846>:
  _3 = (sizetype) i;
  _4 = dest + _3;
  D.16851 = stbi__get8 (s);
  _5 = D.16851;
  *_4 = _5;
  goto <D.16848>;
  <D.16843>:
  <D.16848>:
  i = i + 1;
  mask = mask >> 1;
  goto <D.16840>;
  <D.12825>:
  D.16847 = dest;
  goto <D.16849>;
  <D.16849>:
  return D.16847;
}



;; Function stbi__copyval (_ZL13stbi__copyvaliPhPKh, funcdef_no=936, decl_uid=12830, cgraph_uid=842, symbol_order=872)

stbi__copyval (int channel, stbi_uc * dest, const stbi_uc * src)
{
  int i;
  int mask;

  mask = 128;
  i = 0;
  <D.16852>:
  if (i > 3) goto <D.12834>; else goto <D.16853>;
  <D.16853>:
  _1 = channel & mask;
  if (_1 != 0) goto <D.16854>; else goto <D.16855>;
  <D.16854>:
  _2 = (sizetype) i;
  _3 = src + _2;
  _4 = (sizetype) i;
  _5 = dest + _4;
  _6 = *_3;
  *_5 = _6;
  goto <D.16856>;
  <D.16855>:
  <D.16856>:
  i = i + 1;
  mask = mask >> 1;
  goto <D.16852>;
  <D.12834>:
  return;
}



;; Function stbi__pic_load_core (_ZL19stbi__pic_load_coreP13stbi__contextiiPiPh, funcdef_no=937, decl_uid=12841, cgraph_uid=843, symbol_order=873)

stbi__pic_load_core (struct stbi__context * s, int width, int height, int * comp, stbi_uc * result)
{
  stbi_uc * D.16938;
  stbi_uc * D.16934;
  int D.16933;
  int D.16932;
  unsigned char D.16931;
  stbi_uc * D.16927;
  int D.16926;
  stbi_uc D.16925;
  stbi_uc * D.16924;
  int D.16923;
  unsigned char D.16922;
  unsigned char D.16921;
  unsigned char D.16920;
  unsigned char D.16919;
  stbi_uc value[4];
  int i;
  int count;
  int left;
  stbi_uc value[4];
  stbi_uc count;
  int i;
  int left;
  int x;
  stbi_uc * dest;
  struct stbi__pic_packet * packet;
  int packet_idx;
  struct stbi__pic_packet * packet;
  struct stbi__pic_packet packets[10];
  int chained;
  int y;
  int num_packets;
  int act_comp;
  bool retval.505;
  bool retval.504;
  bool retval.503;
  bool retval.502;
  bool retval.501;
  bool retval.500;
  int iftmp.499;
  bool retval.498;
  stbi_uc * D.16860;

  act_comp = 0;
  num_packets = 0;
  <D.16857>:
  if (num_packets == 10) goto <D.16858>; else goto <D.16859>;
  <D.16858>:
  stbi__err ("bad format");
  D.16860 = 0B;
  goto <D.16940>;
  <D.16859>:
  num_packets.497_1 = num_packets;
  num_packets = num_packets.497_1 + 1;
  packet = &packets[num_packets.497_1];
  D.16919 = stbi__get8 (s);
  _2 = D.16919;
  chained = (int) _2;
  D.16920 = stbi__get8 (s);
  _3 = D.16920;
  packet->size = _3;
  D.16921 = stbi__get8 (s);
  _4 = D.16921;
  packet->type = _4;
  D.16922 = stbi__get8 (s);
  _5 = D.16922;
  packet->channel = _5;
  _6 = packet->channel;
  _7 = (int) _6;
  act_comp = act_comp | _7;
  D.16923 = stbi__at_eof (s);
  _8 = D.16923;
  retval.498 = _8 != 0;
  if (retval.498 != 0) goto <D.16862>; else goto <D.16863>;
  <D.16862>:
  stbi__err ("bad file");
  D.16860 = 0B;
  goto <D.16940>;
  <D.16863>:
  _9 = packet->size;
  if (_9 != 8) goto <D.16864>; else goto <D.16865>;
  <D.16864>:
  stbi__err ("bad format");
  D.16860 = 0B;
  goto <D.16940>;
  <D.16865>:
  if (chained == 0) goto <D.12898>; else goto <D.16866>;
  <D.16866>:
  goto <D.16857>;
  <D.12898>:
  _10 = act_comp & 16;
  if (_10 != 0) goto <D.16868>; else goto <D.16869>;
  <D.16868>:
  iftmp.499 = 4;
  goto <D.16870>;
  <D.16869>:
  iftmp.499 = 3;
  <D.16870>:
  *comp = iftmp.499;
  y = 0;
  <D.16871>:
  if (y >= height) goto <D.12900>; else goto <D.16872>;
  <D.16872>:
  packet_idx = 0;
  <D.16873>:
  if (packet_idx >= num_packets) goto <D.12902>; else goto <D.16874>;
  <D.16874>:
  packet = &packets[packet_idx];
  _11 = y * width;
  _12 = _11 * 4;
  _13 = (sizetype) _12;
  dest = result + _13;
  _14 = packet->type;
  _15 = (int) _14;
  switch (_15) <default: <D.12885>, case 0: <D.12886>, case 1: <D.12888>, case 2: <D.12893>>
  <D.12885>:
  stbi__err ("bad format");
  D.16860 = 0B;
  goto <D.16940>;
  <D.12886>:
  x = 0;
  <D.16875>:
  if (x >= width) goto <D.12905>; else goto <D.16876>;
  <D.16876>:
  _16 = packet->channel;
  _17 = (int) _16;
  D.16924 = stbi__readval (s, _17, dest);
  _18 = D.16924;
  retval.500 = _18 == 0B;
  if (retval.500 != 0) goto <D.16878>; else goto <D.16879>;
  <D.16878>:
  D.16860 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16940>;
  <D.16879>:
  x = x + 1;
  dest = dest + 4;
  goto <D.16875>;
  <D.12905>:
  goto <D.12904>;
  <D.12888>:
  left = width;
  <D.16880>:
  if (left <= 0) goto <D.12907>; else goto <D.16881>;
  <D.16881>:
  D.16925 = stbi__get8 (s);
  count = D.16925;
  D.16926 = stbi__at_eof (s);
  _19 = D.16926;
  retval.501 = _19 != 0;
  if (retval.501 != 0) goto <D.16883>; else goto <D.16884>;
  <D.16883>:
  stbi__err ("bad file");
  D.16860 = 0B;
  goto <D.16930>;
  <D.16884>:
  _20 = (int) count;
  if (left < _20) goto <D.16885>; else goto <D.16886>;
  <D.16885>:
  count = (stbi_uc) left;
  goto <D.16887>;
  <D.16886>:
  <D.16887>:
  _21 = packet->channel;
  _22 = (int) _21;
  D.16927 = stbi__readval (s, _22, &value);
  _23 = D.16927;
  retval.502 = _23 == 0B;
  if (retval.502 != 0) goto <D.16889>; else goto <D.16890>;
  <D.16889>:
  D.16860 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16930>;
  <D.16890>:
  i = 0;
  <D.16891>:
  _24 = (int) count;
  if (i >= _24) goto <D.12909>; else goto <D.16892>;
  <D.16892>:
  _25 = packet->channel;
  _26 = (int) _25;
  stbi__copyval (_26, dest, &value);
  i = i + 1;
  dest = dest + 4;
  goto <D.16891>;
  <D.12909>:
  _27 = (int) count;
  left = left - _27;
  value = {CLOBBER};
  goto <D.16929>;
  <D.16930>:
  value = {CLOBBER};
  goto <D.16940>;
  <D.16929>:
  goto <D.16880>;
  <D.12907>:
  goto <D.12904>;
  <D.12893>:
  left = width;
  <D.16893>:
  if (left <= 0) goto <D.12911>; else goto <D.16894>;
  <D.16894>:
  D.16931 = stbi__get8 (s);
  _28 = D.16931;
  count = (int) _28;
  D.16932 = stbi__at_eof (s);
  _29 = D.16932;
  retval.503 = _29 != 0;
  if (retval.503 != 0) goto <D.16896>; else goto <D.16897>;
  <D.16896>:
  stbi__err ("bad file");
  D.16860 = 0B;
  goto <D.16940>;
  <D.16897>:
  if (count > 127) goto <D.16898>; else goto <D.16899>;
  <D.16898>:
  if (count == 128) goto <D.16900>; else goto <D.16901>;
  <D.16900>:
  D.16933 = stbi__get16be (s);
  count = D.16933;
  goto <D.16902>;
  <D.16901>:
  count = count + -127;
  <D.16902>:
  if (count > left) goto <D.16903>; else goto <D.16904>;
  <D.16903>:
  stbi__err ("bad file");
  D.16860 = 0B;
  goto <D.16937>;
  <D.16904>:
  _30 = packet->channel;
  _31 = (int) _30;
  D.16934 = stbi__readval (s, _31, &value);
  _32 = D.16934;
  retval.504 = _32 == 0B;
  if (retval.504 != 0) goto <D.16906>; else goto <D.16907>;
  <D.16906>:
  D.16860 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16937>;
  <D.16907>:
  i = 0;
  <D.16908>:
  if (i >= count) goto <D.12913>; else goto <D.16909>;
  <D.16909>:
  _33 = packet->channel;
  _34 = (int) _33;
  stbi__copyval (_34, dest, &value);
  i = i + 1;
  dest = dest + 4;
  goto <D.16908>;
  <D.12913>:
  value = {CLOBBER};
  goto <D.16936>;
  <D.16937>:
  value = {CLOBBER};
  goto <D.16940>;
  <D.16936>:
  goto <D.16910>;
  <D.16899>:
  count = count + 1;
  if (count > left) goto <D.16911>; else goto <D.16912>;
  <D.16911>:
  stbi__err ("bad file");
  D.16860 = 0B;
  goto <D.16940>;
  <D.16912>:
  i = 0;
  <D.16913>:
  if (i >= count) goto <D.12915>; else goto <D.16914>;
  <D.16914>:
  _35 = packet->channel;
  _36 = (int) _35;
  D.16938 = stbi__readval (s, _36, dest);
  _37 = D.16938;
  retval.505 = _37 == 0B;
  if (retval.505 != 0) goto <D.16916>; else goto <D.16917>;
  <D.16916>:
  D.16860 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16940>;
  <D.16917>:
  i = i + 1;
  dest = dest + 4;
  goto <D.16913>;
  <D.12915>:
  <D.16910>:
  left = left - count;
  goto <D.16893>;
  <D.12911>:
  goto <D.12904>;
  <D.12904>:
  packet_idx = packet_idx + 1;
  goto <D.16873>;
  <D.12902>:
  y = y + 1;
  goto <D.16871>;
  <D.12900>:
  D.16860 = result;
  goto <D.16940>;
  <D.16940>:
  packets = {CLOBBER};
  goto <D.16918>;
  <D.16918>:
  return D.16860;
  <D.16928>:
  value = {CLOBBER};
  resx 2
  <D.16935>:
  value = {CLOBBER};
  resx 4
  <D.16939>:
  packets = {CLOBBER};
  resx 1
}



;; Function stbi__pic_load (_ZL14stbi__pic_loadP13stbi__contextPiS1_S1_iP17stbi__result_info, funcdef_no=938, decl_uid=10210, cgraph_uid=844, symbol_order=874)

stbi__pic_load (struct stbi__context * s, int * px, int * py, int * comp, int req_comp, struct stbi__result_info * ri)
{
  stbi_uc * D.16969;
  stbi_uc * D.16968;
  int D.16967;
  int D.16966;
  int D.16965;
  int internal_comp;
  int y;
  int x;
  int i;
  stbi_uc * result;
  bool retval.508;
  bool retval.507;
  bool retval.506;
  void * D.16948;

  if (comp == 0B) goto <D.16941>; else goto <D.16942>;
  <D.16941>:
  comp = &internal_comp;
  goto <D.16943>;
  <D.16942>:
  <D.16943>:
  i = 0;
  <D.16944>:
  if (i > 91) goto <D.12930>; else goto <D.16945>;
  <D.16945>:
  stbi__get8 (s);
  i = i + 1;
  goto <D.16944>;
  <D.12930>:
  D.16965 = stbi__get16be (s);
  x = D.16965;
  D.16966 = stbi__get16be (s);
  y = D.16966;
  if (y > 16777216) goto <D.16946>; else goto <D.16947>;
  <D.16946>:
  stbi__err ("too large");
  D.16948 = 0B;
  goto <D.16971>;
  <D.16947>:
  if (x > 16777216) goto <D.16949>; else goto <D.16950>;
  <D.16949>:
  stbi__err ("too large");
  D.16948 = 0B;
  goto <D.16971>;
  <D.16950>:
  D.16967 = stbi__at_eof (s);
  _1 = D.16967;
  retval.506 = _1 != 0;
  if (retval.506 != 0) goto <D.16952>; else goto <D.16953>;
  <D.16952>:
  stbi__err ("bad file");
  D.16948 = 0B;
  goto <D.16971>;
  <D.16953>:
  _2 = stbi__mad3sizes_valid (x, y, 4, 0);
  retval.507 = _2 == 0;
  if (retval.507 != 0) goto <D.16955>; else goto <D.16956>;
  <D.16955>:
  stbi__err ("too large");
  D.16948 = 0B;
  goto <D.16971>;
  <D.16956>:
  stbi__get32be (s);
  stbi__get16be (s);
  stbi__get16be (s);
  result = stbi__malloc_mad3 (x, y, 4, 0);
  _3 = x * y;
  _4 = _3 * 4;
  _5 = (long long unsigned int) _4;
  memset (result, 255, _5);
  D.16968 = stbi__pic_load_core (s, x, y, comp, result);
  _6 = D.16968;
  retval.508 = _6 == 0B;
  if (retval.508 != 0) goto <D.16958>; else goto <D.16959>;
  <D.16958>:
  free (result);
  result = 0B;
  goto <D.16960>;
  <D.16959>:
  <D.16960>:
  *px = x;
  *py = y;
  if (req_comp == 0) goto <D.16961>; else goto <D.16962>;
  <D.16961>:
  req_comp = *comp;
  goto <D.16963>;
  <D.16962>:
  <D.16963>:
  y.509_7 = (unsigned int) y;
  x.510_8 = (unsigned int) x;
  D.16969 = stbi__convert_format (result, 4, req_comp, x.510_8, y.509_7);
  result = D.16969;
  D.16948 = result;
  goto <D.16971>;
  <D.16971>:
  internal_comp = {CLOBBER};
  goto <D.16964>;
  <D.16964>:
  return D.16948;
  <D.16970>:
  internal_comp = {CLOBBER};
  resx 1
}



;; Function stbi__pic_test (_ZL14stbi__pic_testP13stbi__context, funcdef_no=939, decl_uid=10203, cgraph_uid=845, symbol_order=875)

stbi__pic_test (struct stbi__context * s)
{
  int D.16974;
  int r;
  int D.16972;

  D.16974 = stbi__pic_test_core (s);
  r = D.16974;
  stbi__rewind (s);
  D.16972 = r;
  goto <D.16973>;
  <D.16973>:
  return D.16972;
}



;; Function stbi__gif_test_raw (_ZL18stbi__gif_test_rawP13stbi__context, funcdef_no=940, decl_uid=12971, cgraph_uid=846, symbol_order=876)

stbi__gif_test_raw (struct stbi__context * s)
{
  unsigned char D.16999;
  unsigned char D.16998;
  unsigned char D.16997;
  unsigned char D.16996;
  unsigned char D.16995;
  unsigned char D.16994;
  int sz;
  bool retval.513;
  int D.16985;
  bool iftmp.512;
  bool retval.511;

  D.16994 = stbi__get8 (s);
  _1 = D.16994;
  if (_1 != 71) goto <D.16977>; else goto <D.16980>;
  <D.16980>:
  D.16995 = stbi__get8 (s);
  _2 = D.16995;
  if (_2 != 73) goto <D.16977>; else goto <D.16981>;
  <D.16981>:
  D.16996 = stbi__get8 (s);
  _3 = D.16996;
  if (_3 != 70) goto <D.16977>; else goto <D.16982>;
  <D.16982>:
  D.16997 = stbi__get8 (s);
  _4 = D.16997;
  if (_4 != 56) goto <D.16977>; else goto <D.16978>;
  <D.16977>:
  iftmp.512 = 1;
  goto <D.16979>;
  <D.16978>:
  iftmp.512 = 0;
  <D.16979>:
  retval.511 = iftmp.512;
  if (retval.511 != 0) goto <D.16983>; else goto <D.16984>;
  <D.16983>:
  D.16985 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16993>;
  <D.16984>:
  D.16998 = stbi__get8 (s);
  _5 = D.16998;
  sz = (int) _5;
  if (sz != 57) goto <D.16986>; else goto <D.16987>;
  <D.16986>:
  if (sz != 55) goto <D.16988>; else goto <D.16989>;
  <D.16988>:
  D.16985 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16993>;
  <D.16989>:
  <D.16987>:
  D.16999 = stbi__get8 (s);
  _6 = D.16999;
  retval.513 = _6 != 97;
  if (retval.513 != 0) goto <D.16991>; else goto <D.16992>;
  <D.16991>:
  D.16985 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.16993>;
  <D.16992>:
  D.16985 = 1;
  goto <D.16993>;
  <D.16993>:
  return D.16985;
}



;; Function stbi__gif_test (_ZL14stbi__gif_testP13stbi__context, funcdef_no=941, decl_uid=10217, cgraph_uid=847, symbol_order=877)

stbi__gif_test (struct stbi__context * s)
{
  int D.17002;
  int r;
  int D.17000;

  D.17002 = stbi__gif_test_raw (s);
  r = D.17002;
  stbi__rewind (s);
  D.17000 = r;
  goto <D.17001>;
  <D.17001>:
  return D.17000;
}



;; Function stbi__gif_parse_colortable (_ZL26stbi__gif_parse_colortableP13stbi__contextPA4_hii, funcdef_no=942, decl_uid=12982, cgraph_uid=848, symbol_order=878)

stbi__gif_parse_colortable (struct stbi__context * s, stbi_uc[4] * pal, int num_entries, int transp)
{
  unsigned char D.17011;
  unsigned char D.17010;
  unsigned char D.17009;
  int i;
  stbi_uc iftmp.514;

  i = 0;
  <D.17003>:
  if (i >= num_entries) goto <D.12985>; else goto <D.17004>;
  <D.17004>:
  _1 = (long long unsigned int) i;
  _2 = _1 * 4;
  _3 = pal + _2;
  D.17009 = stbi__get8 (s);
  _4 = D.17009;
  *_3[2] = _4;
  _5 = (long long unsigned int) i;
  _6 = _5 * 4;
  _7 = pal + _6;
  D.17010 = stbi__get8 (s);
  _8 = D.17010;
  *_7[1] = _8;
  _9 = (long long unsigned int) i;
  _10 = _9 * 4;
  _11 = pal + _10;
  D.17011 = stbi__get8 (s);
  _12 = D.17011;
  *_11[0] = _12;
  if (transp == i) goto <D.17006>; else goto <D.17007>;
  <D.17006>:
  iftmp.514 = 0;
  goto <D.17008>;
  <D.17007>:
  iftmp.514 = 255;
  <D.17008>:
  _13 = (long long unsigned int) i;
  _14 = _13 * 4;
  _15 = pal + _14;
  *_15[3] = iftmp.514;
  i = i + 1;
  goto <D.17003>;
  <D.12985>:
  return;
}



;; Function stbi__gif_header (_ZL16stbi__gif_headerP13stbi__contextP9stbi__gifPii, funcdef_no=943, decl_uid=12991, cgraph_uid=849, symbol_order=879)

stbi__gif_header (struct stbi__context * s, struct stbi__gif * g, int * comp, int is_info)
{
  unsigned char D.17053;
  unsigned char D.17052;
  unsigned char D.17051;
  int D.17050;
  int D.17049;
  unsigned char D.17048;
  stbi_uc D.17047;
  unsigned char D.17046;
  unsigned char D.17045;
  unsigned char D.17044;
  unsigned char D.17043;
  stbi_uc version;
  bool retval.517;
  int D.17022;
  bool iftmp.516;
  bool retval.515;

  D.17043 = stbi__get8 (s);
  _1 = D.17043;
  if (_1 != 71) goto <D.17014>; else goto <D.17017>;
  <D.17017>:
  D.17044 = stbi__get8 (s);
  _2 = D.17044;
  if (_2 != 73) goto <D.17014>; else goto <D.17018>;
  <D.17018>:
  D.17045 = stbi__get8 (s);
  _3 = D.17045;
  if (_3 != 70) goto <D.17014>; else goto <D.17019>;
  <D.17019>:
  D.17046 = stbi__get8 (s);
  _4 = D.17046;
  if (_4 != 56) goto <D.17014>; else goto <D.17015>;
  <D.17014>:
  iftmp.516 = 1;
  goto <D.17016>;
  <D.17015>:
  iftmp.516 = 0;
  <D.17016>:
  retval.515 = iftmp.516;
  if (retval.515 != 0) goto <D.17020>; else goto <D.17021>;
  <D.17020>:
  D.17022 = stbi__err ("not GIF");
  goto <D.17042>;
  <D.17021>:
  D.17047 = stbi__get8 (s);
  version = D.17047;
  if (version != 55) goto <D.17023>; else goto <D.17024>;
  <D.17023>:
  if (version != 57) goto <D.17025>; else goto <D.17026>;
  <D.17025>:
  D.17022 = stbi__err ("not GIF");
  goto <D.17042>;
  <D.17026>:
  <D.17024>:
  D.17048 = stbi__get8 (s);
  _5 = D.17048;
  retval.517 = _5 != 97;
  if (retval.517 != 0) goto <D.17028>; else goto <D.17029>;
  <D.17028>:
  D.17022 = stbi__err ("not GIF");
  goto <D.17042>;
  <D.17029>:
  stbi__g_failure_reason = "";
  D.17049 = stbi__get16le (s);
  _6 = D.17049;
  g->w = _6;
  D.17050 = stbi__get16le (s);
  _7 = D.17050;
  g->h = _7;
  D.17051 = stbi__get8 (s);
  _8 = D.17051;
  _9 = (int) _8;
  g->flags = _9;
  D.17052 = stbi__get8 (s);
  _10 = D.17052;
  _11 = (int) _10;
  g->bgindex = _11;
  D.17053 = stbi__get8 (s);
  _12 = D.17053;
  _13 = (int) _12;
  g->ratio = _13;
  g->transparent = -1;
  _14 = g->w;
  if (_14 > 16777216) goto <D.17030>; else goto <D.17031>;
  <D.17030>:
  D.17022 = stbi__err ("too large");
  goto <D.17042>;
  <D.17031>:
  _15 = g->h;
  if (_15 > 16777216) goto <D.17032>; else goto <D.17033>;
  <D.17032>:
  D.17022 = stbi__err ("too large");
  goto <D.17042>;
  <D.17033>:
  if (comp != 0B) goto <D.17034>; else goto <D.17035>;
  <D.17034>:
  *comp = 4;
  goto <D.17036>;
  <D.17035>:
  <D.17036>:
  if (is_info != 0) goto <D.17037>; else goto <D.17038>;
  <D.17037>:
  D.17022 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17042>;
  <D.17038>:
  _16 = g->flags;
  _17 = _16 & 128;
  if (_17 != 0) goto <D.17039>; else goto <D.17040>;
  <D.17039>:
  _18 = g->flags;
  _19 = _18 & 7;
  _20 = 2 << _19;
  _21 = &g->pal;
  stbi__gif_parse_colortable (s, _21, _20, -1);
  goto <D.17041>;
  <D.17040>:
  <D.17041>:
  D.17022 = 1;
  goto <D.17042>;
  <D.17042>:
  return D.17022;
}



;; Function stbi__gif_info_raw (_ZL18stbi__gif_info_rawP13stbi__contextPiS1_S1_, funcdef_no=944, decl_uid=12998, cgraph_uid=850, symbol_order=880)

stbi__gif_info_raw (struct stbi__context * s, int * x, int * y, int * comp)
{
  int D.17065;
  struct stbi__gif * g;
  int D.17057;
  bool retval.518;

  g = stbi__malloc (34928);
  D.17065 = stbi__gif_header (s, g, comp, 1);
  _1 = D.17065;
  retval.518 = _1 == 0;
  if (retval.518 != 0) goto <D.17055>; else goto <D.17056>;
  <D.17055>:
  free (g);
  stbi__rewind (s);
  D.17057 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17064>;
  <D.17056>:
  if (x != 0B) goto <D.17058>; else goto <D.17059>;
  <D.17058>:
  _2 = g->w;
  *x = _2;
  goto <D.17060>;
  <D.17059>:
  <D.17060>:
  if (y != 0B) goto <D.17061>; else goto <D.17062>;
  <D.17061>:
  _3 = g->h;
  *y = _3;
  goto <D.17063>;
  <D.17062>:
  <D.17063>:
  free (g);
  D.17057 = 1;
  goto <D.17064>;
  <D.17064>:
  return D.17057;
}



;; Function stbi__out_gif_code (_ZL18stbi__out_gif_codeP9stbi__gift, funcdef_no=945, decl_uid=13003, cgraph_uid=851, symbol_order=881)

stbi__out_gif_code (struct stbi__gif * g, stbi__uint16 code)
{
  int idx;
  stbi_uc * c;
  stbi_uc * p;

  _1 = (int) code;
  _2 = g->codes[_1].prefix;
  if (_2 >= 0) goto <D.17066>; else goto <D.17067>;
  <D.17066>:
  _3 = (int) code;
  _4 = g->codes[_3].prefix;
  _5 = (short unsigned int) _4;
  _6 = (int) _5;
  stbi__out_gif_code (g, _6);
  goto <D.17068>;
  <D.17067>:
  <D.17068>:
  _7 = g->cur_y;
  _8 = g->max_y;
  if (_7 >= _8) goto <D.17069>; else goto <D.17070>;
  <D.17069>:
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17080>;
  <D.17070>:
  _9 = g->cur_x;
  _10 = g->cur_y;
  idx = _9 + _10;
  _11 = g->out;
  _12 = (sizetype) idx;
  p = _11 + _12;
  _13 = g->history;
  _14 = idx / 4;
  _15 = (sizetype) _14;
  _16 = _13 + _15;
  *_16 = 1;
  _17 = g->color_table;
  _18 = (int) code;
  _19 = g->codes[_18].suffix;
  _20 = (int) _19;
  _21 = _20 * 4;
  _22 = (sizetype) _21;
  c = _17 + _22;
  _23 = c + 3;
  _24 = *_23;
  if (_24 > 128) goto <D.17071>; else goto <D.17072>;
  <D.17071>:
  _25 = MEM[(stbi_uc *)c + 2B];
  *p = _25;
  _26 = p + 1;
  _27 = MEM[(stbi_uc *)c + 1B];
  *_26 = _27;
  _28 = p + 2;
  _29 = *c;
  *_28 = _29;
  _30 = p + 3;
  _31 = MEM[(stbi_uc *)c + 3B];
  *_30 = _31;
  goto <D.17073>;
  <D.17072>:
  <D.17073>:
  _32 = g->cur_x;
  _33 = _32 + 4;
  g->cur_x = _33;
  _34 = g->cur_x;
  _35 = g->max_x;
  if (_34 >= _35) goto <D.17074>; else goto <D.17075>;
  <D.17074>:
  _36 = g->start_x;
  g->cur_x = _36;
  _37 = g->cur_y;
  _38 = g->step;
  _39 = _37 + _38;
  g->cur_y = _39;
  <D.17076>:
  _40 = g->cur_y;
  _41 = g->max_y;
  if (_40 < _41) goto <D.13008>; else goto <D.17077>;
  <D.17077>:
  _42 = g->parse;
  if (_42 <= 0) goto <D.13008>; else goto <D.17078>;
  <D.17078>:
  _43 = g->line_size;
  _44 = g->parse;
  _45 = _43 << _44;
  g->step = _45;
  _46 = g->start_y;
  _47 = g->step;
  _48 = _47 >> 1;
  _49 = _46 + _48;
  g->cur_y = _49;
  _50 = g->parse;
  _51 = _50 + -1;
  g->parse = _51;
  goto <D.17076>;
  <D.13008>:
  goto <D.17079>;
  <D.17075>:
  <D.17079>:
  <D.17080>:
  return;
}



;; Function stbi__process_gif_raster (_ZL24stbi__process_gif_rasterP13stbi__contextP9stbi__gif, funcdef_no=946, decl_uid=13012, cgraph_uid=852, symbol_order=882)

stbi__process_gif_raster (struct stbi__context * s, struct stbi__gif * g)
{
  unsigned char D.17128;
  unsigned char D.17127;
  unsigned char D.17126;
  stbi_uc D.17125;
  stbi__int32 code;
  struct stbi__gif_lzw * p;
  stbi__int32 clear;
  stbi__int32 valid_bits;
  stbi__int32 bits;
  stbi__int32 oldcode;
  stbi__int32 avail;
  stbi__int32 codemask;
  stbi__int32 codesize;
  stbi__uint32 first;
  stbi__int32 init_code;
  stbi__int32 len;
  stbi_uc lzw_cs;
  stbi_uc iftmp.521;
  bool retval.519;
  stbi__int32 D.13026;
  stbi_uc * D.17083;

  D.17125 = stbi__get8 (s);
  lzw_cs = D.17125;
  if (lzw_cs > 12) goto <D.17081>; else goto <D.17082>;
  <D.17081>:
  D.17083 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17124>;
  <D.17082>:
  _1 = (int) lzw_cs;
  clear = 1 << _1;
  first = 1;
  _2 = (int) lzw_cs;
  codesize = _2 + 1;
  _3 = 1 << codesize;
  codemask = _3 + -1;
  bits = 0;
  valid_bits = 0;
  init_code = 0;
  <D.17084>:
  if (init_code >= clear) goto <D.13028>; else goto <D.17085>;
  <D.17085>:
  g->codes[init_code].prefix = -1;
  _4 = (unsigned char) init_code;
  g->codes[init_code].first = _4;
  _5 = (unsigned char) init_code;
  g->codes[init_code].suffix = _5;
  init_code = init_code + 1;
  goto <D.17084>;
  <D.13028>:
  avail = clear + 2;
  oldcode = -1;
  len = 0;
  <D.17086>:
  if (valid_bits < codesize) goto <D.17087>; else goto <D.17088>;
  <D.17087>:
  if (len == 0) goto <D.17089>; else goto <D.17090>;
  <D.17089>:
  D.17126 = stbi__get8 (s);
  _6 = D.17126;
  len = (stbi__int32) _6;
  if (len == 0) goto <D.17091>; else goto <D.17092>;
  <D.17091>:
  D.17083 = g->out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17124>;
  <D.17092>:
  goto <D.17093>;
  <D.17090>:
  <D.17093>:
  len = len + -1;
  D.17127 = stbi__get8 (s);
  _7 = D.17127;
  _8 = (int) _7;
  D.13026 = _8 << valid_bits;
  bits = bits | D.13026;
  valid_bits = valid_bits + 8;
  goto <D.17094>;
  <D.17088>:
  code = bits & codemask;
  bits = bits >> codesize;
  valid_bits = valid_bits - codesize;
  if (code == clear) goto <D.17095>; else goto <D.17096>;
  <D.17095>:
  _9 = (int) lzw_cs;
  codesize = _9 + 1;
  _10 = 1 << codesize;
  codemask = _10 + -1;
  avail = clear + 2;
  oldcode = -1;
  first = 0;
  goto <D.17097>;
  <D.17096>:
  _11 = clear + 1;
  if (code == _11) goto <D.17098>; else goto <D.17099>;
  <D.17098>:
  stbi__skip (s, len);
  <D.17100>:
  D.17128 = stbi__get8 (s);
  _12 = D.17128;
  len = (stbi__int32) _12;
  retval.519 = len > 0;
  if (retval.519 != 0) goto <D.17102>; else goto <D.13032>;
  <D.17102>:
  stbi__skip (s, len);
  goto <D.17100>;
  <D.13032>:
  D.17083 = g->out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17124>;
  <D.17099>:
  if (code <= avail) goto <D.17103>; else goto <D.17104>;
  <D.17103>:
  if (first != 0) goto <D.17105>; else goto <D.17106>;
  <D.17105>:
  stbi__err ("no clear code");
  D.17083 = 0B;
  goto <D.17124>;
  <D.17106>:
  if (oldcode >= 0) goto <D.17107>; else goto <D.17108>;
  <D.17107>:
  avail.520_13 = avail;
  avail = avail.520_13 + 1;
  p = &g->codes[avail.520_13];
  if (avail > 8192) goto <D.17109>; else goto <D.17110>;
  <D.17109>:
  stbi__err ("too many codes");
  D.17083 = 0B;
  goto <D.17124>;
  <D.17110>:
  _14 = (short int) oldcode;
  p->prefix = _14;
  _15 = g->codes[oldcode].first;
  p->first = _15;
  if (code == avail) goto <D.17112>; else goto <D.17113>;
  <D.17112>:
  iftmp.521 = p->first;
  goto <D.17114>;
  <D.17113>:
  iftmp.521 = g->codes[code].first;
  <D.17114>:
  p->suffix = iftmp.521;
  goto <D.17115>;
  <D.17108>:
  if (code == avail) goto <D.17116>; else goto <D.17117>;
  <D.17116>:
  stbi__err ("illegal code in raster");
  D.17083 = 0B;
  goto <D.17124>;
  <D.17117>:
  <D.17115>:
  _16 = (short unsigned int) code;
  _17 = (int) _16;
  stbi__out_gif_code (g, _17);
  _18 = avail & codemask;
  if (_18 == 0) goto <D.17118>; else goto <D.17119>;
  <D.17118>:
  if (avail <= 4095) goto <D.17120>; else goto <D.17121>;
  <D.17120>:
  codesize = codesize + 1;
  _19 = 1 << codesize;
  codemask = _19 + -1;
  goto <D.17122>;
  <D.17121>:
  <D.17122>:
  <D.17119>:
  oldcode = code;
  goto <D.17123>;
  <D.17104>:
  stbi__err ("illegal code in raster");
  D.17083 = 0B;
  goto <D.17124>;
  <D.17123>:
  <D.17097>:
  <D.17094>:
  goto <D.17086>;
  <D.17124>:
  return D.17083;
}



;; Function stbi__gif_load_next (_ZL19stbi__gif_load_nextP13stbi__contextP9stbi__gifPiiPh, funcdef_no=947, decl_uid=13039, cgraph_uid=853, symbol_order=883)

stbi__gif_load_next (struct stbi__context * s, struct stbi__gif * g, int * comp, int req_comp, stbi_uc * two_back)
{
  unsigned char D.17231;
  unsigned char D.17230;
  int D.17229;
  unsigned char D.17228;
  unsigned char D.17227;
  unsigned char D.17226;
  stbi_uc * D.17225;
  unsigned char D.17224;
  stbi__int32 D.17223;
  stbi__int32 D.17222;
  stbi__int32 D.17221;
  stbi__int32 D.17220;
  unsigned char D.17219;
  int D.17218;
  int ext;
  int len;
  stbi_uc * o;
  stbi__int32 h;
  stbi__int32 w;
  stbi__int32 y;
  stbi__int32 x;
  int tag;
  int pcount;
  int pi;
  int first_frame;
  int dispose;
  bool retval.525;
  unsigned int D.17196;
  int iftmp.524;
  unsigned int D.17163;
  unsigned int D.17154;
  bool retval.523;
  stbi_uc * D.17134;
  bool retval.522;

  first_frame = 0;
  _1 = g->out;
  if (_1 == 0B) goto <D.17129>; else goto <D.17130>;
  <D.17129>:
  D.17218 = stbi__gif_header (s, g, comp, 0);
  _2 = D.17218;
  retval.522 = _2 == 0;
  if (retval.522 != 0) goto <D.17132>; else goto <D.17133>;
  <D.17132>:
  D.17134 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17217>;
  <D.17133>:
  _3 = g->h;
  _4 = g->w;
  _5 = stbi__mad3sizes_valid (4, _4, _3, 0);
  retval.523 = _5 == 0;
  if (retval.523 != 0) goto <D.17136>; else goto <D.17137>;
  <D.17136>:
  stbi__err ("too large");
  D.17134 = 0B;
  goto <D.17217>;
  <D.17137>:
  _6 = g->w;
  _7 = g->h;
  pcount = _6 * _7;
  _8 = pcount * 4;
  _9 = (long long unsigned int) _8;
  _10 = stbi__malloc (_9);
  g->out = _10;
  _11 = pcount * 4;
  _12 = (long long unsigned int) _11;
  _13 = stbi__malloc (_12);
  g->background = _13;
  _14 = (long long unsigned int) pcount;
  _15 = stbi__malloc (_14);
  g->history = _15;
  _16 = g->out;
  if (_16 == 0B) goto <D.17138>; else goto <D.17140>;
  <D.17140>:
  _17 = g->background;
  if (_17 == 0B) goto <D.17138>; else goto <D.17141>;
  <D.17141>:
  _18 = g->history;
  if (_18 == 0B) goto <D.17138>; else goto <D.17139>;
  <D.17138>:
  stbi__err ("outofmem");
  D.17134 = 0B;
  goto <D.17217>;
  <D.17139>:
  _19 = pcount * 4;
  _20 = (long long unsigned int) _19;
  _21 = g->out;
  memset (_21, 0, _20);
  _22 = pcount * 4;
  _23 = (long long unsigned int) _22;
  _24 = g->background;
  memset (_24, 0, _23);
  _25 = (long long unsigned int) pcount;
  _26 = g->history;
  memset (_26, 0, _25);
  first_frame = 1;
  goto <D.17142>;
  <D.17130>:
  _27 = g->eflags;
  _28 = _27 >> 2;
  dispose = _28 & 7;
  _29 = g->w;
  _30 = g->h;
  pcount = _29 * _30;
  if (dispose == 3) goto <D.17143>; else goto <D.17144>;
  <D.17143>:
  if (two_back == 0B) goto <D.17145>; else goto <D.17146>;
  <D.17145>:
  dispose = 2;
  goto <D.17147>;
  <D.17146>:
  <D.17147>:
  <D.17144>:
  if (dispose == 3) goto <D.17148>; else goto <D.17149>;
  <D.17148>:
  pi = 0;
  <D.17150>:
  if (pi >= pcount) goto <D.13057>; else goto <D.17151>;
  <D.17151>:
  _31 = g->history;
  _32 = (sizetype) pi;
  _33 = _31 + _32;
  _34 = *_33;
  if (_34 != 0) goto <D.17152>; else goto <D.17153>;
  <D.17152>:
  _35 = pi * 4;
  _36 = (sizetype) _35;
  _37 = two_back + _36;
  _38 = g->out;
  _39 = pi * 4;
  _40 = (sizetype) _39;
  _41 = _38 + _40;
  D.17154 = MEM[(char * {ref-all})_37];
  MEM[(char * {ref-all})_41] = D.17154;
  goto <D.17155>;
  <D.17153>:
  <D.17155>:
  pi = pi + 1;
  goto <D.17150>;
  <D.13057>:
  goto <D.17156>;
  <D.17149>:
  if (dispose == 2) goto <D.17157>; else goto <D.17158>;
  <D.17157>:
  pi = 0;
  <D.17159>:
  if (pi >= pcount) goto <D.13059>; else goto <D.17160>;
  <D.17160>:
  _42 = g->history;
  _43 = (sizetype) pi;
  _44 = _42 + _43;
  _45 = *_44;
  if (_45 != 0) goto <D.17161>; else goto <D.17162>;
  <D.17161>:
  _46 = g->background;
  _47 = pi * 4;
  _48 = (sizetype) _47;
  _49 = _46 + _48;
  _50 = g->out;
  _51 = pi * 4;
  _52 = (sizetype) _51;
  _53 = _50 + _52;
  D.17163 = MEM[(char * {ref-all})_49];
  MEM[(char * {ref-all})_53] = D.17163;
  goto <D.17164>;
  <D.17162>:
  <D.17164>:
  pi = pi + 1;
  goto <D.17159>;
  <D.13059>:
  goto <D.17165>;
  <D.17158>:
  <D.17165>:
  <D.17156>:
  _54 = g->w;
  _55 = g->h;
  _56 = _54 * _55;
  _57 = _56 * 4;
  _58 = (long long unsigned int) _57;
  _59 = g->out;
  _60 = g->background;
  memcpy (_60, _59, _58);
  <D.17142>:
  _61 = g->w;
  _62 = g->h;
  _63 = _61 * _62;
  _64 = (long long unsigned int) _63;
  _65 = g->history;
  memset (_65, 0, _64);
  <D.17166>:
  D.17219 = stbi__get8 (s);
  _66 = D.17219;
  tag = (int) _66;
  switch (tag) <default: <D.13056>, case 33: <D.13052>, case 44: <D.13046>, case 59: <D.13055>>
  <D.13046>:
  D.17220 = stbi__get16le (s);
  x = D.17220;
  D.17221 = stbi__get16le (s);
  y = D.17221;
  D.17222 = stbi__get16le (s);
  w = D.17222;
  D.17223 = stbi__get16le (s);
  h = D.17223;
  _67 = x + w;
  _68 = g->w;
  if (_67 > _68) goto <D.17167>; else goto <D.17169>;
  <D.17169>:
  _69 = y + h;
  _70 = g->h;
  if (_69 > _70) goto <D.17167>; else goto <D.17168>;
  <D.17167>:
  stbi__err ("bad Image Descriptor");
  D.17134 = 0B;
  goto <D.17217>;
  <D.17168>:
  _71 = g->w;
  _72 = _71 * 4;
  g->line_size = _72;
  _73 = x * 4;
  g->start_x = _73;
  _74 = g->line_size;
  _75 = y * _74;
  g->start_y = _75;
  _76 = g->start_x;
  _77 = w * 4;
  _78 = _76 + _77;
  g->max_x = _78;
  _79 = g->start_y;
  _80 = g->line_size;
  _81 = h * _80;
  _82 = _79 + _81;
  g->max_y = _82;
  _83 = g->start_x;
  g->cur_x = _83;
  _84 = g->start_y;
  g->cur_y = _84;
  if (w == 0) goto <D.17170>; else goto <D.17171>;
  <D.17170>:
  _85 = g->max_y;
  g->cur_y = _85;
  goto <D.17172>;
  <D.17171>:
  <D.17172>:
  D.17224 = stbi__get8 (s);
  _86 = D.17224;
  _87 = (int) _86;
  g->lflags = _87;
  _88 = g->lflags;
  _89 = _88 & 64;
  if (_89 != 0) goto <D.17173>; else goto <D.17174>;
  <D.17173>:
  _90 = g->line_size;
  _91 = _90 * 8;
  g->step = _91;
  g->parse = 3;
  goto <D.17175>;
  <D.17174>:
  _92 = g->line_size;
  g->step = _92;
  g->parse = 0;
  <D.17175>:
  _93 = g->lflags;
  _94 = _93 & 128;
  if (_94 != 0) goto <D.17176>; else goto <D.17177>;
  <D.17176>:
  _95 = g->eflags;
  _96 = _95 & 1;
  if (_96 != 0) goto <D.17179>; else goto <D.17180>;
  <D.17179>:
  iftmp.524 = g->transparent;
  goto <D.17181>;
  <D.17180>:
  iftmp.524 = -1;
  <D.17181>:
  _97 = g->lflags;
  _98 = _97 & 7;
  _99 = 2 << _98;
  _100 = &g->lpal;
  stbi__gif_parse_colortable (s, _100, _99, iftmp.524);
  _101 = &g->lpal;
  g->color_table = _101;
  goto <D.17182>;
  <D.17177>:
  _102 = g->flags;
  _103 = _102 & 128;
  if (_103 != 0) goto <D.17183>; else goto <D.17184>;
  <D.17183>:
  _104 = &g->pal;
  g->color_table = _104;
  goto <D.17185>;
  <D.17184>:
  stbi__err ("missing color table");
  D.17134 = 0B;
  goto <D.17217>;
  <D.17185>:
  <D.17182>:
  D.17225 = stbi__process_gif_raster (s, g);
  o = D.17225;
  if (o == 0B) goto <D.17186>; else goto <D.17187>;
  <D.17186>:
  D.17134 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17217>;
  <D.17187>:
  _105 = g->w;
  _106 = g->h;
  pcount = _105 * _106;
  if (first_frame != 0) goto <D.17188>; else goto <D.17189>;
  <D.17188>:
  _107 = g->bgindex;
  if (_107 > 0) goto <D.17190>; else goto <D.17191>;
  <D.17190>:
  pi = 0;
  <D.17192>:
  if (pi >= pcount) goto <D.13064>; else goto <D.17193>;
  <D.17193>:
  _108 = g->history;
  _109 = (sizetype) pi;
  _110 = _108 + _109;
  _111 = *_110;
  if (_111 == 0) goto <D.17194>; else goto <D.17195>;
  <D.17194>:
  _112 = g->bgindex;
  g->pal[_112][3] = 255;
  _113 = g->bgindex;
  _114 = &g->pal[_113];
  _115 = g->out;
  _116 = pi * 4;
  _117 = (sizetype) _116;
  _118 = _115 + _117;
  D.17196 = MEM[(char * {ref-all})_114];
  MEM[(char * {ref-all})_118] = D.17196;
  goto <D.17197>;
  <D.17195>:
  <D.17197>:
  pi = pi + 1;
  goto <D.17192>;
  <D.13064>:
  goto <D.17198>;
  <D.17191>:
  <D.17198>:
  <D.17189>:
  D.17134 = o;
  goto <D.17217>;
  <D.13052>:
  D.17226 = stbi__get8 (s);
  _119 = D.17226;
  ext = (int) _119;
  if (ext == 249) goto <D.17199>; else goto <D.17200>;
  <D.17199>:
  D.17227 = stbi__get8 (s);
  _120 = D.17227;
  len = (int) _120;
  if (len == 4) goto <D.17201>; else goto <D.17202>;
  <D.17201>:
  D.17228 = stbi__get8 (s);
  _121 = D.17228;
  _122 = (int) _121;
  g->eflags = _122;
  D.17229 = stbi__get16le (s);
  _123 = D.17229;
  _124 = _123 * 10;
  g->delay = _124;
  _125 = g->transparent;
  if (_125 >= 0) goto <D.17203>; else goto <D.17204>;
  <D.17203>:
  _126 = g->transparent;
  g->pal[_126][3] = 255;
  goto <D.17205>;
  <D.17204>:
  <D.17205>:
  _127 = g->eflags;
  _128 = _127 & 1;
  if (_128 != 0) goto <D.17206>; else goto <D.17207>;
  <D.17206>:
  D.17230 = stbi__get8 (s);
  _129 = D.17230;
  _130 = (int) _129;
  g->transparent = _130;
  _131 = g->transparent;
  if (_131 >= 0) goto <D.17208>; else goto <D.17209>;
  <D.17208>:
  _132 = g->transparent;
  g->pal[_132][3] = 0;
  goto <D.17210>;
  <D.17209>:
  <D.17210>:
  goto <D.17211>;
  <D.17207>:
  stbi__skip (s, 1);
  g->transparent = -1;
  <D.17211>:
  goto <D.17212>;
  <D.17202>:
  stbi__skip (s, len);
  goto <D.13063>;
  <D.17212>:
  goto <D.17213>;
  <D.17200>:
  <D.17213>:
  <D.17214>:
  D.17231 = stbi__get8 (s);
  _133 = D.17231;
  len = (int) _133;
  retval.525 = len != 0;
  if (retval.525 != 0) goto <D.17216>; else goto <D.13066>;
  <D.17216>:
  stbi__skip (s, len);
  goto <D.17214>;
  <D.13066>:
  goto <D.13063>;
  <D.13055>:
  D.17134 = s;
  goto <D.17217>;
  <D.13056>:
  stbi__err ("unknown code");
  D.17134 = 0B;
  goto <D.17217>;
  <D.13063>:
  goto <D.17166>;
  <D.17217>:
  return D.17134;
}



;; Function stbi__load_gif_main (_ZL19stbi__load_gif_mainP13stbi__contextPPiS1_S1_S1_S1_i, funcdef_no=948, decl_uid=10232, cgraph_uid=854, symbol_order=884)

stbi__load_gif_main (struct stbi__context * s, int * * delays, int * x, int * y, int * z, int * comp, int req_comp)
{
  stbi_uc * D.17272;
  stbi_uc * D.17271;
  int D.17270;
  void * tmp;
  int delays_size;
  int out_size;
  int stride;
  struct stbi__gif g;
  stbi_uc * two_back;
  stbi_uc * out;
  stbi_uc * u;
  int layers;
  void * D.17248;
  bool retval.526;

  D.17270 = stbi__gif_test (s);
  _1 = D.17270;
  retval.526 = _1 != 0;
  if (retval.526 != 0) goto <D.17233>; else goto <D.17234>;
  <D.17233>:
  layers = 0;
  u = 0B;
  out = 0B;
  two_back = 0B;
  out_size = 0;
  delays_size = 0;
  memset (&g, 0, 34928);
  if (delays != 0B) goto <D.17235>; else goto <D.17236>;
  <D.17235>:
  *delays = 0B;
  goto <D.17237>;
  <D.17236>:
  <D.17237>:
  <D.17238>:
  D.17271 = stbi__gif_load_next (s, &g, comp, req_comp, two_back);
  u = D.17271;
  if (u == s) goto <D.17239>; else goto <D.17240>;
  <D.17239>:
  u = 0B;
  goto <D.17241>;
  <D.17240>:
  <D.17241>:
  if (u != 0B) goto <D.17242>; else goto <D.17243>;
  <D.17242>:
  _2 = g.w;
  *x = _2;
  _3 = g.h;
  *y = _3;
  layers = layers + 1;
  _4 = g.w;
  _5 = g.h;
  _6 = _4 * _5;
  stride = _6 * 4;
  if (out != 0B) goto <D.17244>; else goto <D.17245>;
  <D.17244>:
  _7 = layers * stride;
  _8 = (long long unsigned int) _7;
  tmp = realloc (out, _8);
  if (tmp == 0B) goto <D.17246>; else goto <D.17247>;
  <D.17246>:
  _9 = g.out;
  free (_9);
  _10 = g.history;
  free (_10);
  _11 = g.background;
  free (_11);
  stbi__err ("outofmem");
  D.17248 = 0B;
  goto <D.17274>;
  <D.17247>:
  out = tmp;
  out_size = layers * stride;
  if (delays != 0B) goto <D.17249>; else goto <D.17250>;
  <D.17249>:
  _12 = (long long unsigned int) layers;
  _13 = _12 * 4;
  _14 = *delays;
  _15 = realloc (_14, _13);
  *delays = _15;
  _16 = (long long unsigned int) layers;
  _17 = (unsigned int) _16;
  _18 = _17 * 4;
  delays_size = (int) _18;
  goto <D.17251>;
  <D.17250>:
  <D.17251>:
  goto <D.17252>;
  <D.17245>:
  _19 = layers * stride;
  _20 = (long long unsigned int) _19;
  out = stbi__malloc (_20);
  out_size = layers * stride;
  if (delays != 0B) goto <D.17253>; else goto <D.17254>;
  <D.17253>:
  _21 = (long long unsigned int) layers;
  _22 = _21 * 4;
  _23 = stbi__malloc (_22);
  *delays = _23;
  _24 = (long long unsigned int) layers;
  _25 = (unsigned int) _24;
  _26 = _25 * 4;
  delays_size = (int) _26;
  goto <D.17255>;
  <D.17254>:
  <D.17255>:
  <D.17252>:
  _27 = (long long unsigned int) stride;
  _28 = layers + -1;
  _29 = stride * _28;
  _30 = (sizetype) _29;
  _31 = out + _30;
  memcpy (_31, u, _27);
  if (layers > 1) goto <D.17256>; else goto <D.17257>;
  <D.17256>:
  _32 = stride * 2;
  _33 = (sizetype) _32;
  _34 = -_33;
  two_back = out + _34;
  goto <D.17258>;
  <D.17257>:
  <D.17258>:
  if (delays != 0B) goto <D.17259>; else goto <D.17260>;
  <D.17259>:
  _35 = *delays;
  layers.527_36 = (unsigned int) layers;
  _37 = layers.527_36 + 4294967295;
  _38 = (long long unsigned int) _37;
  _39 = _38 * 4;
  _40 = _35 + _39;
  _41 = g.delay;
  *_40 = _41;
  goto <D.17261>;
  <D.17260>:
  <D.17261>:
  goto <D.17262>;
  <D.17243>:
  <D.17262>:
  if (u == 0B) goto <D.13164>; else goto <D.17263>;
  <D.17263>:
  goto <D.17238>;
  <D.13164>:
  _42 = g.out;
  free (_42);
  _43 = g.history;
  free (_43);
  _44 = g.background;
  free (_44);
  if (req_comp != 0) goto <D.17264>; else goto <D.17265>;
  <D.17264>:
  if (req_comp != 4) goto <D.17266>; else goto <D.17267>;
  <D.17266>:
  _45 = g.h;
  _46 = (unsigned int) _45;
  _47 = g.w;
  _48 = layers * _47;
  _49 = (unsigned int) _48;
  D.17272 = stbi__convert_format (out, 4, req_comp, _49, _46);
  out = D.17272;
  goto <D.17268>;
  <D.17267>:
  <D.17268>:
  <D.17265>:
  *z = layers;
  D.17248 = out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17274>;
  <D.17274>:
  g = {CLOBBER};
  goto <D.17269>;
  <D.17234>:
  stbi__err ("not GIF");
  D.17248 = 0B;
  goto <D.17269>;
  <D.17269>:
  return D.17248;
  <D.17273>:
  g = {CLOBBER};
  resx 1
}



;; Function stbi__gif_load (_ZL14stbi__gif_loadP13stbi__contextPiS1_S1_iP17stbi__result_info, funcdef_no=949, decl_uid=10224, cgraph_uid=855, symbol_order=885)

stbi__gif_load (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri)
{
  stbi_uc * D.17292;
  stbi_uc * D.17291;
  struct stbi__gif g;
  stbi_uc * u;
  void * D.17289;

  u = 0B;
  memset (&g, 0, 34928);
  D.17291 = stbi__gif_load_next (s, &g, comp, req_comp, 0B);
  u = D.17291;
  if (u == s) goto <D.17275>; else goto <D.17276>;
  <D.17275>:
  u = 0B;
  goto <D.17277>;
  <D.17276>:
  <D.17277>:
  if (u != 0B) goto <D.17278>; else goto <D.17279>;
  <D.17278>:
  _1 = g.w;
  *x = _1;
  _2 = g.h;
  *y = _2;
  if (req_comp != 0) goto <D.17280>; else goto <D.17281>;
  <D.17280>:
  if (req_comp != 4) goto <D.17282>; else goto <D.17283>;
  <D.17282>:
  _3 = g.h;
  _4 = (unsigned int) _3;
  _5 = g.w;
  _6 = (unsigned int) _5;
  D.17292 = stbi__convert_format (u, 4, req_comp, _6, _4);
  u = D.17292;
  goto <D.17284>;
  <D.17283>:
  <D.17284>:
  <D.17281>:
  goto <D.17285>;
  <D.17279>:
  _7 = g.out;
  if (_7 != 0B) goto <D.17286>; else goto <D.17287>;
  <D.17286>:
  _8 = g.out;
  free (_8);
  goto <D.17288>;
  <D.17287>:
  <D.17288>:
  <D.17285>:
  _9 = g.history;
  free (_9);
  _10 = g.background;
  free (_10);
  D.17289 = u;
  goto <D.17294>;
  <D.17294>:
  g = {CLOBBER};
  goto <D.17290>;
  <D.17290>:
  return D.17289;
  <D.17293>:
  g = {CLOBBER};
  resx 1
}



;; Function stbi__gif_info (_ZL14stbi__gif_infoP13stbi__contextPiS1_S1_, funcdef_no=950, decl_uid=10237, cgraph_uid=856, symbol_order=886)

stbi__gif_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  int D.17297;
  int D.17295;

  D.17297 = stbi__gif_info_raw (s, x, y, comp);
  D.17295 = D.17297;
  goto <D.17296>;
  <D.17296>:
  return D.17295;
}



;; Function stbi__hdr_test_core (_ZL19stbi__hdr_test_coreP13stbi__contextPKc, funcdef_no=951, decl_uid=13184, cgraph_uid=857, symbol_order=887)

stbi__hdr_test_core (struct stbi__context * s, const char * signature)
{
  unsigned char D.17305;
  int i;
  int D.17303;
  bool retval.528;

  i = 0;
  <D.17298>:
  _1 = (sizetype) i;
  _2 = signature + _1;
  _3 = *_2;
  if (_3 == 0) goto <D.13187>; else goto <D.17299>;
  <D.17299>:
  D.17305 = stbi__get8 (s);
  _4 = D.17305;
  _5 = (int) _4;
  _6 = (sizetype) i;
  _7 = signature + _6;
  _8 = *_7;
  _9 = (int) _8;
  retval.528 = _5 != _9;
  if (retval.528 != 0) goto <D.17301>; else goto <D.17302>;
  <D.17301>:
  D.17303 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17304>;
  <D.17302>:
  i = i + 1;
  goto <D.17298>;
  <D.13187>:
  stbi__rewind (s);
  D.17303 = 1;
  goto <D.17304>;
  <D.17304>:
  return D.17303;
}



;; Function stbi__hdr_test (_ZL14stbi__hdr_testP13stbi__context, funcdef_no=952, decl_uid=10189, cgraph_uid=858, symbol_order=888)

stbi__hdr_test (struct stbi__context * s)
{
  int D.17312;
  int D.17311;
  int r;
  int D.17309;

  D.17311 = stbi__hdr_test_core (s, "#?RADIANCE\n");
  r = D.17311;
  stbi__rewind (s);
  if (r == 0) goto <D.17306>; else goto <D.17307>;
  <D.17306>:
  D.17312 = stbi__hdr_test_core (s, "#?RGBE\n");
  r = D.17312;
  stbi__rewind (s);
  goto <D.17308>;
  <D.17307>:
  <D.17308>:
  D.17309 = r;
  goto <D.17310>;
  <D.17310>:
  return D.17309;
}



;; Function stbi__hdr_gettoken (_ZL18stbi__hdr_gettokenP13stbi__contextPc, funcdef_no=953, decl_uid=13195, cgraph_uid=859, symbol_order=889)

stbi__hdr_gettoken (struct stbi__context * z, char * buffer)
{
  unsigned char D.17337;
  unsigned char D.17336;
  int D.17335;
  int D.17334;
  unsigned char D.17333;
  char c;
  int len;
  char * D.17331;
  bool iftmp.533;
  bool retval.532;
  bool iftmp.530;
  bool retval.529;

  len = 0;
  c = 0;
  D.17333 = stbi__get8 (z);
  _1 = D.17333;
  c = (char) _1;
  <D.17313>:
  D.17334 = stbi__at_eof (z);
  _2 = D.17334;
  if (_2 == 0) goto <D.17318>; else goto <D.17316>;
  <D.17318>:
  if (c != 10) goto <D.17319>; else goto <D.17316>;
  <D.17319>:
  iftmp.530 = 1;
  goto <D.17317>;
  <D.17316>:
  iftmp.530 = 0;
  <D.17317>:
  retval.529 = iftmp.530;
  if (retval.529 != 0) goto <D.17320>; else goto <D.13199>;
  <D.17320>:
  len.531_3 = len;
  len = len.531_3 + 1;
  _4 = (sizetype) len.531_3;
  _5 = buffer + _4;
  *_5 = c;
  if (len == 1023) goto <D.17321>; else goto <D.17322>;
  <D.17321>:
  <D.17323>:
  D.17335 = stbi__at_eof (z);
  _6 = D.17335;
  if (_6 == 0) goto <D.17328>; else goto <D.17326>;
  <D.17328>:
  D.17336 = stbi__get8 (z);
  _7 = D.17336;
  if (_7 != 10) goto <D.17329>; else goto <D.17326>;
  <D.17329>:
  iftmp.533 = 1;
  goto <D.17327>;
  <D.17326>:
  iftmp.533 = 0;
  <D.17327>:
  retval.532 = iftmp.533;
  if (retval.532 != 0) goto <D.17330>; else goto <D.13201>;
  <D.17330>:
  goto <D.17323>;
  <D.13201>:
  goto <D.13199>;
  <D.17322>:
  D.17337 = stbi__get8 (z);
  _8 = D.17337;
  c = (char) _8;
  goto <D.17313>;
  <D.13199>:
  _9 = (sizetype) len;
  _10 = buffer + _9;
  *_10 = 0;
  D.17331 = buffer;
  goto <D.17332>;
  <D.17332>:
  return D.17331;
}



;; Function stbi__hdr_convert (_ZL17stbi__hdr_convertPfPhi, funcdef_no=954, decl_uid=13206, cgraph_uid=860, symbol_order=890)

stbi__hdr_convert (float * output, stbi_uc * input, int req_comp)
{
  float f1;

  _1 = input + 3;
  _2 = *_1;
  if (_2 != 0) goto <D.17338>; else goto <D.17339>;
  <D.17338>:
  _3 = input + 3;
  _4 = *_3;
  _5 = (int) _4;
  _6 = _5 + -136;
  f1 = std::ldexp (1.0e+0, _6);
  if (req_comp <= 2) goto <D.17340>; else goto <D.17341>;
  <D.17340>:
  _7 = *input;
  _8 = (int) _7;
  _9 = input + 1;
  _10 = *_9;
  _11 = (int) _10;
  _12 = _8 + _11;
  _13 = input + 2;
  _14 = *_13;
  _15 = (int) _14;
  _16 = _12 + _15;
  _17 = (float) _16;
  _18 = f1 * _17;
  _19 = _18 / 3.0e+0;
  *output = _19;
  goto <D.17342>;
  <D.17341>:
  _20 = *input;
  _21 = (int) _20;
  _22 = (float) _21;
  _23 = f1 * _22;
  *output = _23;
  _24 = input + 1;
  _25 = *_24;
  _26 = (int) _25;
  _27 = (float) _26;
  _28 = output + 4;
  _29 = f1 * _27;
  *_28 = _29;
  _30 = input + 2;
  _31 = *_30;
  _32 = (int) _31;
  _33 = (float) _32;
  _34 = output + 8;
  _35 = f1 * _33;
  *_34 = _35;
  <D.17342>:
  if (req_comp == 2) goto <D.17343>; else goto <D.17344>;
  <D.17343>:
  _36 = output + 4;
  *_36 = 1.0e+0;
  goto <D.17345>;
  <D.17344>:
  <D.17345>:
  if (req_comp == 4) goto <D.17346>; else goto <D.17347>;
  <D.17346>:
  _37 = output + 12;
  *_37 = 1.0e+0;
  goto <D.17348>;
  <D.17347>:
  <D.17348>:
  goto <D.17349>;
  <D.17339>:
  switch (req_comp) <default: <D.17350>, case 1: <D.13215>, case 2: <D.13214>, case 3: <D.13213>, case 4: <D.13212>>
  <D.13212>:
  _38 = output + 12;
  *_38 = 1.0e+0;
  <D.13213>:
  _39 = output + 8;
  *_39 = 0.0;
  _40 = output + 4;
  _41 = *_39;
  *_40 = _41;
  _42 = *_40;
  *output = _42;
  goto <D.13216>;
  <D.13214>:
  _43 = output + 4;
  *_43 = 1.0e+0;
  <D.13215>:
  *output = 0.0;
  goto <D.13216>;
  <D.13216>:
  <D.17350>:
  <D.17349>:
  return;
}



;; Function std::ldexp (_ZSt5ldexpfi, funcdef_no=96, decl_uid=7048, cgraph_uid=57, symbol_order=57)

std::ldexp (float __x, int __exp)
{
  float D.17351;

  D.17351 = __builtin_ldexpf (__x, __exp);
  goto <D.17352>;
  <D.17352>:
  return D.17351;
}



;; Function stbi__hdr_load (_ZL14stbi__hdr_loadP13stbi__contextPiS1_S1_iP17stbi__result_info, funcdef_no=955, decl_uid=10196, cgraph_uid=861, symbol_order=891)

stbi__hdr_load (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri)
{
  unsigned char D.17443;
  unsigned char D.17442;
  unsigned char D.17441;
  stbi_uc D.17440;
  unsigned char D.17437;
  unsigned char D.17436;
  unsigned char D.17435;
  unsigned char D.17434;
  char * D.17432;
  char * D.17431;
  const char * D.17430;
  int nleft;
  stbi_uc rgbe[4];
  stbi_uc rgbe[4];
  const char * headerToken;
  int z;
  int c2;
  int c1;
  int k;
  int j;
  int i;
  unsigned char value;
  unsigned char count;
  int len;
  float * hdr_data;
  stbi_uc * scanline;
  int height;
  int width;
  int valid;
  char * token;
  char buffer[1024];
  bool retval.545;
  stbi_uc D.13245;
  bool retval.544;
  float * D.17357;

  valid = 0;
  D.17430 = stbi__hdr_gettoken (s, &buffer);
  headerToken = D.17430;
  _1 = strcmp (headerToken, "#?RADIANCE");
  if (_1 != 0) goto <D.17353>; else goto <D.17354>;
  <D.17353>:
  _2 = strcmp (headerToken, "#?RGBE");
  if (_2 != 0) goto <D.17355>; else goto <D.17356>;
  <D.17355>:
  stbi__err ("not HDR");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17356>:
  <D.17354>:
  <D.17358>:
  D.17431 = stbi__hdr_gettoken (s, &buffer);
  _3 = D.17431;
  token = _3;
  token.534_4 = token;
  _5 = *token.534_4;
  if (_5 == 0) goto <D.17359>; else goto <D.17360>;
  <D.17359>:
  goto <D.13247>;
  <D.17360>:
  token.535_6 = token;
  _7 = strcmp (token.535_6, "FORMAT=32-bit_rle_rgbe");
  if (_7 == 0) goto <D.17361>; else goto <D.17362>;
  <D.17361>:
  valid = 1;
  goto <D.17363>;
  <D.17362>:
  <D.17363>:
  goto <D.17358>;
  <D.13247>:
  if (valid == 0) goto <D.17364>; else goto <D.17365>;
  <D.17364>:
  stbi__err ("unsupported format");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17365>:
  D.17432 = stbi__hdr_gettoken (s, &buffer);
  _8 = D.17432;
  token = _8;
  token.536_9 = token;
  _10 = strncmp (token.536_9, "-Y ", 3);
  if (_10 != 0) goto <D.17366>; else goto <D.17367>;
  <D.17366>:
  stbi__err ("unsupported data layout");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17367>:
  token.537_11 = token;
  _12 = token.537_11 + 3;
  token = _12;
  token.538_13 = token;
  height = strtol (token.538_13, &token, 10);
  <D.17368>:
  token.539_14 = token;
  _15 = *token.539_14;
  if (_15 != 32) goto <D.13249>; else goto <D.17369>;
  <D.17369>:
  token.540_16 = token;
  _17 = token.540_16 + 1;
  token = _17;
  goto <D.17368>;
  <D.13249>:
  token.541_18 = token;
  _19 = strncmp (token.541_18, "+X ", 3);
  if (_19 != 0) goto <D.17370>; else goto <D.17371>;
  <D.17370>:
  stbi__err ("unsupported data layout");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17371>:
  token.542_20 = token;
  _21 = token.542_20 + 3;
  token = _21;
  token.543_22 = token;
  width = strtol (token.543_22, 0B, 10);
  if (height > 16777216) goto <D.17372>; else goto <D.17373>;
  <D.17372>:
  stbi__err ("too large");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17373>:
  if (width > 16777216) goto <D.17374>; else goto <D.17375>;
  <D.17374>:
  stbi__err ("too large");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17375>:
  *x = width;
  *y = height;
  if (comp != 0B) goto <D.17376>; else goto <D.17377>;
  <D.17376>:
  *comp = 3;
  goto <D.17378>;
  <D.17377>:
  <D.17378>:
  if (req_comp == 0) goto <D.17379>; else goto <D.17380>;
  <D.17379>:
  req_comp = 3;
  goto <D.17381>;
  <D.17380>:
  <D.17381>:
  _23 = stbi__mad4sizes_valid (width, height, req_comp, 4, 0);
  retval.544 = _23 == 0;
  if (retval.544 != 0) goto <D.17383>; else goto <D.17384>;
  <D.17383>:
  stbi__err ("too large");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17384>:
  hdr_data = stbi__malloc_mad4 (width, height, req_comp, 4, 0);
  if (hdr_data == 0B) goto <D.17385>; else goto <D.17386>;
  <D.17385>:
  stbi__err ("outofmem");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17386>:
  if (width <= 7) goto <D.17387>; else goto <D.17390>;
  <D.17390>:
  if (width > 32767) goto <D.17387>; else goto <D.17388>;
  <D.17387>:
  j = 0;
  <D.17391>:
  if (j >= height) goto <D.13251>; else goto <D.17392>;
  <D.17392>:
  i = 0;
  <D.17393>:
  if (i >= width) goto <D.13253>; else goto <D.17394>;
  <D.17394>:
  main_decode_loop:
  stbi__getn (s, &rgbe, 4);
  _24 = j * width;
  _25 = req_comp * _24;
  _26 = (sizetype) _25;
  _27 = i * req_comp;
  _28 = (sizetype) _27;
  _29 = _26 + _28;
  _30 = _29 * 4;
  _31 = hdr_data + _30;
  stbi__hdr_convert (_31, &rgbe, req_comp);
  rgbe = {CLOBBER};
  i = i + 1;
  goto <D.17393>;
  <D.13253>:
  j = j + 1;
  goto <D.17391>;
  <D.13251>:
  goto <D.17389>;
  <D.17388>:
  scanline = 0B;
  j = 0;
  <D.17395>:
  if (j >= height) goto <D.13255>; else goto <D.17396>;
  <D.17396>:
  D.17434 = stbi__get8 (s);
  _32 = D.17434;
  c1 = (int) _32;
  D.17435 = stbi__get8 (s);
  _33 = D.17435;
  c2 = (int) _33;
  D.17436 = stbi__get8 (s);
  _34 = D.17436;
  len = (int) _34;
  if (c1 != 2) goto <D.17397>; else goto <D.17399>;
  <D.17399>:
  if (c2 != 2) goto <D.17397>; else goto <D.17400>;
  <D.17400>:
  _35 = len & 128;
  if (_35 != 0) goto <D.17397>; else goto <D.17398>;
  <D.17397>:
  _36 = (unsigned char) c1;
  rgbe[0] = _36;
  _37 = (unsigned char) c2;
  rgbe[1] = _37;
  _38 = (unsigned char) len;
  rgbe[2] = _38;
  D.17437 = stbi__get8 (s);
  _39 = D.17437;
  rgbe[3] = _39;
  stbi__hdr_convert (hdr_data, &rgbe, req_comp);
  i = 1;
  j = 0;
  free (scanline);
  // predicted unlikely by goto predictor.
  goto <D.17439>;
  <D.17439>:
  rgbe = {CLOBBER};
  goto main_decode_loop;
  <D.17398>:
  len = len << 8;
  D.17440 = stbi__get8 (s);
  D.13245 = D.17440;
  _40 = (int) D.13245;
  len = len | _40;
  if (len != width) goto <D.17401>; else goto <D.17402>;
  <D.17401>:
  free (hdr_data);
  free (scanline);
  stbi__err ("invalid decoded scanline length");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17402>:
  if (scanline == 0B) goto <D.17403>; else goto <D.17404>;
  <D.17403>:
  scanline = stbi__malloc_mad2 (width, 4, 0);
  if (scanline == 0B) goto <D.17405>; else goto <D.17406>;
  <D.17405>:
  free (hdr_data);
  stbi__err ("outofmem");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17406>:
  goto <D.17407>;
  <D.17404>:
  <D.17407>:
  k = 0;
  <D.17408>:
  if (k > 3) goto <D.13257>; else goto <D.17409>;
  <D.17409>:
  i = 0;
  <D.17410>:
  nleft = width - i;
  retval.545 = nleft > 0;
  if (retval.545 != 0) goto <D.17412>; else goto <D.13259>;
  <D.17412>:
  D.17441 = stbi__get8 (s);
  count = D.17441;
  if (count > 128) goto <D.17413>; else goto <D.17414>;
  <D.17413>:
  D.17442 = stbi__get8 (s);
  value = D.17442;
  count = count + 128;
  _41 = (int) count;
  if (nleft < _41) goto <D.17415>; else goto <D.17416>;
  <D.17415>:
  free (hdr_data);
  free (scanline);
  stbi__err ("corrupt");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17416>:
  z = 0;
  <D.17417>:
  _42 = (int) count;
  if (z >= _42) goto <D.13261>; else goto <D.17418>;
  <D.17418>:
  i.546_43 = i;
  i = i.546_43 + 1;
  _44 = i.546_43 * 4;
  _45 = k + _44;
  _46 = (sizetype) _45;
  _47 = scanline + _46;
  *_47 = value;
  z = z + 1;
  goto <D.17417>;
  <D.13261>:
  goto <D.17419>;
  <D.17414>:
  _48 = (int) count;
  if (nleft < _48) goto <D.17420>; else goto <D.17421>;
  <D.17420>:
  free (hdr_data);
  free (scanline);
  stbi__err ("corrupt");
  D.17357 = 0B;
  goto <D.17445>;
  <D.17421>:
  z = 0;
  <D.17422>:
  _49 = (int) count;
  if (z >= _49) goto <D.13263>; else goto <D.17423>;
  <D.17423>:
  i.547_50 = i;
  i = i.547_50 + 1;
  _51 = i.547_50 * 4;
  _52 = k + _51;
  _53 = (sizetype) _52;
  _54 = scanline + _53;
  D.17443 = stbi__get8 (s);
  _55 = D.17443;
  *_54 = _55;
  z = z + 1;
  goto <D.17422>;
  <D.13263>:
  <D.17419>:
  goto <D.17410>;
  <D.13259>:
  k = k + 1;
  goto <D.17408>;
  <D.13257>:
  i = 0;
  <D.17424>:
  if (i >= width) goto <D.13265>; else goto <D.17425>;
  <D.17425>:
  _56 = i * 4;
  _57 = (sizetype) _56;
  _58 = scanline + _57;
  _59 = j * width;
  _60 = i + _59;
  _61 = req_comp * _60;
  _62 = (long long unsigned int) _61;
  _63 = _62 * 4;
  _64 = hdr_data + _63;
  stbi__hdr_convert (_64, _58, req_comp);
  i = i + 1;
  goto <D.17424>;
  <D.13265>:
  j = j + 1;
  goto <D.17395>;
  <D.13255>:
  if (scanline != 0B) goto <D.17426>; else goto <D.17427>;
  <D.17426>:
  free (scanline);
  goto <D.17428>;
  <D.17427>:
  <D.17428>:
  <D.17389>:
  D.17357 = hdr_data;
  goto <D.17445>;
  <D.17445>:
  buffer = {CLOBBER};
  token = {CLOBBER};
  goto <D.17429>;
  <D.17429>:
  return D.17357;
  <D.17433>:
  rgbe = {CLOBBER};
  resx 2
  <D.17438>:
  rgbe = {CLOBBER};
  resx 4
  <D.17444>:
  buffer = {CLOBBER};
  token = {CLOBBER};
  resx 1
}



;; Function stbi__hdr_info (_ZL14stbi__hdr_infoP13stbi__contextPiS1_S1_, funcdef_no=956, decl_uid=10201, cgraph_uid=862, symbol_order=892)

stbi__hdr_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  char * D.17476;
  char * D.17475;
  int D.17474;
  int dummy;
  int valid;
  char * token;
  char buffer[1024];
  int D.17458;
  bool retval.548;

  valid = 0;
  if (x == 0B) goto <D.17446>; else goto <D.17447>;
  <D.17446>:
  x = &dummy;
  goto <D.17448>;
  <D.17447>:
  <D.17448>:
  if (y == 0B) goto <D.17449>; else goto <D.17450>;
  <D.17449>:
  y = &dummy;
  goto <D.17451>;
  <D.17450>:
  <D.17451>:
  if (comp == 0B) goto <D.17452>; else goto <D.17453>;
  <D.17452>:
  comp = &dummy;
  goto <D.17454>;
  <D.17453>:
  <D.17454>:
  D.17474 = stbi__hdr_test (s);
  _1 = D.17474;
  retval.548 = _1 == 0;
  if (retval.548 != 0) goto <D.17456>; else goto <D.17457>;
  <D.17456>:
  stbi__rewind (s);
  D.17458 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17478>;
  <D.17457>:
  <D.17459>:
  D.17475 = stbi__hdr_gettoken (s, &buffer);
  _2 = D.17475;
  token = _2;
  token.549_3 = token;
  _4 = *token.549_3;
  if (_4 == 0) goto <D.17460>; else goto <D.17461>;
  <D.17460>:
  goto <D.13277>;
  <D.17461>:
  token.550_5 = token;
  _6 = strcmp (token.550_5, "FORMAT=32-bit_rle_rgbe");
  if (_6 == 0) goto <D.17462>; else goto <D.17463>;
  <D.17462>:
  valid = 1;
  goto <D.17464>;
  <D.17463>:
  <D.17464>:
  goto <D.17459>;
  <D.13277>:
  if (valid == 0) goto <D.17465>; else goto <D.17466>;
  <D.17465>:
  stbi__rewind (s);
  D.17458 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17478>;
  <D.17466>:
  D.17476 = stbi__hdr_gettoken (s, &buffer);
  _7 = D.17476;
  token = _7;
  token.551_8 = token;
  _9 = strncmp (token.551_8, "-Y ", 3);
  if (_9 != 0) goto <D.17467>; else goto <D.17468>;
  <D.17467>:
  stbi__rewind (s);
  D.17458 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17478>;
  <D.17468>:
  token.552_10 = token;
  _11 = token.552_10 + 3;
  token = _11;
  token.553_12 = token;
  _13 = strtol (token.553_12, &token, 10);
  *y = _13;
  <D.17469>:
  token.554_14 = token;
  _15 = *token.554_14;
  if (_15 != 32) goto <D.13279>; else goto <D.17470>;
  <D.17470>:
  token.555_16 = token;
  _17 = token.555_16 + 1;
  token = _17;
  goto <D.17469>;
  <D.13279>:
  token.556_18 = token;
  _19 = strncmp (token.556_18, "+X ", 3);
  if (_19 != 0) goto <D.17471>; else goto <D.17472>;
  <D.17471>:
  stbi__rewind (s);
  D.17458 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17478>;
  <D.17472>:
  token.557_20 = token;
  _21 = token.557_20 + 3;
  token = _21;
  token.558_22 = token;
  _23 = strtol (token.558_22, 0B, 10);
  *x = _23;
  *comp = 3;
  D.17458 = 1;
  goto <D.17478>;
  <D.17478>:
  buffer = {CLOBBER};
  token = {CLOBBER};
  dummy = {CLOBBER};
  goto <D.17473>;
  <D.17473>:
  return D.17458;
  <D.17477>:
  buffer = {CLOBBER};
  token = {CLOBBER};
  dummy = {CLOBBER};
  resx 1
}



;; Function stbi__bmp_info (_ZL14stbi__bmp_infoP13stbi__contextPiS1_S1_, funcdef_no=957, decl_uid=10156, cgraph_uid=863, symbol_order=893)

stbi__bmp_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  void * D.17500;
  struct stbi__bmp_data info;
  void * p;
  int iftmp.559;
  int D.17481;

  info.all_a = 255;
  D.17500 = stbi__bmp_parse_header (s, &info);
  p = D.17500;
  stbi__rewind (s);
  if (p == 0B) goto <D.17479>; else goto <D.17480>;
  <D.17479>:
  D.17481 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17502>;
  <D.17480>:
  if (x != 0B) goto <D.17482>; else goto <D.17483>;
  <D.17482>:
  _1 = s->img_x;
  _2 = (int) _1;
  *x = _2;
  goto <D.17484>;
  <D.17483>:
  <D.17484>:
  if (y != 0B) goto <D.17485>; else goto <D.17486>;
  <D.17485>:
  _3 = s->img_y;
  _4 = (int) _3;
  *y = _4;
  goto <D.17487>;
  <D.17486>:
  <D.17487>:
  if (comp != 0B) goto <D.17488>; else goto <D.17489>;
  <D.17488>:
  _5 = info.bpp;
  if (_5 == 24) goto <D.17492>; else goto <D.17490>;
  <D.17492>:
  _6 = info.ma;
  if (_6 == 4278190080) goto <D.17493>; else goto <D.17490>;
  <D.17493>:
  *comp = 3;
  goto <D.17491>;
  <D.17490>:
  _7 = info.ma;
  if (_7 != 0) goto <D.17495>; else goto <D.17496>;
  <D.17495>:
  iftmp.559 = 4;
  goto <D.17497>;
  <D.17496>:
  iftmp.559 = 3;
  <D.17497>:
  *comp = iftmp.559;
  <D.17491>:
  goto <D.17498>;
  <D.17489>:
  <D.17498>:
  D.17481 = 1;
  goto <D.17502>;
  <D.17502>:
  info = {CLOBBER};
  goto <D.17499>;
  <D.17499>:
  return D.17481;
  <D.17501>:
  info = {CLOBBER};
  resx 1
}



;; Function stbi__psd_info (_ZL14stbi__psd_infoP13stbi__contextPiS1_S1_, funcdef_no=958, decl_uid=10185, cgraph_uid=864, symbol_order=894)

stbi__psd_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  int D.17536;
  int D.17535;
  unsigned int D.17534;
  unsigned int D.17533;
  int D.17532;
  int D.17531;
  unsigned int D.17530;
  int depth;
  int dummy;
  int channelCount;
  bool retval.562;
  bool retval.561;
  int D.17515;
  bool retval.560;

  if (x == 0B) goto <D.17503>; else goto <D.17504>;
  <D.17503>:
  x = &dummy;
  goto <D.17505>;
  <D.17504>:
  <D.17505>:
  if (y == 0B) goto <D.17506>; else goto <D.17507>;
  <D.17506>:
  y = &dummy;
  goto <D.17508>;
  <D.17507>:
  <D.17508>:
  if (comp == 0B) goto <D.17509>; else goto <D.17510>;
  <D.17509>:
  comp = &dummy;
  goto <D.17511>;
  <D.17510>:
  <D.17511>:
  D.17530 = stbi__get32be (s);
  _1 = D.17530;
  retval.560 = _1 != 943870035;
  if (retval.560 != 0) goto <D.17513>; else goto <D.17514>;
  <D.17513>:
  stbi__rewind (s);
  D.17515 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17538>;
  <D.17514>:
  D.17531 = stbi__get16be (s);
  _2 = D.17531;
  retval.561 = _2 != 1;
  if (retval.561 != 0) goto <D.17517>; else goto <D.17518>;
  <D.17517>:
  stbi__rewind (s);
  D.17515 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17538>;
  <D.17518>:
  stbi__skip (s, 6);
  D.17532 = stbi__get16be (s);
  channelCount = D.17532;
  if (channelCount < 0) goto <D.17519>; else goto <D.17521>;
  <D.17521>:
  if (channelCount > 16) goto <D.17519>; else goto <D.17520>;
  <D.17519>:
  stbi__rewind (s);
  D.17515 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17538>;
  <D.17520>:
  D.17533 = stbi__get32be (s);
  _3 = D.17533;
  _4 = (int) _3;
  *y = _4;
  D.17534 = stbi__get32be (s);
  _5 = D.17534;
  _6 = (int) _5;
  *x = _6;
  D.17535 = stbi__get16be (s);
  depth = D.17535;
  if (depth != 8) goto <D.17522>; else goto <D.17523>;
  <D.17522>:
  if (depth != 16) goto <D.17524>; else goto <D.17525>;
  <D.17524>:
  stbi__rewind (s);
  D.17515 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17538>;
  <D.17525>:
  <D.17523>:
  D.17536 = stbi__get16be (s);
  _7 = D.17536;
  retval.562 = _7 != 3;
  if (retval.562 != 0) goto <D.17527>; else goto <D.17528>;
  <D.17527>:
  stbi__rewind (s);
  D.17515 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17538>;
  <D.17528>:
  *comp = 4;
  D.17515 = 1;
  goto <D.17538>;
  <D.17538>:
  dummy = {CLOBBER};
  goto <D.17529>;
  <D.17529>:
  return D.17515;
  <D.17537>:
  dummy = {CLOBBER};
  resx 1
}



;; Function stbi__psd_is16 (_ZL14stbi__psd_is16P13stbi__context, funcdef_no=959, decl_uid=10187, cgraph_uid=865, symbol_order=895)

stbi__psd_is16 (struct stbi__context * s)
{
  int D.17555;
  int D.17554;
  int D.17553;
  unsigned int D.17552;
  int depth;
  int channelCount;
  bool retval.564;
  int D.17542;
  bool retval.563;

  D.17552 = stbi__get32be (s);
  _1 = D.17552;
  retval.563 = _1 != 943870035;
  if (retval.563 != 0) goto <D.17540>; else goto <D.17541>;
  <D.17540>:
  stbi__rewind (s);
  D.17542 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17551>;
  <D.17541>:
  D.17553 = stbi__get16be (s);
  _2 = D.17553;
  retval.564 = _2 != 1;
  if (retval.564 != 0) goto <D.17544>; else goto <D.17545>;
  <D.17544>:
  stbi__rewind (s);
  D.17542 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17551>;
  <D.17545>:
  stbi__skip (s, 6);
  D.17554 = stbi__get16be (s);
  channelCount = D.17554;
  if (channelCount < 0) goto <D.17546>; else goto <D.17548>;
  <D.17548>:
  if (channelCount > 16) goto <D.17546>; else goto <D.17547>;
  <D.17546>:
  stbi__rewind (s);
  D.17542 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17551>;
  <D.17547>:
  stbi__get32be (s);
  stbi__get32be (s);
  D.17555 = stbi__get16be (s);
  depth = D.17555;
  if (depth != 16) goto <D.17549>; else goto <D.17550>;
  <D.17549>:
  stbi__rewind (s);
  D.17542 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17551>;
  <D.17550>:
  D.17542 = 1;
  goto <D.17551>;
  <D.17551>:
  return D.17542;
}



;; Function stbi__pic_info (_ZL14stbi__pic_infoP13stbi__contextPiS1_S1_, funcdef_no=960, decl_uid=10215, cgraph_uid=866, symbol_order=896)

stbi__pic_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  int D.17598;
  unsigned char D.17597;
  unsigned char D.17596;
  unsigned char D.17595;
  unsigned char D.17594;
  int D.17593;
  int D.17592;
  int D.17591;
  int D.17590;
  struct stbi__pic_packet * packet;
  struct stbi__pic_packet packets[10];
  int dummy;
  int chained;
  int num_packets;
  int act_comp;
  int iftmp.569;
  bool retval.568;
  bool retval.566;
  int D.17568;
  bool retval.565;

  act_comp = 0;
  num_packets = 0;
  if (x == 0B) goto <D.17556>; else goto <D.17557>;
  <D.17556>:
  x = &dummy;
  goto <D.17558>;
  <D.17557>:
  <D.17558>:
  if (y == 0B) goto <D.17559>; else goto <D.17560>;
  <D.17559>:
  y = &dummy;
  goto <D.17561>;
  <D.17560>:
  <D.17561>:
  if (comp == 0B) goto <D.17562>; else goto <D.17563>;
  <D.17562>:
  comp = &dummy;
  goto <D.17564>;
  <D.17563>:
  <D.17564>:
  D.17590 = stbi__pic_is4 (s, "S\x80\xf64");
  _1 = D.17590;
  retval.565 = _1 == 0;
  if (retval.565 != 0) goto <D.17566>; else goto <D.17567>;
  <D.17566>:
  stbi__rewind (s);
  D.17568 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17600>;
  <D.17567>:
  stbi__skip (s, 88);
  D.17591 = stbi__get16be (s);
  _2 = D.17591;
  *x = _2;
  D.17592 = stbi__get16be (s);
  _3 = D.17592;
  *y = _3;
  D.17593 = stbi__at_eof (s);
  _4 = D.17593;
  retval.566 = _4 != 0;
  if (retval.566 != 0) goto <D.17570>; else goto <D.17571>;
  <D.17570>:
  stbi__rewind (s);
  D.17568 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17600>;
  <D.17571>:
  _5 = *x;
  if (_5 != 0) goto <D.17572>; else goto <D.17573>;
  <D.17572>:
  _6 = *x;
  _7 = 268435456 / _6;
  _8 = *y;
  if (_7 < _8) goto <D.17574>; else goto <D.17575>;
  <D.17574>:
  stbi__rewind (s);
  D.17568 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17600>;
  <D.17575>:
  <D.17573>:
  stbi__skip (s, 8);
  <D.17576>:
  if (num_packets == 10) goto <D.17577>; else goto <D.17578>;
  <D.17577>:
  D.17568 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17600>;
  <D.17578>:
  num_packets.567_9 = num_packets;
  num_packets = num_packets.567_9 + 1;
  packet = &packets[num_packets.567_9];
  D.17594 = stbi__get8 (s);
  _10 = D.17594;
  chained = (int) _10;
  D.17595 = stbi__get8 (s);
  _11 = D.17595;
  packet->size = _11;
  D.17596 = stbi__get8 (s);
  _12 = D.17596;
  packet->type = _12;
  D.17597 = stbi__get8 (s);
  _13 = D.17597;
  packet->channel = _13;
  _14 = packet->channel;
  _15 = (int) _14;
  act_comp = act_comp | _15;
  D.17598 = stbi__at_eof (s);
  _16 = D.17598;
  retval.568 = _16 != 0;
  if (retval.568 != 0) goto <D.17580>; else goto <D.17581>;
  <D.17580>:
  stbi__rewind (s);
  D.17568 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17600>;
  <D.17581>:
  _17 = packet->size;
  if (_17 != 8) goto <D.17582>; else goto <D.17583>;
  <D.17582>:
  stbi__rewind (s);
  D.17568 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17600>;
  <D.17583>:
  if (chained == 0) goto <D.13315>; else goto <D.17584>;
  <D.17584>:
  goto <D.17576>;
  <D.13315>:
  _18 = act_comp & 16;
  if (_18 != 0) goto <D.17586>; else goto <D.17587>;
  <D.17586>:
  iftmp.569 = 4;
  goto <D.17588>;
  <D.17587>:
  iftmp.569 = 3;
  <D.17588>:
  *comp = iftmp.569;
  D.17568 = 1;
  goto <D.17600>;
  <D.17600>:
  dummy = {CLOBBER};
  packets = {CLOBBER};
  goto <D.17589>;
  <D.17589>:
  return D.17568;
  <D.17599>:
  dummy = {CLOBBER};
  packets = {CLOBBER};
  resx 1
}



;; Function stbi__pnm_test (_ZL14stbi__pnm_testP13stbi__context, funcdef_no=961, decl_uid=10239, cgraph_uid=867, symbol_order=897)

stbi__pnm_test (struct stbi__context * s)
{
  unsigned char D.17608;
  unsigned char D.17607;
  char t;
  char p;
  int D.17605;

  D.17607 = stbi__get8 (s);
  _1 = D.17607;
  p = (char) _1;
  D.17608 = stbi__get8 (s);
  _2 = D.17608;
  t = (char) _2;
  if (p != 80) goto <D.17601>; else goto <D.17603>;
  <D.17603>:
  if (t != 53) goto <D.17604>; else goto <D.17602>;
  <D.17604>:
  if (t != 54) goto <D.17601>; else goto <D.17602>;
  <D.17601>:
  stbi__rewind (s);
  D.17605 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17606>;
  <D.17602>:
  D.17605 = 1;
  goto <D.17606>;
  <D.17606>:
  return D.17605;
}



;; Function stbi__pnm_load (_ZL14stbi__pnm_loadP13stbi__contextPiS1_S1_iP17stbi__result_info, funcdef_no=962, decl_uid=10246, cgraph_uid=868, symbol_order=898)

stbi__pnm_load (struct stbi__context * s, int * x, int * y, int * comp, int req_comp, struct stbi__result_info * ri)
{
  stbi_uc * D.17634;
  int D.17633;
  stbi_uc * out;
  bool retval.571;
  void * D.17612;
  bool retval.570;

  _1 = &s->img_n;
  _2 = &s->img_y;
  _3 = &s->img_x;
  D.17633 = stbi__pnm_info (s, _3, _2, _1);
  _4 = D.17633;
  retval.570 = _4 == 0;
  if (retval.570 != 0) goto <D.17610>; else goto <D.17611>;
  <D.17610>:
  D.17612 = 0B;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17632>;
  <D.17611>:
  _5 = s->img_y;
  if (_5 > 16777216) goto <D.17613>; else goto <D.17614>;
  <D.17613>:
  stbi__err ("too large");
  D.17612 = 0B;
  goto <D.17632>;
  <D.17614>:
  _6 = s->img_x;
  if (_6 > 16777216) goto <D.17615>; else goto <D.17616>;
  <D.17615>:
  stbi__err ("too large");
  D.17612 = 0B;
  goto <D.17632>;
  <D.17616>:
  _7 = s->img_x;
  _8 = (int) _7;
  *x = _8;
  _9 = s->img_y;
  _10 = (int) _9;
  *y = _10;
  if (comp != 0B) goto <D.17617>; else goto <D.17618>;
  <D.17617>:
  _11 = s->img_n;
  *comp = _11;
  goto <D.17619>;
  <D.17618>:
  <D.17619>:
  _12 = s->img_y;
  _13 = (int) _12;
  _14 = s->img_x;
  _15 = (int) _14;
  _16 = s->img_n;
  _17 = stbi__mad3sizes_valid (_16, _15, _13, 0);
  retval.571 = _17 == 0;
  if (retval.571 != 0) goto <D.17621>; else goto <D.17622>;
  <D.17621>:
  stbi__err ("too large");
  D.17612 = 0B;
  goto <D.17632>;
  <D.17622>:
  _18 = s->img_y;
  _19 = (int) _18;
  _20 = s->img_x;
  _21 = (int) _20;
  _22 = s->img_n;
  out = stbi__malloc_mad3 (_22, _21, _19, 0);
  if (out == 0B) goto <D.17623>; else goto <D.17624>;
  <D.17623>:
  stbi__err ("outofmem");
  D.17612 = 0B;
  goto <D.17632>;
  <D.17624>:
  _23 = s->img_n;
  _24 = (unsigned int) _23;
  _25 = s->img_x;
  _26 = _24 * _25;
  _27 = s->img_y;
  _28 = _26 * _27;
  _29 = (int) _28;
  stbi__getn (s, out, _29);
  if (req_comp != 0) goto <D.17625>; else goto <D.17626>;
  <D.17625>:
  _30 = s->img_n;
  if (req_comp != _30) goto <D.17627>; else goto <D.17628>;
  <D.17627>:
  _31 = s->img_y;
  _32 = s->img_x;
  _33 = s->img_n;
  D.17634 = stbi__convert_format (out, _33, req_comp, _32, _31);
  out = D.17634;
  if (out == 0B) goto <D.17629>; else goto <D.17630>;
  <D.17629>:
  D.17612 = out;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17632>;
  <D.17630>:
  goto <D.17631>;
  <D.17628>:
  <D.17631>:
  <D.17626>:
  D.17612 = out;
  goto <D.17632>;
  <D.17632>:
  return D.17612;
}



;; Function stbi__pnm_isspace (_ZL17stbi__pnm_isspacec, funcdef_no=963, decl_uid=13332, cgraph_uid=869, symbol_order=899)

stbi__pnm_isspace (char c)
{
  bool iftmp.572;
  int D.17635;

  if (c == 32) goto <D.17637>; else goto <D.17640>;
  <D.17640>:
  if (c == 9) goto <D.17637>; else goto <D.17641>;
  <D.17641>:
  if (c == 10) goto <D.17637>; else goto <D.17642>;
  <D.17642>:
  if (c == 11) goto <D.17637>; else goto <D.17643>;
  <D.17643>:
  if (c == 12) goto <D.17637>; else goto <D.17644>;
  <D.17644>:
  if (c == 13) goto <D.17637>; else goto <D.17638>;
  <D.17637>:
  iftmp.572 = 1;
  goto <D.17639>;
  <D.17638>:
  iftmp.572 = 0;
  <D.17639>:
  D.17635 = (int) iftmp.572;
  goto <D.17645>;
  <D.17645>:
  return D.17635;
}



;; Function stbi__pnm_skip_whitespace (_ZL25stbi__pnm_skip_whitespaceP13stbi__contextPc, funcdef_no=964, decl_uid=13336, cgraph_uid=870, symbol_order=900)

stbi__pnm_skip_whitespace (struct stbi__context * s, char * c)
{
  unsigned char D.17676;
  int D.17675;
  int D.17674;
  unsigned char D.17673;
  int D.17672;
  bool iftmp.578;
  bool retval.577;
  bool iftmp.576;
  bool retval.575;
  bool iftmp.574;
  bool retval.573;

  <D.17646>:
  <D.17647>:
  D.17672 = stbi__at_eof (s);
  _1 = D.17672;
  if (_1 == 0) goto <D.17652>; else goto <D.17650>;
  <D.17652>:
  _2 = *c;
  _3 = (int) _2;
  _4 = stbi__pnm_isspace (_3);
  if (_4 != 0) goto <D.17653>; else goto <D.17650>;
  <D.17653>:
  iftmp.574 = 1;
  goto <D.17651>;
  <D.17650>:
  iftmp.574 = 0;
  <D.17651>:
  retval.573 = iftmp.574;
  if (retval.573 != 0) goto <D.17654>; else goto <D.13340>;
  <D.17654>:
  D.17673 = stbi__get8 (s);
  _5 = D.17673;
  _6 = (char) _5;
  *c = _6;
  goto <D.17647>;
  <D.13340>:
  D.17674 = stbi__at_eof (s);
  _7 = D.17674;
  if (_7 != 0) goto <D.17657>; else goto <D.17660>;
  <D.17660>:
  _8 = *c;
  if (_8 != 35) goto <D.17657>; else goto <D.17658>;
  <D.17657>:
  iftmp.576 = 1;
  goto <D.17659>;
  <D.17658>:
  iftmp.576 = 0;
  <D.17659>:
  retval.575 = iftmp.576;
  if (retval.575 != 0) goto <D.17661>; else goto <D.17662>;
  <D.17661>:
  goto <D.13338>;
  <D.17662>:
  <D.17663>:
  D.17675 = stbi__at_eof (s);
  _9 = D.17675;
  if (_9 == 0) goto <D.17668>; else goto <D.17666>;
  <D.17668>:
  _10 = *c;
  if (_10 != 10) goto <D.17669>; else goto <D.17666>;
  <D.17669>:
  _11 = *c;
  if (_11 != 13) goto <D.17670>; else goto <D.17666>;
  <D.17670>:
  iftmp.578 = 1;
  goto <D.17667>;
  <D.17666>:
  iftmp.578 = 0;
  <D.17667>:
  retval.577 = iftmp.578;
  if (retval.577 != 0) goto <D.17671>; else goto <D.13342>;
  <D.17671>:
  D.17676 = stbi__get8 (s);
  _12 = D.17676;
  _13 = (char) _12;
  *c = _13;
  goto <D.17663>;
  <D.13342>:
  goto <D.17646>;
  <D.13338>:
  return;
}



;; Function stbi__pnm_isdigit (_ZL17stbi__pnm_isdigitc, funcdef_no=965, decl_uid=13345, cgraph_uid=871, symbol_order=901)

stbi__pnm_isdigit (char c)
{
  bool iftmp.579;
  int D.17677;

  if (c > 47) goto <D.17681>; else goto <D.17679>;
  <D.17681>:
  if (c <= 57) goto <D.17682>; else goto <D.17679>;
  <D.17682>:
  iftmp.579 = 1;
  goto <D.17680>;
  <D.17679>:
  iftmp.579 = 0;
  <D.17680>:
  D.17677 = (int) iftmp.579;
  goto <D.17683>;
  <D.17683>:
  return D.17677;
}



;; Function stbi__pnm_getinteger (_ZL20stbi__pnm_getintegerP13stbi__contextPc, funcdef_no=966, decl_uid=13349, cgraph_uid=872, symbol_order=902)

stbi__pnm_getinteger (struct stbi__context * s, char * c)
{
  unsigned char D.17695;
  int D.17694;
  int value;
  int D.17692;
  bool iftmp.581;
  bool retval.580;

  value = 0;
  <D.17684>:
  D.17694 = stbi__at_eof (s);
  _1 = D.17694;
  if (_1 == 0) goto <D.17689>; else goto <D.17687>;
  <D.17689>:
  _2 = *c;
  _3 = (int) _2;
  _4 = stbi__pnm_isdigit (_3);
  if (_4 != 0) goto <D.17690>; else goto <D.17687>;
  <D.17690>:
  iftmp.581 = 1;
  goto <D.17688>;
  <D.17687>:
  iftmp.581 = 0;
  <D.17688>:
  retval.580 = iftmp.581;
  if (retval.580 != 0) goto <D.17691>; else goto <D.13352>;
  <D.17691>:
  _5 = value * 10;
  _6 = *c;
  _7 = (int) _6;
  _8 = _7 + -48;
  value = _5 + _8;
  D.17695 = stbi__get8 (s);
  _9 = D.17695;
  _10 = (char) _9;
  *c = _10;
  goto <D.17684>;
  <D.13352>:
  D.17692 = value;
  goto <D.17693>;
  <D.17693>:
  return D.17692;
}



;; Function stbi__pnm_info (_ZL14stbi__pnm_infoP13stbi__contextPiS1_S1_, funcdef_no=967, decl_uid=10251, cgraph_uid=873, symbol_order=903)

stbi__pnm_info (struct stbi__context * s, int * x, int * y, int * comp)
{
  int D.17722;
  int D.17721;
  int D.17720;
  unsigned char D.17719;
  unsigned char D.17718;
  unsigned char D.17717;
  char t;
  char p;
  char c;
  int dummy;
  int maxv;
  int iftmp.582;
  int D.17709;

  if (x == 0B) goto <D.17696>; else goto <D.17697>;
  <D.17696>:
  x = &dummy;
  goto <D.17698>;
  <D.17697>:
  <D.17698>:
  if (y == 0B) goto <D.17699>; else goto <D.17700>;
  <D.17699>:
  y = &dummy;
  goto <D.17701>;
  <D.17700>:
  <D.17701>:
  if (comp == 0B) goto <D.17702>; else goto <D.17703>;
  <D.17702>:
  comp = &dummy;
  goto <D.17704>;
  <D.17703>:
  <D.17704>:
  stbi__rewind (s);
  D.17717 = stbi__get8 (s);
  _1 = D.17717;
  p = (char) _1;
  D.17718 = stbi__get8 (s);
  _2 = D.17718;
  t = (char) _2;
  if (p != 80) goto <D.17705>; else goto <D.17707>;
  <D.17707>:
  if (t != 53) goto <D.17708>; else goto <D.17706>;
  <D.17708>:
  if (t != 54) goto <D.17705>; else goto <D.17706>;
  <D.17705>:
  stbi__rewind (s);
  D.17709 = 0;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17724>;
  <D.17706>:
  if (t == 54) goto <D.17711>; else goto <D.17712>;
  <D.17711>:
  iftmp.582 = 3;
  goto <D.17713>;
  <D.17712>:
  iftmp.582 = 1;
  <D.17713>:
  *comp = iftmp.582;
  D.17719 = stbi__get8 (s);
  _3 = D.17719;
  _4 = (char) _3;
  c = _4;
  stbi__pnm_skip_whitespace (s, &c);
  D.17720 = stbi__pnm_getinteger (s, &c);
  _5 = D.17720;
  *x = _5;
  stbi__pnm_skip_whitespace (s, &c);
  D.17721 = stbi__pnm_getinteger (s, &c);
  _6 = D.17721;
  *y = _6;
  stbi__pnm_skip_whitespace (s, &c);
  D.17722 = stbi__pnm_getinteger (s, &c);
  maxv = D.17722;
  if (maxv > 255) goto <D.17714>; else goto <D.17715>;
  <D.17714>:
  D.17709 = stbi__err ("max value > 255");
  goto <D.17724>;
  <D.17715>:
  D.17709 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17724>;
  <D.17724>:
  dummy = {CLOBBER};
  c = {CLOBBER};
  goto <D.17716>;
  <D.17716>:
  return D.17709;
  <D.17723>:
  dummy = {CLOBBER};
  c = {CLOBBER};
  resx 1
}



;; Function stbi__info_main (_ZL15stbi__info_mainP13stbi__contextPiS1_S1_, funcdef_no=968, decl_uid=13369, cgraph_uid=874, symbol_order=904)

stbi__info_main (struct stbi__context * s, int * x, int * y, int * comp)
{
  int D.17762;
  int D.17761;
  int D.17760;
  int D.17759;
  int D.17758;
  int D.17757;
  int D.17756;
  int D.17755;
  int D.17754;
  bool retval.591;
  bool retval.590;
  bool retval.589;
  bool retval.588;
  bool retval.587;
  bool retval.586;
  bool retval.585;
  bool retval.584;
  int D.17728;
  bool retval.583;

  D.17754 = stbi__jpeg_info (s, x, y, comp);
  _1 = D.17754;
  retval.583 = _1 != 0;
  if (retval.583 != 0) goto <D.17726>; else goto <D.17727>;
  <D.17726>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17727>:
  D.17755 = stbi__png_info (s, x, y, comp);
  _2 = D.17755;
  retval.584 = _2 != 0;
  if (retval.584 != 0) goto <D.17730>; else goto <D.17731>;
  <D.17730>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17731>:
  D.17756 = stbi__gif_info (s, x, y, comp);
  _3 = D.17756;
  retval.585 = _3 != 0;
  if (retval.585 != 0) goto <D.17733>; else goto <D.17734>;
  <D.17733>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17734>:
  D.17757 = stbi__bmp_info (s, x, y, comp);
  _4 = D.17757;
  retval.586 = _4 != 0;
  if (retval.586 != 0) goto <D.17736>; else goto <D.17737>;
  <D.17736>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17737>:
  D.17758 = stbi__psd_info (s, x, y, comp);
  _5 = D.17758;
  retval.587 = _5 != 0;
  if (retval.587 != 0) goto <D.17739>; else goto <D.17740>;
  <D.17739>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17740>:
  D.17759 = stbi__pic_info (s, x, y, comp);
  _6 = D.17759;
  retval.588 = _6 != 0;
  if (retval.588 != 0) goto <D.17742>; else goto <D.17743>;
  <D.17742>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17743>:
  D.17760 = stbi__pnm_info (s, x, y, comp);
  _7 = D.17760;
  retval.589 = _7 != 0;
  if (retval.589 != 0) goto <D.17745>; else goto <D.17746>;
  <D.17745>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17746>:
  D.17761 = stbi__hdr_info (s, x, y, comp);
  _8 = D.17761;
  retval.590 = _8 != 0;
  if (retval.590 != 0) goto <D.17748>; else goto <D.17749>;
  <D.17748>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17749>:
  D.17762 = stbi__tga_info (s, x, y, comp);
  _9 = D.17762;
  retval.591 = _9 != 0;
  if (retval.591 != 0) goto <D.17751>; else goto <D.17752>;
  <D.17751>:
  D.17728 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17753>;
  <D.17752>:
  D.17728 = stbi__err ("unknown image type");
  goto <D.17753>;
  <D.17753>:
  return D.17728;
}



;; Function stbi__is_16_main (_ZL16stbi__is_16_mainP13stbi__context, funcdef_no=969, decl_uid=13372, cgraph_uid=875, symbol_order=905)

stbi__is_16_main (struct stbi__context * s)
{
  int D.17772;
  int D.17771;
  bool retval.593;
  int D.17766;
  bool retval.592;

  D.17771 = stbi__png_is16 (s);
  _1 = D.17771;
  retval.592 = _1 != 0;
  if (retval.592 != 0) goto <D.17764>; else goto <D.17765>;
  <D.17764>:
  D.17766 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17770>;
  <D.17765>:
  D.17772 = stbi__psd_is16 (s);
  _2 = D.17772;
  retval.593 = _2 != 0;
  if (retval.593 != 0) goto <D.17768>; else goto <D.17769>;
  <D.17768>:
  D.17766 = 1;
  // predicted unlikely by early return (on trees) predictor.
  goto <D.17770>;
  <D.17769>:
  D.17766 = 0;
  goto <D.17770>;
  <D.17770>:
  return D.17766;
}



;; Function stbi_info (stbi_info, funcdef_no=970, decl_uid=5097, cgraph_uid=876, symbol_order=906)

stbi_info (const char * filename, int * x, int * y, int * comp)
{
  int D.17778;
  struct FILE * D.17777;
  int result;
  struct FILE * f;
  int D.17775;

  D.17777 = stbi__fopen (filename, "rb");
  f = D.17777;
  if (f == 0B) goto <D.17773>; else goto <D.17774>;
  <D.17773>:
  D.17775 = stbi__err ("can\'t fopen");
  goto <D.17776>;
  <D.17774>:
  D.17778 = stbi_info_from_file (f, x, y, comp);
  result = D.17778;
  fclose (f);
  D.17775 = result;
  goto <D.17776>;
  <D.17776>:
  return D.17775;
}



;; Function stbi_info_from_file (stbi_info_from_file, funcdef_no=971, decl_uid=5102, cgraph_uid=877, symbol_order=907)

stbi_info_from_file (struct FILE * f, int * x, int * y, int * comp)
{
  int D.17782;
  long int D.17781;
  long int pos;
  struct stbi__context s;
  int r;
  int D.17779;

  D.17781 = ftell (f);
  pos = D.17781;
  stbi__start_file (&s, f);
  D.17782 = stbi__info_main (&s, x, y, comp);
  r = D.17782;
  fseek (f, pos, 0);
  D.17779 = r;
  goto <D.17784>;
  <D.17784>:
  s = {CLOBBER};
  goto <D.17780>;
  <D.17780>:
  return D.17779;
  <D.17783>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_is_16_bit (stbi_is_16_bit, funcdef_no=972, decl_uid=5104, cgraph_uid=878, symbol_order=908)

stbi_is_16_bit (const char * filename)
{
  int D.17790;
  struct FILE * D.17789;
  int result;
  struct FILE * f;
  int D.17787;

  D.17789 = stbi__fopen (filename, "rb");
  f = D.17789;
  if (f == 0B) goto <D.17785>; else goto <D.17786>;
  <D.17785>:
  D.17787 = stbi__err ("can\'t fopen");
  goto <D.17788>;
  <D.17786>:
  D.17790 = stbi_is_16_bit_from_file (f);
  result = D.17790;
  fclose (f);
  D.17787 = result;
  goto <D.17788>;
  <D.17788>:
  return D.17787;
}



;; Function stbi_is_16_bit_from_file (stbi_is_16_bit_from_file, funcdef_no=973, decl_uid=5106, cgraph_uid=879, symbol_order=909)

stbi_is_16_bit_from_file (struct FILE * f)
{
  int D.17794;
  long int D.17793;
  long int pos;
  struct stbi__context s;
  int r;
  int D.17791;

  D.17793 = ftell (f);
  pos = D.17793;
  stbi__start_file (&s, f);
  D.17794 = stbi__is_16_main (&s);
  r = D.17794;
  fseek (f, pos, 0);
  D.17791 = r;
  goto <D.17796>;
  <D.17796>:
  s = {CLOBBER};
  goto <D.17792>;
  <D.17792>:
  return D.17791;
  <D.17795>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_info_from_memory (stbi_info_from_memory, funcdef_no=974, decl_uid=5080, cgraph_uid=880, symbol_order=910)

stbi_info_from_memory (const stbi_uc * buffer, int len, int * x, int * y, int * comp)
{
  int D.17799;
  struct stbi__context s;
  int D.17797;

  stbi__start_mem (&s, buffer, len);
  D.17799 = stbi__info_main (&s, x, y, comp);
  D.17797 = D.17799;
  goto <D.17801>;
  <D.17801>:
  s = {CLOBBER};
  goto <D.17798>;
  <D.17798>:
  return D.17797;
  <D.17800>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_info_from_callbacks (stbi_info_from_callbacks, funcdef_no=975, decl_uid=5086, cgraph_uid=881, symbol_order=911)

stbi_info_from_callbacks (const struct stbi_io_callbacks * c, void * user, int * x, int * y, int * comp)
{
  int D.17804;
  struct stbi__context s;
  int D.17802;

  stbi__start_callbacks (&s, c, user);
  D.17804 = stbi__info_main (&s, x, y, comp);
  D.17802 = D.17804;
  goto <D.17806>;
  <D.17806>:
  s = {CLOBBER};
  goto <D.17803>;
  <D.17803>:
  return D.17802;
  <D.17805>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_is_16_bit_from_memory (stbi_is_16_bit_from_memory, funcdef_no=976, decl_uid=5089, cgraph_uid=882, symbol_order=912)

stbi_is_16_bit_from_memory (const stbi_uc * buffer, int len)
{
  int D.17809;
  struct stbi__context s;
  int D.17807;

  stbi__start_mem (&s, buffer, len);
  D.17809 = stbi__is_16_main (&s);
  D.17807 = D.17809;
  goto <D.17811>;
  <D.17811>:
  s = {CLOBBER};
  goto <D.17808>;
  <D.17808>:
  return D.17807;
  <D.17810>:
  s = {CLOBBER};
  resx 1
}



;; Function stbi_is_16_bit_from_callbacks (stbi_is_16_bit_from_callbacks, funcdef_no=977, decl_uid=5092, cgraph_uid=883, symbol_order=913)

stbi_is_16_bit_from_callbacks (const struct stbi_io_callbacks * c, void * user)
{
  int D.17814;
  struct stbi__context s;
  int D.17812;

  stbi__start_callbacks (&s, c, user);
  D.17814 = stbi__is_16_main (&s);
  D.17812 = D.17814;
  goto <D.17816>;
  <D.17816>:
  s = {CLOBBER};
  goto <D.17813>;
  <D.17813>:
  return D.17812;
  <D.17815>:
  s = {CLOBBER};
  resx 1
}


