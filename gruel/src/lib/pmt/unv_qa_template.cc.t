void
qa_pmt_unv::test_@TAG@vector()
{
  static const size_t N = 3;
  pmt_t v1 = pmt_make_@TAG@vector(N, 0);
  CPPUNIT_ASSERT_EQUAL(N, pmt_length(v1));
  @TYPE@ s0 = @TYPE@(10);
  @TYPE@ s1 = @TYPE@(20);
  @TYPE@ s2 = @TYPE@(30);

  pmt_@TAG@vector_set(v1, 0, s0);
  pmt_@TAG@vector_set(v1, 1, s1);
  pmt_@TAG@vector_set(v1, 2, s2);

  CPPUNIT_ASSERT_EQUAL(s0, pmt_@TAG@vector_ref(v1, 0));
  CPPUNIT_ASSERT_EQUAL(s1, pmt_@TAG@vector_ref(v1, 1));
  CPPUNIT_ASSERT_EQUAL(s2, pmt_@TAG@vector_ref(v1, 2));

  CPPUNIT_ASSERT_THROW(pmt_@TAG@vector_ref(v1, N), pmt_out_of_range);
  CPPUNIT_ASSERT_THROW(pmt_@TAG@vector_set(v1, N, @TYPE@(0)), pmt_out_of_range);

  size_t	len;
  const @TYPE@ *rd = pmt_@TAG@vector_elements(v1, len);
  CPPUNIT_ASSERT_EQUAL(len, N);
  CPPUNIT_ASSERT_EQUAL(s0, rd[0]);
  CPPUNIT_ASSERT_EQUAL(s1, rd[1]);
  CPPUNIT_ASSERT_EQUAL(s2, rd[2]);

  @TYPE@ *wr = pmt_@TAG@vector_writable_elements(v1, len);
  CPPUNIT_ASSERT_EQUAL(len, N);
  wr[0] = @TYPE@(0);
  CPPUNIT_ASSERT_EQUAL(@TYPE@(0), wr[0]);
  CPPUNIT_ASSERT_EQUAL(s1, wr[1]);
  CPPUNIT_ASSERT_EQUAL(s2, wr[2]);
}
