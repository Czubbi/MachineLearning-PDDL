;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 5 hosts, 4 user, 2 admin per host, 2 active account per host
(define (problem p5_hosts_trial_3)
(:domain caldera)
(:objects id_bhTimeDelta id_bvTimeDelta id_boTimeDelta id_tTimeDelta id_baTimeDelta - ObservedTimeDelta 
 id_dDomainCredential id_lDomainCredential id_pDomainCredential id_hDomainCredential - ObservedDomainCredential 
 id_aDomain - ObservedDomain 
 id_gDomainUser id_oDomainUser id_kDomainUser id_cDomainUser - ObservedDomainUser 
 id_cpFile id_coFile id_crFile id_cqFile id_cnFile - ObservedFile 
 id_cdShare id_ceShare id_chShare id_cfShare id_cgShare - ObservedShare 
 num__35 num__49 num__20 num__21 num__34 num__28 num__41 num__48 num__27 num__42 - num 
 id_bgHost id_bnHost id_sHost id_zHost id_buHost - ObservedHost 
 id_cmSchtask id_clSchtask id_cjSchtask id_ciSchtask id_ckSchtask - ObservedSchtask 
 id_csRat id_cwRat id_cvRat id_cbRat id_ctRat id_cuRat - ObservedRat 
 str__james str__alpha str__bt str__q str__n str__bd str__cc str__e str__w str__bz str__bm str__j str__y str__i str__f str__john str__ca str__r str__by str__be str__b str__bs str__x str__m str__bl str__patricia str__mary str__bf str__br str__bk - string 
)
(:init     (knows id_bgHost)
     (knows id_cbRat)
     (knows_property id_bgHost pfqdn)
     (knows_property id_cbRat pexecutable)
     (knows_property id_cbRat phost)
     (mem_cached_domain_creds id_bgHost id_lDomainCredential)
     (mem_cached_domain_creds id_bgHost id_pDomainCredential)
     (mem_cached_domain_creds id_bnHost id_dDomainCredential)
     (mem_cached_domain_creds id_bnHost id_lDomainCredential)
     (mem_cached_domain_creds id_buHost id_dDomainCredential)
     (mem_cached_domain_creds id_buHost id_pDomainCredential)
     (mem_cached_domain_creds id_sHost id_dDomainCredential)
     (mem_cached_domain_creds id_sHost id_hDomainCredential)
     (mem_cached_domain_creds id_zHost id_dDomainCredential)
     (mem_cached_domain_creds id_zHost id_hDomainCredential)
     (mem_domain_user_admins id_bgHost id_kDomainUser)
     (mem_domain_user_admins id_bgHost id_oDomainUser)
     (mem_domain_user_admins id_bnHost id_cDomainUser)
     (mem_domain_user_admins id_bnHost id_oDomainUser)
     (mem_domain_user_admins id_buHost id_cDomainUser)
     (mem_domain_user_admins id_buHost id_oDomainUser)
     (mem_domain_user_admins id_sHost id_kDomainUser)
     (mem_domain_user_admins id_sHost id_oDomainUser)
     (mem_domain_user_admins id_zHost id_cDomainUser)
     (mem_domain_user_admins id_zHost id_oDomainUser)
     (mem_hosts id_aDomain id_bgHost)
     (mem_hosts id_aDomain id_bnHost)
     (mem_hosts id_aDomain id_buHost)
     (mem_hosts id_aDomain id_sHost)
     (mem_hosts id_aDomain id_zHost)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_dc id_bgHost yes)
     (prop_dc id_bnHost no)
     (prop_dc id_buHost no)
     (prop_dc id_sHost yes)
     (prop_dc id_zHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_bgHost str__bm)
     (prop_dns_domain_name id_bnHost str__bt)
     (prop_dns_domain_name id_buHost str__ca)
     (prop_dns_domain_name id_sHost str__y)
     (prop_dns_domain_name id_zHost str__bf)
     (prop_domain id_bgHost id_aDomain)
     (prop_domain id_bnHost id_aDomain)
     (prop_domain id_buHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sHost id_aDomain)
     (prop_domain id_zHost id_aDomain)
     (prop_elevated id_cbRat yes)
     (prop_executable id_cbRat str__cc)
     (prop_fqdn id_bgHost str__bl)
     (prop_fqdn id_bnHost str__bs)
     (prop_fqdn id_buHost str__bz)
     (prop_fqdn id_sHost str__x)
     (prop_fqdn id_zHost str__be)
     (prop_host id_baTimeDelta id_zHost)
     (prop_host id_bhTimeDelta id_bgHost)
     (prop_host id_boTimeDelta id_bnHost)
     (prop_host id_bvTimeDelta id_buHost)
     (prop_host id_cbRat id_bgHost)
     (prop_host id_tTimeDelta id_sHost)
     (prop_hostname id_bgHost str__bk)
     (prop_hostname id_bnHost str__br)
     (prop_hostname id_buHost str__by)
     (prop_hostname id_sHost str__w)
     (prop_hostname id_zHost str__bd)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_microseconds id_baTimeDelta num__28)
     (prop_microseconds id_bhTimeDelta num__35)
     (prop_microseconds id_boTimeDelta num__42)
     (prop_microseconds id_bvTimeDelta num__49)
     (prop_microseconds id_tTimeDelta num__21)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_seconds id_baTimeDelta num__27)
     (prop_seconds id_bhTimeDelta num__34)
     (prop_seconds id_boTimeDelta num__41)
     (prop_seconds id_bvTimeDelta num__48)
     (prop_seconds id_tTimeDelta num__20)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_timedelta id_bgHost id_bhTimeDelta)
     (prop_timedelta id_bnHost id_boTimeDelta)
     (prop_timedelta id_buHost id_bvTimeDelta)
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
     (prop_host id_cvRat id_buHost)
     (prop_host id_ctRat id_bnHost)
     (prop_host id_csRat id_sHost)
     (prop_host id_cwRat id_zHost)
)
)
)