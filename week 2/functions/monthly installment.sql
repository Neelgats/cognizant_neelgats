CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_loan_amount IN NUMBER,
    p_annual_interest_rate IN NUMBER,
    p_loan_duration_years IN NUMBER
) RETURN NUMBER AS
    v_monthly_installment NUMBER;
    v_monthly_interest_rate NUMBER;
    v_number_of_months NUMBER;
BEGIN
    -- Calculate the monthly interest rate
    v_monthly_interest_rate := p_annual_interest_rate / 12 / 100;
    v_number_of_months := p_loan_duration_years * 12;
    
    -- Calculate the monthly installment using the formula
    v_monthly_installment := p_loan_amount * (v_monthly_interest_rate * POWER(1 + v_monthly_interest_rate, v_number_of_months)) / (POWER(1 + v_monthly_interest_rate, v_number_of_months) - 1);
    
    RETURN v_monthly_installment;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in calculating monthly installment: ' || SQLERRM);
        RETURN NULL;
END CalculateMonthlyInstallment;
