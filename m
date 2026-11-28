Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833191;
	b=46zUZS3NncKzZ3eRCRd80qWKGkLbwn0BGil7k9J/NnrjkdgT8jx0Z5XgJUtdXerM1b+M
	 ribXibDj90AbBWPOIK/PWZy4+5rvdPre+3NQMqM4oWMEW1eIGKPEpFCvJ1AVCCkRjIMjp
	 SoJfbQ1vRs9wNC5SD/bQ6hU5hH4ToLcj4ar4Rj/mgBKhjctFZl+xPyoxthThd1GH5Xz2+
	 Xdg5M+rY7jsRHMDxVeaL5nE4l1HMkFnvjmaiNQWeGwgBzsUvK+GDMiaNz3in6OGkhaXAH
	 sLPMLm9wJO53CfMkBbS5xt9jtkS3Hlm1Ho7RCT0Jo7hXtmcZf+6j9N8Yaj/26oGi18g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833191;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4qn0uyCItDbl/DfLGGMPD5QWobg00imW5lBzN8AtDn4=;
	b=TmlvF9dCX8cAkrLhX0WKGsqTWZsmXKvOUFhEQ5IsVVIFMI4DCnS0vcHRKu34Yi6ng/kD
	 Z8FusaAVILTdeZ0lu3wLpO1rSFlmDSEf3StQxfDrLrku6LGXUrCPefuPb44OyQdhnBDkz
	 xYfLWZ6ahw6p+pPAeKeNlpQmARTpmV7iVWHq6gzF8+DIbe1/3o9k4b8IenagZSN8KFje1
	 wmeNdnprYbPiH1x3c5XHLZAvXOsW+Za3UUDFtFfXNxEGFkzXFITRTbegshRQLbVqBGSKl
	 Sp9aTzZ0x+/8DEY6v5fxV6GU/3xi4Yl9vZ0q4a8e92y85ntAok2DgOAENS6dPhWIQ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGrCyPAX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE43D606A32D;
	Sat, 28 Nov 2026 02:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGrCyPAX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4BB1F00897;
	Sat, 28 Nov 2026 02:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795833191;
	bh=4qn0uyCItDbl/DfLGGMPD5QWobg00imW5lBzN8AtDn4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LGrCyPAX0bY+vp+mzgO97bJwexv7z/Hq5pJcsBgyNtmk6Vk/153Bay1O/+1bfNb8Y
	 tmUf33q9kJm7VKz50UiowplGk8Pos2699SbMHCDskjpnziVMvJ2mYjJ/WclSMLyZ9h
	 gFFBnFi6c6qh703nWBICWr+DCE8PKKnooYyoI7Fb80GCKyL8IV6T2sh2+DlRbCPV8W
	 LyuWsirNVJc/BCyDO28q+8AZ/vOegjGGUv0u8U2HPI1avy7PHdnFrmKZY5faqsrNGg
	 dt3IBYtyPFpTc+jabQk1bLLs4yjLs+FdXXRhBN3+rHRytU0/28HGIu2K9se7Iodo2J
	 dUBgf00wLwmew==
Subject: Re: [PATCH ipsec-next v3 2/2] xfrm: add ARIA GCM support
From: netdev-bot+sashiko@kernel.org
To: his1415@pribit.com
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sd@queasysnail.net, netdev@vger.kernel.org,
 ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 02:33:10 +0000
Message-ID: <179583319029.3135.1719122173893517950@kernel.org>
In-Reply-To: <20261127020448.55891-3-his1415@pribit.com>
References: <20261127020448.55891-3-his1415@pribit.com>
X-sashiko-severity: Critical
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 1 · High: 0 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] This patch adds rfc4106(gcm(aria)) AEAD descriptors to
  aead_list in net/xfrm/xfrm_algo.c (lines 85-120).

--

xfrm: add ARIA GCM support

