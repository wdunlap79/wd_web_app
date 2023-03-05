
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select 2 as id
    union all
    select 3 as id
    union all
    select 4 as id
    union all
    select 5 as id

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null


select
TIME_UNO
,PERIOD as worked_period
,MATTER_UNO as matter_fk
,TK_EMPL_UNO as tk__person_fk
,false as tk_is_dev_attorney -- from participating credit table and bill date (or maybe transaction date from tat_time_new?)
,true as tk_is_org_attorney -- from participating credit table and bill date (or maybe transaction date from tat_time_new?)
,DEPT as tk__dept_fk
,OFFC as tk__offc_fk
,PROF as tk__practice_fk
,RANK_CODE as tk__person_rank_fk
,'' as tk_hist__dept_fk -- from persnl_modd based on bill date
,'' as tk_hist__offc_fk -- from persnl_modd based on bill date
,'' as tk_hist__practice_fk -- from persnl_modd based on bill date
,'' as tk_hist__person_rank_fk -- from persnl_modd based on bill date
,false as is_dev_attorney -- from participating credit table and bill date
,true as is_org_attorney -- from participating credit table and bill date
,PHTASK_UNO
,TASK_CODE
,BILLABLE_FLAG
,LATEST_PERIOD as billed_period -- is this what latest period actually is?
,BILL_TRAN_UNO as bill_trans_fk
,'' as bill_date
,BILLED_EMPL_UNO as bill__person_fk
,'' as bill__dept_fk -- from dim_person
,'' as bill__offc_fk -- from dim_person
,'' as bill__practice_fk --from dim_person
,'' as bill__person_rank_fk -- from dim_person
,'' as bill_hist__dept_fk -- from persnl_modd based on bill date
,'' as bill_hist__offc_fk -- from persnl_modd based on bill date
,'' as bill_hist__practice_fk -- from persnl_modd based on bill date
,'' as bill_hist__person_rank_fk -- from persnl_modd based on bill date
,BASE_HRS
,BASE_AMT
,TOBILL_HRS
,TOBILL_AMT
,BILLED_HRS
,BILLED_AMT
,GROSS_AMT
,STD_AMT
,RETAINED_BILLED_HRS
,RETAINED_BILLED_AMT
,UNSETTLED_BAL
from pc_fivetran_db.adr_live_dbo.tat_time