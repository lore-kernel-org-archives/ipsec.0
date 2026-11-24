Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490992;
	b=QyABjShVeTYxXUHC3BkpBPG8cfu2/9+468PPNULsMPpuPmdmtZqOE1uHyw7mUbNeq+s3
	 /Ffpq4GvpfuDmdXXx/qxqV6FoT7B6aZbmi87/xAEh8OcGe0QdduF2mFE+XkZamS+kRrEi
	 x0c8mrn+6v6zdSFU/KMK15PW+e1iiSAh0OkHMvMqqg8r4986FUHb4ZQZrT5UCoccHMPF9
	 L0NZeMsCkx6FKaI+jjrAUffLlfPiIDekSaBB0/JSpG7jRd9yeK/H2oByKQ0SjOkkUFy8W
	 JZAnABWGHT4wPLDPUtWIXw2jyOFwDzABOZpX9tBQ/vofF78arpQNzfujKlpejrwXjYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
	b=hPCPFZ1wx2VLrfCSSR91JQN+Vrd2Mw0i8F9uZZuTtUzH+9dIFAOYh/yekf0nc7wdgzsr
	 UPdntVeedlK9Om9XC50+o14j7m9o2tqfOdumMNbmAoNSxXVjq4MxubadML/fVuM+SvUpX
	 rvPVabys1Y48zGF+UttbOS1ogPjxza9LM34Yi1FDSlRyn62Rugp24neBs9bqvxwhu9US1
	 WjnpjcYEI7d940n1CbhdPwJcVW+oLlKzOo4jZ/tysflTWR4+aNoPgI0ZEKgrFRVJWAOiG
	 wpPIWYUV22BhhoTwqRPdXhF1GYP/iR2iNGOgoW2DvaZadKhPqbMlSORMoUuN8WGrvjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=SZc47GTb;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2246606A326
	for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 03:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2246606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=SZc47GTb
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cde827b7b95so853836a12.0
        for <ipsec@lists.linux.dev>; Mon, 23 Nov 2026 19:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795490991; x=1796095791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
        b=SZc47GTbf7fwMUmt3c5bVCIcsz4UrBnPnU8DbuLCGPoHzDl3yve2YWSqHaepMqF1pv
         6ecNlEOUaG02jy2VTjD6KkNSvFvP6leLXMm8YmSzjmD0ObnUwN87aGtQYk6nSY/PIc0c
         QLVCEA34Uwu2wGdy4pIlL+//v6/1xXAf+n5xOd8dcBvvGCRD1EtMNzchWLaEMheEmtd7
         wSpVNg2Otq84THS2T8QG/VMz252GQKDtmvKPdUjkXDjiMxCaBD9P0zWES4bhJFOOggPx
         PsproHi32xCtVmBEBHGftyPni2y5hkyOfJsXleyOXOEwMk5q50NCb4xVmYaIXxCsiSPp
         B66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490991; x=1796095791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
        b=R1aZkh/AaxO7oFPf6d3EYSOigOuPConkvgq5Y6NbrpKzH9rVpbpkcXVjUV+4VvDHpd
         R94c7VvxhIVjva+Mz+/ERzNhpAgxPVFtrRdJI4UKSzuDjfvCpGFe30l+tDeWI6ZGtxiR
         Z/CYoFR4bJfLkZrv0rvhj3NeKClIfzaA8PfrzjtXd2NupGeiAKVhsxvkbYEHI1qraG24
         aQAxMURamehq3Hi+NR71K4OqKqRYuOZGmFuPO1h1soUdEd/Mc/tGfJImUc1w6TsexNDv
         XGShgOIGKiLYfrwUKvKetOBVNoagiQNQq6dUJF4CQ8SS+/aaci1gtm/UOvAMUkp/5+mW
         61kw==
X-Forwarded-Encrypted: i=1; AL+hErFJg5zVFICp10b5KAcYLKUl0LvRwky3s9Jhecd8S6F47fZ1WPoAPr9kLSocz6JUZGOk34sqfw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9dopFAxP53AFZEGWOSl4a/sjSBfio7GjONcaFW1RxdsLutIUE/
	Axwee/8eAMHAqRzlX/zDEr5nm7S+OPYRO0Le0YkSRr9E6VsfcQ/gKqCST791lbYTD0cgXbLDfb6
	IUnFwnLV8dhgf6S3Ap/l0ZrUzx6F37c2mGXMVgAVlHVCLIrZCDICQ
X-Gm-Gg: AZFdTZdlPKIUN3VUKtiFSFOW3Yq00121UYuDn4FUBskVXJcYhkwZsi4kH3wcC/Ulmv1
	dRrYqWAkCVNZ8q8eaiGzCjHCRXywBxF//x6koAEo3kb6CzIaf7jlrh8cNtTl1WzsX58spk3WftM
	cliRS8mUFwyahAlC4wKLOX3dM28vamU+yknKpR807Ooez2u4b99G7lFL3L0mjQDZb65+6K2kNHz
	2f3D2JzKqbQf1tYdByrc3sWZpkPL2/36kxcTnCsefAkcD2nxqTaPl9DUHGBz9/fO+gT50I67ZVP
	bE/7n0t+KNO4vNxEA/1NNHivoa5MWFW9u5F9955W+GB1owU2u1hsqXVmEdI8k+P9KunjDfg0kQU
	7VEYGGReiLJw8Bl6mIA6bWQRNUMM=
