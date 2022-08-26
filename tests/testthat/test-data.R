test_that("England shapefile is returned", {
  shp_eng <- england_shp
  expect_identical(class(shp_eng),
                   c("sf", "tbl_df", "tbl", "data.frame"))
})

test_that("London shapefile is returned", {
  shp_lond <- london_shp
  expect_identical(class(shp_lond),
                   c("sf", "tbl_df", "tbl", "data.frame"))
})

test_that("Significance colours are consistent with Fingertips", {
  expect_named(significance_colours)
  expect_identical(names(significance_colours),
                   c("Better", "Same", "Worse", "Not compared"))
})

test_that("England grid has correct dimensions", {
  expect_equal(dim(outside_london_grid),
               c(122, 4))
})

test_that("London grid has correct dimensions", {
  expect_equal(dim(london_grid),
               c(33, 4))
})

