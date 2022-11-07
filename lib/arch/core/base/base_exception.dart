const baseException =
    """
import '../../utils/helpers/get_snackbars.dart';

class BaseException {
  void showExceptionError(error) {
    GetBars.errorSnackBar(
        error.toString().split('|')[0], error.toString().split('|')[1]);
  }

  void showError(error) {
    GetBars.errorSnackBar('Unknown error', error.toString());
  }
}
    """;