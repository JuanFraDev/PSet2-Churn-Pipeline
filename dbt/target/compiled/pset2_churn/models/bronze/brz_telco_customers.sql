-- Bronze / staging: estandariza nombres y realiza conversiones seguras sin eliminar registros.
select
    trim(customer_id)                      as customer_id,
    trim(gender)                           as gender,
    try_to_number(trim(senior_citizen))   as senior_citizen,
    trim(partner)                          as partner,
    trim(dependents)                       as dependents,
    try_to_number(trim(tenure))           as tenure_months,
    trim(phone_service)                   as phone_service,
    trim(multiple_lines)                  as multiple_lines,
    trim(internet_service)                as internet_service,
    trim(online_security)                 as online_security,
    trim(online_backup)                   as online_backup,
    trim(device_protection)               as device_protection,
    trim(tech_support)                    as tech_support,
    trim(streaming_tv)                    as streaming_tv,
    trim(streaming_movies)                as streaming_movies,
    trim(contract)                        as contract,
    trim(paperless_billing)               as paperless_billing,
    trim(payment_method)                  as payment_method,
    try_to_decimal(trim(monthly_charges), 18, 2) as monthly_charges,
    try_to_decimal(nullif(trim(total_charges), ''), 18, 2) as total_charges,
    nullif(trim(total_charges), '') is null as total_charges_missing,
    trim(churn)                           as churn,
    case
        when trim(churn) = 'Yes' then 1
        when trim(churn) = 'No' then 0
        else null
    end                                   as churn_flag,
    ingested_at
from PSET2_CHURN.RAW.TELCO_CUSTOMER_CHURN