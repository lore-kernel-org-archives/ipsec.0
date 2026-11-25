Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585121;
	b=WX8p5aeO3xmjxRN7ZY9aVOOTtvHWfeMKcxtmj7EjOt3ihfHRE3s3WdwiGJ3pdW41GOp+
	 UIgv1tAvcNjUzcgBhj8n080e9Xgcw0yFW9qxMOefzfSqsC8mG3tWRNIlmlkCsvoSh2A5V
	 TgLAic4Oin4Fje2MMbV0LnaABDeK0Q60svPeePO4EA2J/zbc00xjBlZe7ISJL54/TmZ49
	 EMDcBbr1apC2MBUnJ9XkKKW3MTVKQfoM66EbCde6GiZ5nwV8kVbUxK3yjEpmqYCKcOMWn
	 h4qkEKpwrpfTutdcz6ltV/vFd7niBX8wmmSU05bndgnbAaFkpF219vkFKSkx6tSq0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fcNis2XnhX8zZlzTY3CceXUccN8sacTSpQICWbCSpaU=;
	b=Mv5hHeSHoqww/BSlm351MhUnYsLC9sqhcW3cOXMSYeHUBNasr++Ewd8racVRWN4KErgR
	 4zz4s3jKJ9kXN/0opJkf7whZRlp8id479/JQqiIgCPwHml+u/TtScGVDUbwkcgjczpuzM
	 WrYfmb5FkGNdA2nUIbA76RHj3rMVMIrhBFZmbT7lw+g0BQQraTZN3KtiFIZ2r+0ABkcqp
	 8X5M/S5cj7/PJagc5+AyoFFBIiPI6a/PBLeC0L1zGpGfg4FNHK5LefmHSgvGRl6frUaMt
	 kYUy+DrvIEpWVo+rSUeL8h2mdKzP9a23dq6D1riOojkEJ+/uJNcxJ4L+xBO38MJpfbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=Yi2F2czJ;
	arc=none smtp.remote-ip=209.85.217.99
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C377D606A323
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 05:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C377D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=Yi2F2czJ
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-77bf892b496so1927390137.0
        for <ipsec@lists.linux.dev>; Tue, 24 Nov 2026 21:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795585119; x=1796189919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcNis2XnhX8zZlzTY3CceXUccN8sacTSpQICWbCSpaU=;
        b=Yi2F2czJJgFjGOJGGMZql+lp0Hu66OsE7dqLHEM52dOJySmPkPNCAG2zodohvrCqlU
         8qoRWUHUjDSp5JQeJIw6g6Y5FBGIjkCEQZXOgu7cXmYq+MYcuH3vF4mVpzWMjazRs+9G
         laGPId6aywtoqT41c5ZomDhxa8/8qCEVTU2v5dfCrvqlHjItBwxqGZ8lEdwSZxnwCPXN
         ZQczTdDhXNVCVRKeU9lrtlgKdBgU6MB2ixd4OcoIhDH0zhq+8GbI+BfyHW8K4LXym5IP
         LlTA8NhUVT3X5GYZ3jBAggze9tvjj3LggGeB85cwsrY/ls+TsHaypOT3MwQ5INmF5FBH
         FTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585119; x=1796189919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcNis2XnhX8zZlzTY3CceXUccN8sacTSpQICWbCSpaU=;
        b=2kFJzshcpD/Ne1bB/zQg6Nj5UpXXON6glmtxmurgX4RFxV5opLYthBg/dMHlZcvNv1
         tOAtYcNfkdeLjrKt1/03d0Y7qNiqlI0A8zDhcYExeDwHjJx5zHbmM6fc9Y5+jcmQaDhe
         lNhKU1AxcXMVUo4+TP+smIwBxDyrmDJ6H1vvYFHKjwlfHAaSQppUK7FiKMEdBLj8ekFj
         VJfWgCoLRA1WRC5awpsN4NqH/rKK088MVqa2EN98imxHkddgAe5OuVjJN5tjq4e4Eqon
         Tnxt+ExEm9TfUXiJlk4TQAUyGvObIIOJjuw/+Dx73ypOkTZBPUeESUSnPjtEYM/bk45+
         l65Q==
X-Forwarded-Encrypted: i=1; AL+hErH5tPsoa8sV5BoYfiNe/R5E/3itz2n94eqoG0RAOIyuxlKUB5SCG9xstdh5cY5vtb8h24wd+Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/CoAzbMmwf0qugkyVod/J17PkXAV4Oq01lPk3XzWejMGQy73FE
	rO5comWfeyUB/+zJ9ex1+m7X7qu7PLjeHZakw0lNSiyJcvGHiZ204hdlQ3OP7TWTDMw5gDXzhlO
	npCIzT8ININGCpomtcWYvb9+tJSZXKyX7sktjnmeRF7WA8bB49d9z
