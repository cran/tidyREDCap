#' Convert a "choose all that apply" Question Into a Binary Word
#'
#' @description This function takes a data frame holding binary variables with
#'    values corresponding to a dummy-coded "choose all that apply" question.
#'    It can be used for any *binary word* problem.
#'
#' @param df A data frame with the variables corresponding to binary indicators
#'    (the dummy coded variables) for a "choose all that apply" question.
#' @param yes_value A character string that corresponds to choosing "yes"
#'    in the binary variables of `df`. Defaults to the REDCap "Checked" option.
#' @param the_labels A character vector of single letters holding the letters
#'    used to make the binary word. See the article/vignette called "Make
#'    Binary Word" for an example:
#'    <https://raymondbalise.github.io/tidyREDCap/articles/makeBinaryWord.html>.
#'
#' @return A character vector with length equal to the rows of `df`, including
#'    one letter or underscore for each column of `df`. For instance, if `df`
#'    has one column for each of the eight options of the Nacho Craving Index
#'    example instrument (<https://libguides.du.edu/c.php?g=948419&p=6839916>),
#'    with a row containing the values "Chips" (checked), "Yellow cheese"
#'    (unchecked), "Orange cheese" (checked), "White cheese" (checked), "Meat"
#'    (checked), "Beans" (unchecked), "Tomatoes" (unchecked) and "Peppers"
#'    (checked), then the character string corresponding to that row will be
#'    `"a_cde__h"`. The underscores represent that the options for "Yellow
#'    cheese", "Beans", and "Tomatoes" were left unchecked.
#'
#' @importFrom purrr map_chr
#' @importFrom stringr str_replace_na
#' @export
#'
#' @examples
#' test_df <- tibble::tibble(
#'   q1 = c("Unchecked", "Checked"),
#'   q2 = c("Unchecked", "Unchecked"),
#'   q3 = c("Checked", "Checked"),
#'   q4 = c("Checked", "Unchecked")
#' )
#' make_binary_word(test_df)
make_binary_word <- function(df, yes_value = "Checked", the_labels = letters) {
  if (ncol(df) > length(the_labels)) {
    stop(paste(
      "Your `df` has more columns then your labeling variable.",
      "Check the columns of your `df`.  If you really need this many columns,",
      "add more letters with the `the_labels` argument."
    ), call. = FALSE)
  }

  # constants
  nRows <- nrow(df)
  nCols <- ncol(df)

  # vector corresponding to the answer element number (the third choose all
  #   thing is number 3)
  elementsOfPickAll_idxMat <- matrix(
    seq_len(nCols),
    nrow = nRows, ncol = nCols, byrow = TRUE
  )

  # a matrix of true/false indicating if a choice was selected
  matrix_lgl <- as.matrix(df) == yes_value

  # a matrix holing the column number if a value is checked or zero
  chooseAllPatternPerRecord_mat <- matrix_lgl * elementsOfPickAll_idxMat

  # convert the 0 to NA (so they can be easily replaced with _ below)
  chooseAllPatternPerRecord_mat[chooseAllPatternPerRecord_mat == 0] <- NA

  map_chr(
    .x = seq_len(nRows),
    .f = ~ {
      # replace the column number with the latter of the alphabet or the_labels
      lettersAndNA <- the_labels[chooseAllPatternPerRecord_mat[.x, ]]

      # replace 0 with NA
      lettersAndUnderscore <- str_replace_na(lettersAndNA, replacement = "_")

      # glue together the letters and _ to make the owrd
      paste(lettersAndUnderscore, sep = "", collapse = "")
    }
  )
}
