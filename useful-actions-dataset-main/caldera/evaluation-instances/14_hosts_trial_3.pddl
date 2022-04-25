;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 14 hosts, 4 user, 2 admin per host, 2 active account per host
(define (problem p14_hosts_trial_3)
(:domain caldera)
(:objects id_eoSchtask id_etSchtask id_euSchtask id_esSchtask id_evSchtask id_ezSchtask id_ewSchtask id_erSchtask id_fbSchtask id_epSchtask id_eqSchtask id_eySchtask id_faSchtask id_exSchtask - ObservedSchtask 
 id_kDomainUser id_gDomainUser id_oDomainUser id_cDomainUser - ObservedDomainUser 
 id_fwFile id_fvFile id_fuFile id_fxFile id_frFile id_fsFile id_gbFile id_ftFile id_gdFile id_gcFile id_gaFile id_fzFile id_fyFile id_fqFile - ObservedFile 
 id_ghRat id_gkRat id_gnRat id_ggRat id_goRat id_gjRat id_emRat id_geRat id_gmRat id_gpRat id_grRat id_gfRat id_giRat id_glRat id_gqRat - ObservedRat 
 str__alpha str__f str__bm str__n str__db str__dc str__da str__ct str__el str__bl str__bz str__x str__ee str__dj str__w str__ej str__cm str__dh str__by str__bk str__y str__ed str__cn str__do str__bt str__ek str__james str__ca str__j str__bd str__bf str__b str__dv str__br str__co str__m str__cg str__patricia str__dw str__dp str__ch str__ec str__cu str__r str__john str__cv str__mary str__en str__q str__be str__bs str__cf str__e str__i str__di str__dx str__dq - string 
 id_aDomain - ObservedDomain 
 id_dDomainCredential id_lDomainCredential id_hDomainCredential id_pDomainCredential - ObservedDomainCredential 
 num__21 num__42 num__27 num__105 num__112 num__49 num__77 num__91 num__84 num__28 num__20 num__111 num__62 num__70 num__104 num__63 num__48 num__34 num__41 num__98 num__55 num__69 num__76 num__83 num__56 num__35 num__90 num__97 - num 
 id_fdShare id_fgShare id_fjShare id_foShare id_fhShare id_ffShare id_flShare id_fmShare id_fpShare id_fnShare id_feShare id_fcShare id_fkShare id_fiShare - ObservedShare 
 id_ddHost id_drHost id_bgHost id_dyHost id_dkHost id_cwHost id_efHost id_buHost id_ciHost id_cpHost id_cbHost id_sHost id_bnHost id_zHost - ObservedHost 
 id_cxTimeDelta id_ccTimeDelta id_cqTimeDelta id_dzTimeDelta id_dsTimeDelta id_bvTimeDelta id_tTimeDelta id_deTimeDelta id_egTimeDelta id_baTimeDelta id_dlTimeDelta id_boTimeDelta id_cjTimeDelta id_bhTimeDelta - ObservedTimeDelta 
)
(:init     (knows id_ciHost)
     (knows id_emRat)
     (knows_property id_ciHost pfqdn)
     (knows_property id_emRat pexecutable)
     (knows_property id_emRat phost)
     (mem_cached_domain_creds id_bgHost id_dDomainCredential)
     (mem_cached_domain_creds id_bgHost id_pDomainCredential)
     (mem_cached_domain_creds id_bnHost id_hDomainCredential)
     (mem_cached_domain_creds id_bnHost id_lDomainCredential)
     (mem_cached_domain_creds id_buHost id_hDomainCredential)
     (mem_cached_domain_creds id_buHost id_lDomainCredential)
     (mem_cached_domain_creds id_cbHost id_hDomainCredential)
     (mem_cached_domain_creds id_cbHost id_pDomainCredential)
     (mem_cached_domain_creds id_ciHost id_lDomainCredential)
     (mem_cached_domain_creds id_ciHost id_pDomainCredential)
     (mem_cached_domain_creds id_cpHost id_dDomainCredential)
     (mem_cached_domain_creds id_cpHost id_hDomainCredential)
     (mem_cached_domain_creds id_cwHost id_lDomainCredential)
     (mem_cached_domain_creds id_cwHost id_pDomainCredential)
     (mem_cached_domain_creds id_ddHost id_hDomainCredential)
     (mem_cached_domain_creds id_ddHost id_lDomainCredential)
     (mem_cached_domain_creds id_dkHost id_dDomainCredential)
     (mem_cached_domain_creds id_dkHost id_hDomainCredential)
     (mem_cached_domain_creds id_drHost id_dDomainCredential)
     (mem_cached_domain_creds id_drHost id_pDomainCredential)
     (mem_cached_domain_creds id_dyHost id_hDomainCredential)
     (mem_cached_domain_creds id_dyHost id_pDomainCredential)
     (mem_cached_domain_creds id_efHost id_hDomainCredential)
     (mem_cached_domain_creds id_efHost id_pDomainCredential)
     (mem_cached_domain_creds id_sHost id_lDomainCredential)
     (mem_cached_domain_creds id_sHost id_pDomainCredential)
     (mem_cached_domain_creds id_zHost id_hDomainCredential)
     (mem_cached_domain_creds id_zHost id_lDomainCredential)
     (mem_domain_user_admins id_bgHost id_kDomainUser)
     (mem_domain_user_admins id_bgHost id_oDomainUser)
     (mem_domain_user_admins id_bnHost id_cDomainUser)
     (mem_domain_user_admins id_bnHost id_kDomainUser)
     (mem_domain_user_admins id_buHost id_cDomainUser)
     (mem_domain_user_admins id_buHost id_gDomainUser)
     (mem_domain_user_admins id_cbHost id_gDomainUser)
     (mem_domain_user_admins id_cbHost id_kDomainUser)
     (mem_domain_user_admins id_ciHost id_kDomainUser)
     (mem_domain_user_admins id_ciHost id_oDomainUser)
     (mem_domain_user_admins id_cpHost id_kDomainUser)
     (mem_domain_user_admins id_cpHost id_oDomainUser)
     (mem_domain_user_admins id_cwHost id_gDomainUser)
     (mem_domain_user_admins id_cwHost id_oDomainUser)
     (mem_domain_user_admins id_ddHost id_kDomainUser)
     (mem_domain_user_admins id_ddHost id_oDomainUser)
     (mem_domain_user_admins id_dkHost id_gDomainUser)
     (mem_domain_user_admins id_dkHost id_oDomainUser)
     (mem_domain_user_admins id_drHost id_gDomainUser)
     (mem_domain_user_admins id_drHost id_oDomainUser)
     (mem_domain_user_admins id_dyHost id_cDomainUser)
     (mem_domain_user_admins id_dyHost id_kDomainUser)
     (mem_domain_user_admins id_efHost id_gDomainUser)
     (mem_domain_user_admins id_efHost id_kDomainUser)
     (mem_domain_user_admins id_sHost id_cDomainUser)
     (mem_domain_user_admins id_sHost id_kDomainUser)
     (mem_domain_user_admins id_zHost id_cDomainUser)
     (mem_domain_user_admins id_zHost id_oDomainUser)
     (mem_hosts id_aDomain id_bgHost)
     (mem_hosts id_aDomain id_bnHost)
     (mem_hosts id_aDomain id_buHost)
     (mem_hosts id_aDomain id_cbHost)
     (mem_hosts id_aDomain id_ciHost)
     (mem_hosts id_aDomain id_cpHost)
     (mem_hosts id_aDomain id_cwHost)
     (mem_hosts id_aDomain id_ddHost)
     (mem_hosts id_aDomain id_dkHost)
     (mem_hosts id_aDomain id_drHost)
     (mem_hosts id_aDomain id_dyHost)
     (mem_hosts id_aDomain id_efHost)
     (mem_hosts id_aDomain id_sHost)
     (mem_hosts id_aDomain id_zHost)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_dc id_bgHost no)
     (prop_dc id_bnHost no)
     (prop_dc id_buHost no)
     (prop_dc id_cbHost no)
     (prop_dc id_ciHost no)
     (prop_dc id_cpHost no)
     (prop_dc id_cwHost yes)
     (prop_dc id_ddHost yes)
     (prop_dc id_dkHost no)
     (prop_dc id_drHost no)
     (prop_dc id_dyHost no)
     (prop_dc id_efHost yes)
     (prop_dc id_sHost no)
     (prop_dc id_zHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_bgHost str__bk)
     (prop_dns_domain_name id_bnHost str__br)
     (prop_dns_domain_name id_buHost str__by)
     (prop_dns_domain_name id_cbHost str__cf)
     (prop_dns_domain_name id_ciHost str__cm)
     (prop_dns_domain_name id_cpHost str__ct)
     (prop_dns_domain_name id_cwHost str__da)
     (prop_dns_domain_name id_ddHost str__dh)
     (prop_dns_domain_name id_dkHost str__do)
     (prop_dns_domain_name id_drHost str__dv)
     (prop_dns_domain_name id_dyHost str__ec)
     (prop_dns_domain_name id_efHost str__ej)
     (prop_dns_domain_name id_sHost str__w)
     (prop_dns_domain_name id_zHost str__bd)
     (prop_domain id_bgHost id_aDomain)
     (prop_domain id_bnHost id_aDomain)
     (prop_domain id_buHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_cbHost id_aDomain)
     (prop_domain id_ciHost id_aDomain)
     (prop_domain id_cpHost id_aDomain)
     (prop_domain id_cwHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_ddHost id_aDomain)
     (prop_domain id_dkHost id_aDomain)
     (prop_domain id_drHost id_aDomain)
     (prop_domain id_dyHost id_aDomain)
     (prop_domain id_efHost id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sHost id_aDomain)
     (prop_domain id_zHost id_aDomain)
     (prop_elevated id_emRat yes)
     (prop_executable id_emRat str__en)
     (prop_fqdn id_bgHost str__bl)
     (prop_fqdn id_bnHost str__bs)
     (prop_fqdn id_buHost str__bz)
     (prop_fqdn id_cbHost str__cg)
     (prop_fqdn id_ciHost str__cn)
     (prop_fqdn id_cpHost str__cu)
     (prop_fqdn id_cwHost str__db)
     (prop_fqdn id_ddHost str__di)
     (prop_fqdn id_dkHost str__dp)
     (prop_fqdn id_drHost str__dw)
     (prop_fqdn id_dyHost str__ed)
     (prop_fqdn id_efHost str__ek)
     (prop_fqdn id_sHost str__x)
     (prop_fqdn id_zHost str__be)
     (prop_host id_baTimeDelta id_zHost)
     (prop_host id_bhTimeDelta id_bgHost)
     (prop_host id_boTimeDelta id_bnHost)
     (prop_host id_bvTimeDelta id_buHost)
     (prop_host id_ccTimeDelta id_cbHost)
     (prop_host id_cjTimeDelta id_ciHost)
     (prop_host id_cqTimeDelta id_cpHost)
     (prop_host id_cxTimeDelta id_cwHost)
     (prop_host id_deTimeDelta id_ddHost)
     (prop_host id_dlTimeDelta id_dkHost)
     (prop_host id_dsTimeDelta id_drHost)
     (prop_host id_dzTimeDelta id_dyHost)
     (prop_host id_egTimeDelta id_efHost)
     (prop_host id_emRat id_ciHost)
     (prop_host id_tTimeDelta id_sHost)
     (prop_hostname id_bgHost str__bm)
     (prop_hostname id_bnHost str__bt)
     (prop_hostname id_buHost str__ca)
     (prop_hostname id_cbHost str__ch)
     (prop_hostname id_ciHost str__co)
     (prop_hostname id_cpHost str__cv)
     (prop_hostname id_cwHost str__dc)
     (prop_hostname id_ddHost str__dj)
     (prop_hostname id_dkHost str__dq)
     (prop_hostname id_drHost str__dx)
     (prop_hostname id_dyHost str__ee)
     (prop_hostname id_efHost str__el)
     (prop_hostname id_sHost str__y)
     (prop_hostname id_zHost str__bf)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_microseconds id_baTimeDelta num__27)
     (prop_microseconds id_bhTimeDelta num__34)
     (prop_microseconds id_boTimeDelta num__41)
     (prop_microseconds id_bvTimeDelta num__48)
     (prop_microseconds id_ccTimeDelta num__55)
     (prop_microseconds id_cjTimeDelta num__62)
     (prop_microseconds id_cqTimeDelta num__69)
     (prop_microseconds id_cxTimeDelta num__76)
     (prop_microseconds id_deTimeDelta num__83)
     (prop_microseconds id_dlTimeDelta num__90)
     (prop_microseconds id_dsTimeDelta num__97)
     (prop_microseconds id_dzTimeDelta num__104)
     (prop_microseconds id_egTimeDelta num__111)
     (prop_microseconds id_tTimeDelta num__20)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_seconds id_baTimeDelta num__28)
     (prop_seconds id_bhTimeDelta num__35)
     (prop_seconds id_boTimeDelta num__42)
     (prop_seconds id_bvTimeDelta num__49)
     (prop_seconds id_ccTimeDelta num__56)
     (prop_seconds id_cjTimeDelta num__63)
     (prop_seconds id_cqTimeDelta num__70)
     (prop_seconds id_cxTimeDelta num__77)
     (prop_seconds id_deTimeDelta num__84)
     (prop_seconds id_dlTimeDelta num__91)
     (prop_seconds id_dsTimeDelta num__98)
     (prop_seconds id_dzTimeDelta num__105)
     (prop_seconds id_egTimeDelta num__112)
     (prop_seconds id_tTimeDelta num__21)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_timedelta id_bgHost id_bhTimeDelta)
     (prop_timedelta id_bnHost id_boTimeDelta)
     (prop_timedelta id_buHost id_bvTimeDelta)
     (prop_timedelta id_cbHost id_ccTimeDelta)
     (prop_timedelta id_ciHost id_cjTimeDelta)
     (prop_timedelta id_cpHost id_cqTimeDelta)
     (prop_timedelta id_cwHost id_cxTimeDelta)
     (prop_timedelta id_ddHost id_deTimeDelta)
     (prop_timedelta id_dkHost id_dlTimeDelta)
     (prop_timedelta id_drHost id_dsTimeDelta)
     (prop_timedelta id_dyHost id_dzTimeDelta)
     (prop_timedelta id_efHost id_egTimeDelta)
     (prop_timedelta id_sHost id_tTimeDelta)
     (prop_timedelta id_zHost id_baTimeDelta)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_user id_hDomainCredential id_gDomainUser)
     (prop_user id_lDomainCredential id_kDomainUser)
     (prop_user id_pDomainCredential id_oDomainUser)
     (prop_username id_cDomainUser str__james)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_gqRat id_zHost)
     (prop_host id_ghRat id_ddHost)
     (prop_host id_gkRat id_drHost)
     (prop_host id_gnRat id_bgHost)
     (prop_host id_ggRat id_dyHost)
     (prop_host id_goRat id_dkHost)
     (prop_host id_gjRat id_cwHost)
     (prop_host id_geRat id_efHost)
     (prop_host id_gmRat id_buHost)
     (prop_host id_gpRat id_cpHost)
     (prop_host id_grRat id_cbHost)
     (prop_host id_gfRat id_sHost)
     (prop_host id_giRat id_bnHost)
)
)
)