X-Gm-Gg: AZFdTZdKIRPtO4aoJ7iKdmnXwgXt7s9G7RoF9EOGKM5HUgtfB3sk2Qcm8L7h+9to9XQ
	IHEL5rnyz3YepREroIgqhR4iAaj85aO7s8C69+NsuiB/g0rW5Or0S1W8GHv3fsKwx56L8LbZwe+
	aYOHv8h0b1RYw4TQTbWz/kPuynjn1UcgIyyx2EsGNGJjz99q2Oiv1I9NM8lRqP6xXmvZK7juJ6p
	VXvO1ToAIEtBuEzMmDJ1zRq2cxI/MAoJIGyG2WVaJkTc+S0ZyHZ1DMQbWy34YFctlPDu2Gwz/QK
	rAfy8bX1t3I9X+1SW810+lT1Ftyy+FOEhVBaxNLSAYkReMvltO83rbpcj27tDlv+KWHmMGddNXZ
	f6XObMlHFf9E+IheQulyik0h4WII=
X-Received: by 2002:a05:6102:4485:b0:7a6:cd7e:72db with SMTP id ada2fe7eead31-7d73962b3c7mr8485110137.26.1795585119506;
        Tue, 24 Nov 2026 21:38:39 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e0fe353sm1684066241.6.2026.11.24.21.38.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 21:38:39 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: [PATCH ipsec] xfrm: policy: avoid an undefined shift when testing the auth algorithm
Date: Tue, 24 Nov 2026 21:38:35 -0800
Message-ID: <928a3d63-eb17-4192-8952-a9a74a89c5f9@mid.andrii.net>
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

xfrm_state_ok() tests the template's 32-bit aalgos mask with
1 << x->props.aalgo, but digest_null's ID, SADB_X_AALG_NULL, is 251.
A digest_null SA checked against a template that does not allow all
algorithms then triggers a UBSAN shift-out-of-bounds report, which
gets in the way of running with CONFIG_UBSAN_SHIFT.

Fix this by treating an ID that does not fit in the mask as not set,
as aalg_tmpl_set() in af_key.c does.

Made with an AI coding assistant, reviewed by the submitter.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
Found with syzkaller (our own run, not syzbot).
Validated: reproduced on ipsec master with CONFIG_UBSAN_SHIFT, without
kernel changes or fault injection:

  UBSAN: shift-out-of-bounds in net/xfrm/xfrm_policy.c:3399:39
  shift exponent 251 is too large for 32-bit type 'int'

Tested: with the patch the reproducer runs without a report and the
packet is still refused (XfrmInTmplMismatch); with a template that
allows all algorithms it is still delivered.

No functional change is intended beyond the UBSAN report, and this is
not a security fix.

History, from the pre-git tree [1]:
- 6c55c29fabc2 ("[IPSEC]: Add transform engine and AH
  implementation.", 2002) wrote the test, against a single algos mask;
  4a618fbe0113 ("[NET]: IPSEC updates.", 2002) split it into aalgos.
- 3bab27b68626 ("[IPSEC]: Clean up key manager algorithm handling.",
  2003) added digest_null and SADB_X_AALG_NULL = 251, a KAME value
  (Jun-ichiro itojun Hagino, tech-net, 2000-07-16 [2]).
- af_key.c guarded its copy of the test in f398035f2dec ("[IPSEC]:
  Avoid undefined shift operation when testing algorithm ID", 2007).

Until now the result for ID 251 depended on the CPU: x86 and arm64
mask the shift count and test bit 27; 32-bit ARM, PowerPC and s390
give 0, which this patch makes the rule everywhere. ealgos is not
tested here, so SERPENT (252) and TWOFISH (253) don't hit this.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
[2] https://mail-index.netbsd.org/tech-net/2000/07/16/0000.html

 net/xfrm/xfrm_policy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index d2e938d4db9aa..b980d915a24a6 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3396,7 +3396,9 @@ xfrm_state_ok(const struct xfrm_tmpl *tmpl, const struct xfrm_state *x,
 		(x->id.spi == tmpl->id.spi || !tmpl->id.spi) &&
 		(x->props.reqid == tmpl->reqid || !tmpl->reqid) &&
 		x->props.mode == tmpl->mode &&
-		(tmpl->allalgs || (tmpl->aalgos & (1<<x->props.aalgo)) ||
+		(tmpl->allalgs ||
+		 (x->props.aalgo < BITS_PER_TYPE(tmpl->aalgos) &&
+		  (tmpl->aalgos & (1U << x->props.aalgo))) ||
 		 !(xfrm_id_proto_match(tmpl->id.proto, IPSEC_PROTO_ANY))) &&
 		!(x->props.mode != XFRM_MODE_TRANSPORT &&
 		  xfrm_state_addr_cmp(tmpl, x, family)) &&

base-commit: b88c75488ecc768acadb14e980bbfa087b1dbf38
-- 
2.53.0

