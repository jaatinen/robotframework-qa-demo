def calculate_bonus(salary, multiplier=0.1):
    """Laskee bonuksen annetun palkan perusteella."""
    if salary < 0:
        raise ValueError("Salary must be positive")
    return salary * multiplier
