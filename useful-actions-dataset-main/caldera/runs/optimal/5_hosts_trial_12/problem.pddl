;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 5 hosts, 10 user, 1 admin per host, 3 active account per host
(define (problem gen)
(:domain caldera)
(:objects id_djSchtask id_dgSchtask id_dhSchtask id_dkSchtask id_diSchtask - ObservedSchtask 
 id_aDomain - ObservedDomain 
 id_duFile id_dtFile id_drFile id_dsFile id_dqFile - ObservedFile 
 id_baDomainUser id_bmDomainUser id_gDomainUser id_sDomainUser id_wDomainUser id_kDomainUser id_beDomainUser id_oDomainUser id_biDomainUser id_cDomainUser - ObservedDomainUser 
 num__44 num__72 num__59 num__66 num__58 num__52 num__73 num__51 num__65 num__45 - num 
 id_doRat id_dnRat id_dmRat id_czRat id_dlRat id_dpRat - ObservedRat 
 id_deShare id_dbShare id_dfShare id_ddShare id_dcShare - ObservedShare 
 id_dDomainCredential id_bnDomainCredential id_pDomainCredential id_lDomainCredential id_hDomainCredential id_bfDomainCredential id_xDomainCredential id_bjDomainCredential id_bbDomainCredential id_tDomainCredential - ObservedDomainCredential 
 str__robert str__e str__cc str__john str__u str__bu str__bw str__cy str__bp str__william str__cw str__patricia str__n str__mary str__james str__linda str__elizabeth str__b str__bh str__j str__q str__cr str__f str__cb str__y str__bo str__bc str__z str__cq str__r str__m str__bd str__cj str__bg str__bl str__v str__da str__i str__bk str__ci str__cx str__barbara str__cp str__cd str__alpha str__bv str__ck str__michael - string 
 id_byTimeDelta id_brTimeDelta id_cmTimeDelta id_ctTimeDelta id_cfTimeDelta - ObservedTimeDelta 
 id_ceHost id_bxHost id_clHost id_bqHost id_csHost - ObservedHost 
)
(:init     (knows id_bqHost)
     (knows id_czRat)
     (knows_property id_bqHost pfqdn)
     (knows_property id_czRat pexecutable)
     (knows_property id_czRat phost)
     (mem_cached_domain_creds id_bqHost id_bjDomainCredential)
     (mem_cached_domain_creds id_bqHost id_dDomainCredential)
     (mem_cached_domain_creds id_bqHost id_pDomainCredential)
     (mem_cached_domain_creds id_bxHost id_dDomainCredential)
     (mem_cached_domain_creds id_bxHost id_hDomainCredential)
     (mem_cached_domain_creds id_bxHost id_pDomainCredential)
     (mem_cached_domain_creds id_ceHost id_dDomainCredential)
     (mem_cached_domain_creds id_ceHost id_lDomainCredential)
     (mem_cached_domain_creds id_ceHost id_xDomainCredential)
     (mem_cached_domain_creds id_clHost id_bfDomainCredential)
     (mem_cached_domain_creds id_clHost id_hDomainCredential)
     (mem_cached_domain_creds id_clHost id_pDomainCredential)
     (mem_cached_domain_creds id_csHost id_bbDomainCredential)
     (mem_cached_domain_creds id_csHost id_bjDomainCredential)
     (mem_cached_domain_creds id_csHost id_bnDomainCredential)
     (mem_domain_user_admins id_bqHost id_kDomainUser)
     (mem_domain_user_admins id_bxHost id_beDomainUser)
     (mem_domain_user_admins id_ceHost id_biDomainUser)
     (mem_domain_user_admins id_clHost id_cDomainUser)
     (mem_domain_user_admins id_csHost id_gDomainUser)
     (mem_hosts id_aDomain id_bqHost)
     (mem_hosts id_aDomain id_bxHost)
     (mem_hosts id_aDomain id_ceHost)
     (mem_hosts id_aDomain id_clHost)
     (mem_hosts id_aDomain id_csHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_beDomainUser id_bfDomainCredential)
     (prop_cred id_biDomainUser id_bjDomainCredential)
     (prop_cred id_bmDomainUser id_bnDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_bqHost no)
     (prop_dc id_bxHost no)
     (prop_dc id_ceHost yes)
     (prop_dc id_clHost yes)
     (prop_dc id_csHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_bqHost str__bv)
     (prop_dns_domain_name id_bxHost str__cc)
     (prop_dns_domain_name id_ceHost str__cj)
     (prop_dns_domain_name id_clHost str__cq)
     (prop_dns_domain_name id_csHost str__cx)
     (prop_domain id_baDomainUser id_aDomain)
     (prop_domain id_bbDomainCredential id_aDomain)
     (prop_domain id_beDomainUser id_aDomain)
     (prop_domain id_bfDomainCredential id_aDomain)
     (prop_domain id_biDomainUser id_aDomain)
     (prop_domain id_bjDomainCredential id_aDomain)
     (prop_domain id_bmDomainUser id_aDomain)
     (prop_domain id_bnDomainCredential id_aDomain)
     (prop_domain id_bqHost id_aDomain)
     (prop_domain id_bxHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_ceHost id_aDomain)
     (prop_domain id_clHost id_aDomain)
     (prop_domain id_csHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sDomainUser id_aDomain)
     (prop_domain id_tDomainCredential id_aDomain)
     (prop_domain id_wDomainUser id_aDomain)
     (prop_domain id_xDomainCredential id_aDomain)
     (prop_elevated id_czRat yes)
     (prop_executable id_czRat str__da)
     (prop_fqdn id_bqHost str__bu)
     (prop_fqdn id_bxHost str__cb)
     (prop_fqdn id_ceHost str__ci)
     (prop_fqdn id_clHost str__cp)
     (prop_fqdn id_csHost str__cw)
     (prop_host id_brTimeDelta id_bqHost)
     (prop_host id_byTimeDelta id_bxHost)
     (prop_host id_cfTimeDelta id_ceHost)
     (prop_host id_cmTimeDelta id_clHost)
     (prop_host id_ctTimeDelta id_csHost)
     (prop_host id_czRat id_bqHost)
     (prop_hostname id_bqHost str__bw)
     (prop_hostname id_bxHost str__cd)
     (prop_hostname id_ceHost str__ck)
     (prop_hostname id_clHost str__cr)
     (prop_hostname id_csHost str__cy)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_beDomainUser no)
     (prop_is_group id_biDomainUser no)
     (prop_is_group id_bmDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_brTimeDelta num__44)
     (prop_microseconds id_byTimeDelta num__51)
     (prop_microseconds id_cfTimeDelta num__58)
     (prop_microseconds id_cmTimeDelta num__65)
     (prop_microseconds id_ctTimeDelta num__72)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_bfDomainCredential str__bg)
     (prop_password id_bjDomainCredential str__bk)
     (prop_password id_bnDomainCredential str__bo)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_brTimeDelta num__45)
     (prop_seconds id_byTimeDelta num__52)
     (prop_seconds id_cfTimeDelta num__59)
     (prop_seconds id_cmTimeDelta num__66)
     (prop_seconds id_ctTimeDelta num__73)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_beDomainUser str__bh)
     (prop_sid id_biDomainUser str__bl)
     (prop_sid id_bmDomainUser str__bp)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_bqHost id_brTimeDelta)
     (prop_timedelta id_bxHost id_byTimeDelta)
     (prop_timedelta id_ceHost id_cfTimeDelta)
     (prop_timedelta id_clHost id_cmTimeDelta)
     (prop_timedelta id_csHost id_ctTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_bfDomainCredential id_beDomainUser)
     (prop_user id_bjDomainCredential id_biDomainUser)
     (prop_user id_bnDomainCredential id_bmDomainUser)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_user id_hDomainCredential id_gDomainUser)
     (prop_user id_lDomainCredential id_kDomainUser)
     (prop_user id_pDomainCredential id_oDomainUser)
     (prop_user id_tDomainCredential id_sDomainUser)
     (prop_user id_xDomainCredential id_wDomainUser)
     (prop_username id_baDomainUser str__michael)
     (prop_username id_beDomainUser str__barbara)
     (prop_username id_biDomainUser str__william)
     (prop_username id_bmDomainUser str__elizabeth)
     (prop_username id_cDomainUser str__james)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_dnRat id_csHost)
     (prop_host id_dlRat id_clHost)
     (prop_host id_dmRat id_ceHost)
     (prop_host id_dpRat id_bxHost)
)
)
)