;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 2 hosts, 4 user, 2 admin per host, 1 active account per host
(define (problem p2_hosts_trial_11)
(:domain caldera)
(:objects id_biSchtask id_bjSchtask - ObservedSchtask 
 num__28 num__21 num__27 num__20 - num 
 id_hDomainCredential id_dDomainCredential id_pDomainCredential id_lDomainCredential - ObservedDomainCredential 
 str__m str__bh str__q str__e str__alpha str__mary str__x str__james str__be str__b str__w str__bf str__patricia str__bd str__j str__r str__y str__i str__n str__john str__f - string 
 id_aDomain - ObservedDomain 
 id_bgRat id_bkRat id_blRat - ObservedRat 
 id_bnShare id_bmShare - ObservedShare 
 id_sHost id_zHost - ObservedHost 
 id_kDomainUser id_gDomainUser id_oDomainUser id_cDomainUser - ObservedDomainUser 
 id_bpFile id_boFile - ObservedFile 
 id_baTimeDelta id_tTimeDelta - ObservedTimeDelta 
)
(:init     (knows id_bgRat)
     (knows id_sHost)
     (knows_property id_bgRat pexecutable)
     (knows_property id_bgRat phost)
     (knows_property id_sHost pfqdn)
     (mem_cached_domain_creds id_sHost id_pDomainCredential)
     (mem_cached_domain_creds id_zHost id_lDomainCredential)
     (mem_domain_user_admins id_sHost id_cDomainUser)
     (mem_domain_user_admins id_sHost id_oDomainUser)
     (mem_domain_user_admins id_zHost id_kDomainUser)
     (mem_domain_user_admins id_zHost id_oDomainUser)
     (mem_hosts id_aDomain id_sHost)
     (mem_hosts id_aDomain id_zHost)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_dc id_sHost no)
     (prop_dc id_zHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_sHost str__w)
     (prop_dns_domain_name id_zHost str__bd)
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
     (prop_elevated id_bgRat yes)
     (prop_executable id_bgRat str__bh)
     (prop_fqdn id_sHost str__x)
     (prop_fqdn id_zHost str__be)
     (prop_host id_baTimeDelta id_zHost)
     (prop_host id_bgRat id_sHost)
     (prop_host id_tTimeDelta id_sHost)
     (prop_hostname id_sHost str__y)
     (prop_hostname id_zHost str__bf)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_microseconds id_baTimeDelta num__28)
     (prop_microseconds id_tTimeDelta num__21)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_seconds id_baTimeDelta num__27)
     (prop_seconds id_tTimeDelta num__20)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
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
     (prop_host id_bkRat id_zHost)
)
)
)