This commit adds XFRM AEAD algorithm descriptors for rfc4106(gcm(aria))
with 64-bit, 96-bit and 128-bit ICV lengths. The kernel crypto API
already supports the algorithm.

> diff --git a/net/xfrm/xfrm_algo.c b/net/xfrm/xfrm_algo.c
> index 98ef2c48982a2..d74f86d4e6722 100644
> --- a/net/xfrm/xfrm_algo.c
> +++ b/net/xfrm/xfrm_algo.c
> @@ -82,6 +82,42 @@ static struct xfrm_algo_desc aead_list[] = {
>  		.sadb_alg_maxbits = 256
>  	}
>  },
> +{
> +	.name = "rfc4106(gcm(aria))",
> +
> +	.uinfo = {
> +		.aead = {
> +			.geniv = "seqiv",
> +			.icv_truncbits = 64,
> +		}
> +	},
> +
> +	.pfkey_supported = 0,
> +},

[Severity: Critical]
Can an ARIA-GCM SA end up offloaded to Netronome hardware with a NULL
cipher?

These descriptors have no .desc, so desc.sadb_alg_id is 0. attach_aead()
in net/xfrm/xfrm_user.c copies it straight into the state:

	x->props.ealgo = algo->desc.sadb_alg_id;

That leaves x->props.ealgo == SADB_EALG_NONE.

nfp_net_xfrm_add_state() in drivers/net/ethernet/netronome/nfp/crypto/ipsec.c
assumes chacha20-poly1305 is the only AEAD with that id:

	case SADB_EALG_NONE:
		/* The xfrm descriptor for CHACAH20_POLY1305 does not set the algorithm id, which
		 * is the default value SADB_EALG_NONE. In the branch of SADB_EALG_NONE, driver
		 * uses algorithm name to identify CHACAH20_POLY1305's algorithm.
		 */
		if (x->aead && !strcmp(x->aead->alg_name, "rfc7539esp(chacha20,poly1305)")) {
			...
			break;
		}
		fallthrough;
	case SADB_EALG_NULL:
		cfg->ctrl_word.cimode = NFP_IPSEC_CIMODE_CBC;
		cfg->ctrl_word.cipher = NFP_IPSEC_CIPHER_NULL;
		break;

"rfc4106(gcm(aria))" fails the strcmp, so the code falls through and
programs NFP_IPSEC_CIPHER_NULL.

The auth switch earlier in the same function doesn't reject it either.
With aalgo == SADB_AALG_NONE and x->aead set, it only does:

	case SADB_AALG_NONE:
		if (x->aead) {
			trunc_len = -1;

ctrl_word.hash stays at NFP_IPSEC_HASH_NONE. The x->aead block after that
just copies the ARIA key and salt into the config.

net/xfrm/xfrm_device.c doesn't check aead or ealgo before calling the
driver, and NFP registers no xdo_dev_offload_ok callback. So the call
chain attach_aead() -> xfrm_dev_state_add() -> nfp_net_xfrm_add_state()
returns success.

Userspace (for example strongSwan with hw_offload=auto) then reports an
ARIA-GCM SA, while the NIC applies no encryption and no ICV. Offloaded
outbound ESP payloads would go out in plaintext, and inbound SAs would
get no integrity check.

The companion commit "xfrm: add ARIA CBC and CTR support" appears to have
the same issue. cbc(aria) and rfc3686(ctr(aria)) are added to ealg_list
without a sadb id. Since x->aead is NULL for them, they would always fall
through to NFP_IPSEC_CIPHER_NULL, while any configured HMAC still applies.

Could the NFP driver return -EINVAL for any SADB_EALG_NONE algorithm it
doesn't recognize by name, instead of falling through to the NULL cipher,
before these descriptors are added? Another option is to give the new
algorithms an id that offload drivers can't mistake for NONE or NULL.

> +{
> +	.name = "rfc4106(gcm(aria))",

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127020448.55891-1-his1415%40pribit.com