X-Received: by 2002:a17:90b:17d1:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3b41c8e1735mr11583721a91.13.1795490991106;
        Mon, 23 Nov 2026 19:29:51 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfc74bcsm4445939a91.0.2026.11.23.19.29.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 19:29:51 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm/compat: pass on the translated length of a socket policy
Date: Mon, 23 Nov 2026 19:29:46 -0800
Message-ID: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xfrm_user_policy() compiles a 32-bit task's translated socket policy
with the untranslated length, 4 bytes short, so the policy loses its
last template: an ESP-required socket policy then sends in clear
text. Have the translator return the translated length.

Made with an AI coding assistant, reviewed by the submitter.

Fixes: 96392ee5a13b ("xfrm/compat: Translate 32-bit user_policy from sockptr")
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
The 64-bit struct xfrm_userpolicy_info has 4 bytes of tail padding
that the 32-bit one lacks (168 and 164 bytes on x86-64), and
xfrm_compile_policy() counts the templates as (len - sizeof(*p)) /
sizeof(*ut). With the 32-bit length one template counts as none, so a
32-bit program's ESP-required socket policy requires nothing: its
datagrams leave in clear text, with no SA and no acquire. For the same
reason a policy without templates, which IKE daemons set on their own
sockets, is refused.

The BUILD_BUG_ON()s check what the translator's memcpy()s rely on:
4 = sizeof(struct xfrm_userpolicy_info) -
sizeof(struct compat_xfrm_userpolicy_info), the fields before the
padding at the same offsets in both layouts, and templates that need
no 8-byte alignment.

Found with an AI coding assistant. It reproduces on an unmodified
kernel (ipsec master), without kernel changes or fault injection, and
no longer with this change. Tested with the reproducer, a selftest,
two boots each way, and with the xfrm_policy and xfrm_state
selftests. The reproducer is available on request; the selftest
follows once stable has the fix.

 include/net/xfrm.h     |  2 +-
 net/xfrm/xfrm_compat.c | 18 ++++++++++++++----
 net/xfrm/xfrm_state.c  |  2 +-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 445223a8dc6f1..455b9f986ea5b 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -2331,7 +2331,7 @@ struct xfrm_translator {
 			struct netlink_ext_ack *extack);
 
 	/* Translate 32-bit user_policy from sockptr */
-	int (*xlate_user_policy_sockptr)(u8 **pdata32, int optlen);
+	int (*xlate_user_policy_sockptr)(u8 **pdata32, int *optlen);
 
 	struct module *owner;
 };
diff --git a/net/xfrm/xfrm_compat.c b/net/xfrm/xfrm_compat.c
index 670e3512fc090..af5cb36d691ea 100644
--- a/net/xfrm/xfrm_compat.c
+++ b/net/xfrm/xfrm_compat.c
@@ -642,16 +642,25 @@ static struct nlmsghdr *xfrm_user_rcv_msg_compat(const struct nlmsghdr *h32,
 	return h64;
 }
 
-static int xfrm_user_policy_compat(u8 **pdata32, int optlen)
+static int xfrm_user_policy_compat(u8 **pdata32, int *optlen)
 {
 	struct compat_xfrm_userpolicy_info *p = (void *)*pdata32;
 	u8 *src_templates, *dst_templates;
 	u8 *data64;
 
-	if (optlen < sizeof(*p))
+	/* The 64-bit layout only adds tail padding, and the templates
+	 * after it are the same in both layouts.
+	 */
+	BUILD_BUG_ON(sizeof(struct xfrm_userpolicy_info) -
+		     sizeof(struct compat_xfrm_userpolicy_info) != 4);
+	BUILD_BUG_ON(offsetof(struct xfrm_userpolicy_info, share) !=
+		     offsetof(struct compat_xfrm_userpolicy_info, share));
+	BUILD_BUG_ON(__alignof__(struct xfrm_user_tmpl) > 4);
+
+	if (*optlen < sizeof(*p))
 		return -EINVAL;
 
-	data64 = kmalloc_track_caller(optlen + 4, GFP_USER | __GFP_NOWARN);
+	data64 = kmalloc_track_caller(*optlen + 4, GFP_USER | __GFP_NOWARN);
 	if (!data64)
 		return -ENOMEM;
 
@@ -660,10 +669,11 @@ static int xfrm_user_policy_compat(u8 **pdata32, int optlen)
 
 	src_templates = *pdata32 + sizeof(*p);
 	dst_templates = data64 + sizeof(*p) + 4;
-	memcpy(dst_templates, src_templates, optlen - sizeof(*p));
+	memcpy(dst_templates, src_templates, *optlen - sizeof(*p));
 
 	kfree(*pdata32);
 	*pdata32 = data64;
+	*optlen += 4;
 	return 0;
 }
 
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index f4a4ddaeb9b37..eb984ed118884 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -3115,7 +3115,7 @@ int xfrm_user_policy(struct sock *sk, int optname, sockptr_t optval, int optlen)
 			return -EOPNOTSUPP;
 		}
 
-		err = xtr->xlate_user_policy_sockptr(&data, optlen);
+		err = xtr->xlate_user_policy_sockptr(&data, &optlen);
 		xfrm_put_translator(xtr);
 		if (err) {
 			kfree(data);

base-commit: b88c75488ecc768acadb14e980bbfa087b1dbf38
-- 
2.53.0

