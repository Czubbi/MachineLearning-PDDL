;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 3 hosts, 6 user, 3 admin per host, 2 active account per host
(define (problem p3_hosts_trial_12)
(:domain caldera)
(:objects
    id_bxfile id_byfile id_bzfile - observedfile
    id_bohost id_bhhost id_bahost - observedhost
    id_ccshare id_cashare id_cbshare - observedshare
    num__28 num__42 num__35 num__43 num__29 num__36 - num
    id_ddomaincredential id_hdomaincredential id_ldomaincredential id_xdomaincredential id_pdomaincredential id_tdomaincredential - observeddomaincredential
    id_cirat id_bvrat id_cgrat id_chrat - observedrat
    id_cfschtask id_cdschtask id_ceschtask - observedschtask
    id_kdomainuser id_sdomainuser id_odomainuser id_wdomainuser id_cdomainuser id_gdomainuser - observeddomainuser
    id_adomain - observeddomain
    id_bptimedelta id_bbtimedelta id_bitimedelta - observedtimedelta
    str__be str__patricia str__bm str__b str__mary str__j str__bf str__james str__z str__e str__robert str__bs str__linda str__v str__bu str__n str__i str__r str__m str__q str__bt str__alpha str__u str__bg str__bn str__f str__bl str__john str__bw str__y - string
)
(:init
    (knows id_bhhost)
    (knows id_bvrat)
    (knows_property id_bhhost pfqdn)
    (knows_property id_bvrat pexecutable)
    (knows_property id_bvrat phost)
    (MEM_CACHED_DOMAIN_CREDS id_bahost id_ddomaincredential)
    (MEM_CACHED_DOMAIN_CREDS id_bahost id_tdomaincredential)
    (MEM_CACHED_DOMAIN_CREDS id_bhhost id_pdomaincredential)
    (MEM_CACHED_DOMAIN_CREDS id_bhhost id_tdomaincredential)
    (MEM_CACHED_DOMAIN_CREDS id_bohost id_ddomaincredential)
    (MEM_CACHED_DOMAIN_CREDS id_bohost id_tdomaincredential)
    (MEM_DOMAIN_USER_ADMINS id_bahost id_gdomainuser)
    (MEM_DOMAIN_USER_ADMINS id_bahost id_kdomainuser)
    (MEM_DOMAIN_USER_ADMINS id_bahost id_sdomainuser)
    (MEM_DOMAIN_USER_ADMINS id_bhhost id_gdomainuser)
    (MEM_DOMAIN_USER_ADMINS id_bhhost id_odomainuser)
    (MEM_DOMAIN_USER_ADMINS id_bhhost id_sdomainuser)
    (MEM_DOMAIN_USER_ADMINS id_bohost id_cdomainuser)
    (MEM_DOMAIN_USER_ADMINS id_bohost id_kdomainuser)
    (MEM_DOMAIN_USER_ADMINS id_bohost id_odomainuser)
    (mem_hosts id_adomain id_bahost)
    (mem_hosts id_adomain id_bhhost)
    (mem_hosts id_adomain id_bohost)
    (prop_cred id_cdomainuser id_ddomaincredential)
    (prop_cred id_gdomainuser id_hdomaincredential)
    (prop_cred id_kdomainuser id_ldomaincredential)
    (prop_cred id_odomainuser id_pdomaincredential)
    (prop_cred id_sdomainuser id_tdomaincredential)
    (prop_cred id_wdomainuser id_xdomaincredential)
    (PROP_DC id_bahost no)
    (PROP_DC id_bhhost no)
    (PROP_DC id_bohost no)
    (PROP_DNS_DOMAIN id_adomain str__b)
    (PROP_DNS_DOMAIN_NAME id_bahost str__be)
    (PROP_DNS_DOMAIN_NAME id_bhhost str__bl)
    (PROP_DNS_DOMAIN_NAME id_bohost str__bs)
    (PROP_DOMAIN id_bahost id_adomain)
    (PROP_DOMAIN id_bhhost id_adomain)
    (PROP_DOMAIN id_bohost id_adomain)
    (PROP_DOMAIN id_cdomainuser id_adomain)
    (PROP_DOMAIN id_ddomaincredential id_adomain)
    (PROP_DOMAIN id_gdomainuser id_adomain)
    (PROP_DOMAIN id_hdomaincredential id_adomain)
    (PROP_DOMAIN id_kdomainuser id_adomain)
    (PROP_DOMAIN id_ldomaincredential id_adomain)
    (PROP_DOMAIN id_odomainuser id_adomain)
    (PROP_DOMAIN id_pdomaincredential id_adomain)
    (PROP_DOMAIN id_sdomainuser id_adomain)
    (PROP_DOMAIN id_tdomaincredential id_adomain)
    (PROP_DOMAIN id_wdomainuser id_adomain)
    (PROP_DOMAIN id_xdomaincredential id_adomain)
    (prop_elevated id_bvrat yes)
    (prop_executable id_bvrat str__bw)
    (PROP_FQDN id_bahost str__bg)
    (PROP_FQDN id_bhhost str__bn)
    (PROP_FQDN id_bohost str__bu)
    (prop_host id_bbtimedelta id_bahost)
    (prop_host id_bitimedelta id_bhhost)
    (prop_host id_bptimedelta id_bohost)
    (prop_host id_bvrat id_bhhost)
    (PROP_HOSTNAME id_bahost str__bf)
    (PROP_HOSTNAME id_bhhost str__bm)
    (PROP_HOSTNAME id_bohost str__bt)
    (PROP_IS_GROUP id_cdomainuser no)
    (PROP_IS_GROUP id_gdomainuser no)
    (PROP_IS_GROUP id_kdomainuser no)
    (PROP_IS_GROUP id_odomainuser no)
    (PROP_IS_GROUP id_sdomainuser no)
    (PROP_IS_GROUP id_wdomainuser no)
    (PROP_MICROSECONDS id_bbtimedelta num__28)
    (PROP_MICROSECONDS id_bitimedelta num__35)
    (PROP_MICROSECONDS id_bptimedelta num__42)
    (PROP_PASSWORD id_ddomaincredential str__e)
    (PROP_PASSWORD id_hdomaincredential str__i)
    (PROP_PASSWORD id_ldomaincredential str__m)
    (PROP_PASSWORD id_pdomaincredential str__q)
    (PROP_PASSWORD id_tdomaincredential str__u)
    (PROP_PASSWORD id_xdomaincredential str__y)
    (PROP_SECONDS id_bbtimedelta num__29)
    (PROP_SECONDS id_bitimedelta num__36)
    (PROP_SECONDS id_bptimedelta num__43)
    (PROP_SID id_cdomainuser str__f)
    (PROP_SID id_gdomainuser str__j)
    (PROP_SID id_kdomainuser str__n)
    (PROP_SID id_odomainuser str__r)
    (PROP_SID id_sdomainuser str__v)
    (PROP_SID id_wdomainuser str__z)
    (PROP_TIMEDELTA id_bahost id_bbtimedelta)
    (PROP_TIMEDELTA id_bhhost id_bitimedelta)
    (PROP_TIMEDELTA id_bohost id_bptimedelta)
    (PROP_USER id_ddomaincredential id_cdomainuser)
    (PROP_USER id_hdomaincredential id_gdomainuser)
    (PROP_USER id_ldomaincredential id_kdomainuser)
    (PROP_USER id_pdomaincredential id_odomainuser)
    (PROP_USER id_tdomaincredential id_sdomainuser)
    (PROP_USER id_xdomaincredential id_wdomainuser)
    (PROP_USERNAME id_cdomainuser str__james)
    (PROP_USERNAME id_gdomainuser str__mary)
    (PROP_USERNAME id_kdomainuser str__john)
    (PROP_USERNAME id_odomainuser str__patricia)
    (PROP_USERNAME id_sdomainuser str__robert)
    (PROP_USERNAME id_wdomainuser str__linda)
    (PROP_WINDOWS_DOMAIN id_adomain str__alpha)
)
(:goal
(and
    (prop_host id_chrat id_bahost)
    (prop_host id_cirat id_bohost)
)
)
)