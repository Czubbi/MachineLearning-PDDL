;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 6 hosts, 4 user, 2 admin per host, 2 active account per host
(define (problem p6_hosts_trial_3)
(:domain caldera)
(:objects id_aDomain - ObservedDomain 
 id_dcRat id_dgRat id_ddRat id_dhRat id_ciRat id_deRat id_dfRat - ObservedRat 
 id_boTimeDelta id_bvTimeDelta id_tTimeDelta id_ccTimeDelta id_baTimeDelta id_bhTimeDelta - ObservedTimeDelta 
 id_cwShare id_cxShare id_czShare id_cyShare id_dbShare id_daShare - ObservedShare 
 id_cDomainUser id_oDomainUser id_kDomainUser id_gDomainUser - ObservedDomainUser 
 id_clFile id_cpFile id_ckFile id_coFile id_cmFile id_cnFile - ObservedFile 
 num__56 num__21 num__48 num__34 num__41 num__27 num__28 num__55 num__35 num__49 num__20 num__42 - num 
 id_crSchtask id_cvSchtask id_cuSchtask id_ctSchtask id_cqSchtask id_csSchtask - ObservedSchtask 
 id_pDomainCredential id_dDomainCredential id_lDomainCredential id_hDomainCredential - ObservedDomainCredential 
 id_sHost id_buHost id_cbHost id_zHost id_bnHost id_bgHost - ObservedHost 
 str__alpha str__ca str__q str__cj str__ch str__r str__e str__cf str__cg str__br str__bs str__patricia str__bf str__bm str__mary str__b str__f str__john str__w str__m str__bl str__bz str__bt str__bd str__n str__bk str__i str__y str__by str__j str__be str__james str__x - string 
)
(:init     (knows id_bgHost)
     (knows id_ciRat)
     (knows_property id_bgHost pfqdn)
     (knows_property id_ciRat pexecutable)
     (knows_property id_ciRat phost)
     (mem_cached_domain_creds id_bgHost id_lDomainCredential)
     (mem_cached_domain_creds id_bgHost id_pDomainCredential)
     (mem_cached_domain_creds id_bnHost id_hDomainCredential)
     (mem_cached_domain_creds id_bnHost id_pDomainCredential)
     (mem_cached_domain_creds id_buHost id_hDomainCredential)
     (mem_cached_domain_creds id_buHost id_lDomainCredential)
     (mem_cached_domain_creds id_cbHost id_hDomainCredential)
     (mem_cached_domain_creds id_cbHost id_pDomainCredential)
     (mem_cached_domain_creds id_sHost id_lDomainCredential)
     (mem_cached_domain_creds id_sHost id_pDomainCredential)
     (mem_cached_domain_creds id_zHost id_dDomainCredential)
     (mem_cached_domain_creds id_zHost id_pDomainCredential)
     (mem_domain_user_admins id_bgHost id_gDomainUser)
     (mem_domain_user_admins id_bgHost id_oDomainUser)
     (mem_domain_user_admins id_bnHost id_cDomainUser)
     (mem_domain_user_admins id_bnHost id_oDomainUser)
     (mem_domain_user_admins id_buHost id_cDomainUser)
     (mem_domain_user_admins id_buHost id_kDomainUser)
     (mem_domain_user_admins id_cbHost id_gDomainUser)
     (mem_domain_user_admins id_cbHost id_oDomainUser)
     (mem_domain_user_admins id_sHost id_gDomainUser)
     (mem_domain_user_admins id_sHost id_oDomainUser)
     (mem_domain_user_admins id_zHost id_gDomainUser)
     (mem_domain_user_admins id_zHost id_oDomainUser)
     (mem_hosts id_aDomain id_bgHost)
     (mem_hosts id_aDomain id_bnHost)
     (mem_hosts id_aDomain id_buHost)
     (mem_hosts id_aDomain id_cbHost)
     (mem_hosts id_aDomain id_sHost)
     (mem_hosts id_aDomain id_zHost)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_dc id_bgHost no)
     (prop_dc id_bnHost no)
     (prop_dc id_buHost no)
     (prop_dc id_cbHost yes)
     (prop_dc id_sHost no)
     (prop_dc id_zHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_bgHost str__bk)
     (prop_dns_domain_name id_bnHost str__br)
     (prop_dns_domain_name id_buHost str__by)
     (prop_dns_domain_name id_cbHost str__cf)
     (prop_dns_domain_name id_sHost str__w)
     (prop_dns_domain_name id_zHost str__bd)
     (prop_domain id_bgHost id_aDomain)
     (prop_domain id_bnHost id_aDomain)
     (prop_domain id_buHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_cbHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sHost id_aDomain)
     (prop_domain id_zHost id_aDomain)
     (prop_elevated id_ciRat yes)
     (prop_executable id_ciRat str__cj)
     (prop_fqdn id_bgHost str__bl)
     (prop_fqdn id_bnHost str__bs)
     (prop_fqdn id_buHost str__bz)
     (prop_fqdn id_cbHost str__cg)
     (prop_fqdn id_sHost str__x)
     (prop_fqdn id_zHost str__be)
     (prop_host id_baTimeDelta id_zHost)
     (prop_host id_bhTimeDelta id_bgHost)
     (prop_host id_boTimeDelta id_bnHost)
     (prop_host id_bvTimeDelta id_buHost)
     (prop_host id_ccTimeDelta id_cbHost)
     (prop_host id_ciRat id_bgHost)
     (prop_host id_tTimeDelta id_sHost)
     (prop_hostname id_bgHost str__bm)
     (prop_hostname id_bnHost str__bt)
     (prop_hostname id_buHost str__ca)
     (prop_hostname id_cbHost str__ch)
     (prop_hostname id_sHost str__y)
     (prop_hostname id_zHost str__bf)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_microseconds id_baTimeDelta num__28)
     (prop_microseconds id_bhTimeDelta num__35)
     (prop_microseconds id_boTimeDelta num__42)
     (prop_microseconds id_bvTimeDelta num__49)
     (prop_microseconds id_ccTimeDelta num__56)
     (prop_microseconds id_tTimeDelta num__21)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_seconds id_baTimeDelta num__27)
     (prop_seconds id_bhTimeDelta num__34)
     (prop_seconds id_boTimeDelta num__41)
     (prop_seconds id_bvTimeDelta num__48)
     (prop_seconds id_ccTimeDelta num__55)
     (prop_seconds id_tTimeDelta num__20)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_timedelta id_bgHost id_bhTimeDelta)
     (prop_timedelta id_bnHost id_boTimeDelta)
     (prop_timedelta id_buHost id_bvTimeDelta)
     (prop_timedelta id_cbHost id_ccTimeDelta)
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
     (prop_host id_dfRat id_zHost)
     (prop_host id_dcRat id_sHost)
     (prop_host id_dgRat id_bnHost)
     (prop_host id_dhRat id_buHost)
     (prop_host id_ddRat id_cbHost)
)
)
)