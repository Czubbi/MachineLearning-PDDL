;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 4 hosts, 4 user, 2 admin per host, 2 active account per host
(define (problem gen)
(:domain caldera)
(:objects id_cfFile id_ceFile id_chFile id_cgFile - ObservedFile 
 id_cDomainUser id_gDomainUser id_kDomainUser id_oDomainUser - ObservedDomainUser 
 id_bzRat id_bxRat id_buRat id_byRat id_bwRat - ObservedRat 
 id_bnHost id_zHost id_bgHost id_sHost - ObservedHost 
 id_aDomain - ObservedDomain 
 id_caSchtask id_cdSchtask id_ccSchtask id_cbSchtask - ObservedSchtask 
 id_dDomainCredential id_lDomainCredential id_hDomainCredential id_pDomainCredential - ObservedDomainCredential 
 str__bl str__n str__patricia str__m str__bm str__alpha str__b str__be str__w str__bs str__bt str__bv str__mary str__e str__i str__q str__bd str__john str__bf str__f str__x str__james str__r str__br str__j str__bk str__y - string 
 num__21 num__41 num__28 num__35 num__42 num__34 num__27 num__20 - num 
 id_baTimeDelta id_boTimeDelta id_tTimeDelta id_bhTimeDelta - ObservedTimeDelta 
 id_ciShare id_clShare id_ckShare id_cjShare - ObservedShare 
)
(:init     (knows id_buRat)
     (knows id_zHost)
     (knows_property id_buRat pexecutable)
     (knows_property id_buRat phost)
     (knows_property id_zHost pfqdn)
     (mem_cached_domain_creds id_bgHost id_lDomainCredential)
     (mem_cached_domain_creds id_bgHost id_pDomainCredential)
     (mem_cached_domain_creds id_bnHost id_dDomainCredential)
     (mem_cached_domain_creds id_bnHost id_hDomainCredential)
     (mem_cached_domain_creds id_sHost id_hDomainCredential)
     (mem_cached_domain_creds id_sHost id_lDomainCredential)
     (mem_cached_domain_creds id_zHost id_lDomainCredential)
     (mem_cached_domain_creds id_zHost id_pDomainCredential)
     (mem_domain_user_admins id_bgHost id_cDomainUser)
     (mem_domain_user_admins id_bgHost id_gDomainUser)
     (mem_domain_user_admins id_bnHost id_cDomainUser)
     (mem_domain_user_admins id_bnHost id_oDomainUser)
     (mem_domain_user_admins id_sHost id_cDomainUser)
     (mem_domain_user_admins id_sHost id_oDomainUser)
     (mem_domain_user_admins id_zHost id_cDomainUser)
     (mem_domain_user_admins id_zHost id_kDomainUser)
     (mem_hosts id_aDomain id_bgHost)
     (mem_hosts id_aDomain id_bnHost)
     (mem_hosts id_aDomain id_sHost)
     (mem_hosts id_aDomain id_zHost)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_dc id_bgHost no)
     (prop_dc id_bnHost no)
     (prop_dc id_sHost no)
     (prop_dc id_zHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_bgHost str__bk)
     (prop_dns_domain_name id_bnHost str__br)
     (prop_dns_domain_name id_sHost str__w)
     (prop_dns_domain_name id_zHost str__bd)
     (prop_domain id_bgHost id_aDomain)
     (prop_domain id_bnHost id_aDomain)
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
     (prop_elevated id_buRat yes)
     (prop_executable id_buRat str__bv)
     (prop_fqdn id_bgHost str__bl)
     (prop_fqdn id_bnHost str__bs)
     (prop_fqdn id_sHost str__x)
     (prop_fqdn id_zHost str__be)
     (prop_host id_baTimeDelta id_zHost)
     (prop_host id_bhTimeDelta id_bgHost)
     (prop_host id_boTimeDelta id_bnHost)
     (prop_host id_buRat id_zHost)
     (prop_host id_tTimeDelta id_sHost)
     (prop_hostname id_bgHost str__bm)
     (prop_hostname id_bnHost str__bt)
     (prop_hostname id_sHost str__y)
     (prop_hostname id_zHost str__bf)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_microseconds id_baTimeDelta num__28)
     (prop_microseconds id_bhTimeDelta num__35)
     (prop_microseconds id_boTimeDelta num__42)
     (prop_microseconds id_tTimeDelta num__21)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_seconds id_baTimeDelta num__27)
     (prop_seconds id_bhTimeDelta num__34)
     (prop_seconds id_boTimeDelta num__41)
     (prop_seconds id_tTimeDelta num__20)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_timedelta id_bgHost id_bhTimeDelta)
     (prop_timedelta id_bnHost id_boTimeDelta)
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
     (prop_host id_byRat id_sHost)
     (prop_host id_bzRat id_bnHost)
     (prop_host id_bxRat id_bgHost)
)
)
)