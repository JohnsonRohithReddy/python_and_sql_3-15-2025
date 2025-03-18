import random
import string

def random_code(prefix, length=3):
    """Generate a random alphanumeric code with a given prefix."""
    return prefix + ''.join(random.choices(string.digits, k=length))

def generate_company_data(num=50):
    return [(random_code('C'), random.choice(['Alice', 'Bob', 'Charlie', 'David', 'Eve'])) for _ in range(num)]

def generate_lead_manager_data(companies, num=50):
    return [(random_code('LM'), random.choice(companies)[0]) for _ in range(num)]

def generate_senior_manager_data(lead_managers, companies, num=50):
    return [(random_code('SM'), random.choice(lead_managers)[0], random.choice(companies)[0]) for _ in range(num)]

def generate_manager_data(senior_managers, lead_managers, companies, num=50):
    return [(random_code('M'), random.choice(senior_managers)[0], random.choice(lead_managers)[0], random.choice(companies)[0]) for _ in range(num)]

def generate_employee_data(managers, senior_managers, lead_managers, companies, num=50):
    return [(random_code('E'), random.choice(managers)[0], random.choice(senior_managers)[0], random.choice(lead_managers)[0], random.choice(companies)[0]) for _ in range(num)]

def generate_department_data(companies, num=50):
    department_names = ['HR', 'Finance', 'Engineering', 'Marketing', 'Sales', 'Support', 'IT', 'Legal']
    return [(random_code('D'), random.choice(department_names), random.choice(companies)[0]) for _ in range(num)]

# Generate data
companies = generate_company_data()
lead_managers = generate_lead_manager_data(companies)
senior_managers = generate_senior_manager_data(lead_managers, companies)
managers = generate_manager_data(senior_managers, lead_managers, companies)
employees = generate_employee_data(managers, senior_managers, lead_managers, companies)
departments = generate_department_data(companies)

# Print the generated data
print("Companies:", companies)
print("Lead Managers:", lead_managers)
print("Senior Managers:", senior_managers)
print("Managers:", managers)
print("Employees:", employees)
print("Departments:", departments)
