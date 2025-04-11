# date_utils.py
from datetime import datetime

def get_current_date(result_format="epoch"):
    if result_format == "epoch":
        return int(datetime.now().timestamp())
    raise ValueError("Unsupported result_format: {}".format(result_format))