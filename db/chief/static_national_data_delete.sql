delete from regulation_groups where national = 1;
delete from regulation_group_descriptions where national = 1;
delete from regulation_role_types where national = 1;
delete from regulation_role_type_descriptions where national = 1;
delete from base_regulations where national = 1;
delete from measure_types where national = 1;
delete from measure_type_descriptions where national = 1;
delete from additional_code_types where national = 1;
delete from additional_code_type_descriptions where national = 1;
delete from additional_code_type_measure_types where national = 1;
delete from additional_codes where additional_code_sid <= -1 and additional_code_sid >= -9999 and national = 1;
/* TODO: is it additional_code_sid or additional_code_description_sid */
delete from additional_code_descriptions where additional_code_sid <= -1 and additional_code_sid >= -9999 and national = 1;
delete from footnote_types where national = 1;
delete from footnote_type_descriptions where national = 1;
delete from footnotes where national = 1;
delete from footnote_description_periods where footnote_description_period_sid <= -1 and footnote_description_period_sid >= -9999 and national = 1;
delete from footnote_descriptions where footnote_description_period_sid <= -1 and footnote_description_period_sid >= -9999 and national = 1;
delete from certificates where national = 1;
delete from certificate_description_periods where national = 1;
delete from certificate_descriptions where national = 1;
delete from certificate_types where national = 1;
delete from certificate_type_descriptions where national = 1;
delete from geographical_area_memberships where national=1;
delete from geographical_area_descriptions where national=1;
delete from geographical_area_description_periods where national=1;
delete from geographical_areas where national=1;
delete from footnote_association_goods_nomenclatures where national=1 and footnote_type='05';
delete from footnote_association_measures where national=1 and footnote_type_id='06';
