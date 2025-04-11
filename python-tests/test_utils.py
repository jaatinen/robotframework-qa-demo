import pytest
from utils import calculate_bonus

def test_calculate_bonus_default():
    assert calculate_bonus(1000) == 100.0

def test_calculate_bonus_custom_multiplier():
    assert calculate_bonus(2000, multiplier=0.2) == 400.0

def test_calculate_bonus_negative_salary():
    with pytest.raises(ValueError):
        calculate_bonus(-500)
