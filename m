Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833190;
	b=jYSfMbnkihzlVjd2a4UiqehlUaWR/Yk81NeMZ7IF+OoxOOT6kVCJc17FjeJDKN9Egvpl
	 VyWPRrC338ynAMN8nqDibKzoul3e5qVR/L7yNARTdQLWmmY8BMYXzX9RcQggwrOGi5cFb
	 j9uI5D++bni1mg+hb7H8kfexumCd2dq8xojjNtlw8BsMqfx4UTIHHMy0+mypMJy45to2V
	 igu7zmr1wB7h9PBlc6vLhIouj8MvzDHvwGAbBytwqSEf4JyyeUyNz00iIqPhqg9C2RJVn
	 C97ysNxy8GmpUcVBJ7OledCwkezjdk02b1VevhqUN/ZBnTvmHYjRvC+ohz55q8Tatug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833190;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dZtUYIjpYRuYtYubv0Jwi31UC+Fx/anAY3sZfAURRWM=;
	b=Ru9pQmR4p41y0xuds57Hg9mLWfGuuucVeFVdnthDqHxSVupgZeK92SmWDqy+1ndpf4my
	 Akq7B97YlGRoeh5DWUpVXnDLrxaI7TNh1lZNXZ/N2AhR9oQTNvPrzoMtNTKUOfu8AKMJO
	 UqwyhIwL/5jISgGAjoS7esW/1RrhEYJx7K+KH5b/7zS6o3sNqYNji0/JK+8WheHw8/KBe
	 l54y/nSyBpgmNOUwGZ0H6qOwqQjXVg4GYeB1HjG+L4wsnrMkfhrc5PwrI0/Q18BvG5Ec+
	 l92ol9cX+f5Z7+0ik3wr4zIvw5COkhuE2Hy3Xvh47OnsOTD+EndV6sGx6YD/NkzB4wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c995K2yE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BCF606A31C;
	Sat, 28 Nov 2026 02:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c995K2yE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833F21F00893;
	Sat, 28 Nov 2026 02:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795833190;
	bh=dZtUYIjpYRuYtYubv0Jwi31UC+Fx/anAY3sZfAURRWM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c995K2yEiIpJAEwJA7zHogV1tavP+UUaW1/U6rK+7ids96B431mvzdo7J09qsADqw
	 +QHdlSnWL0vi3cHuLxctp7sUdi7t1j6Hiy0WSaKtJLfFfFERJ8AAxnMZiWXtY4snJ0
	 0/I8BK+c6cY5/2+KaPQPeiYUOEGBuJsX1R8++uFpfJOsFwYHTJdPjLX2RCUW6F72Wq
	 XRfELKjEBgcooaGryLyZnlbhU/dhp13TBOnlRoJu1NzHIgXgOsqaJH8F/tUNM/dP3Y
	 lqv9AFbdXjE7cG8niQI/fkiDfsIo3Ft7a58nm0sO8DDI2CSZRZywLPYSihkvxtJZDR
	 CKxhm480tfQdQ==
Subject: Re: [PATCH ipsec-next v3 1/2] xfrm: add ARIA CBC and CTR support
From: netdev-bot+sashiko@kernel.org
To: his1415@pribit.com
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sd@queasysnail.net, netdev@vger.kernel.org,
 ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 02:33:09 +0000
Message-ID: <179583318907.3135.10318607077166814978@kernel.org>
In-Reply-To: <20261127020448.55891-2-his1415@pribit.com>
References: <20261127020448.55891-2-his1415@pribit.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new ealg_list entries for "cbc(aria)" and
  "rfc3686(ctr(aria))" in net/xfrm/xfrm_algo.c have no .desc block, so…
- [Low] This patch makes "rfc3686(ctr(aria))" selectable as an ESP
  encryption algorithm, but crypto/testmgr.c's alg_test_descs[] has no…

--

xfrm: add ARIA CBC and CTR support

This commit adds XFRM ealg_list descriptors for cbc(aria) and
rfc3686(ctr(aria)), so ARIA can be selected as an ESP encryption
algorithm. Neither entry is exposed through PF_KEY.

> diff --git a/net/xfrm/xfrm_algo.c b/net/xfrm/xfrm_algo.c
> index 70434495f23f5..98ef2c48982a2 100644
> --- a/net/xfrm/xfrm_algo.c
> +++ b/net/xfrm/xfrm_algo.c
> @@ -512,6 +512,32 @@ static struct xfrm_algo_desc ealg_list[] = {
>  		.sadb_alg_maxbits = 256
>  	}
>  },
> +{
> +	.name = "cbc(aria)",
> +
> +	.uinfo = {
> +		.encr = {
> +			.geniv = "echainiv",
> +			.blockbits = 128,
> +			.defkeybits = 128,
> +		}
> +	},
> +
> +	.pfkey_supported = 0,
> +},

[Severity: High]

Neither this entry nor the rfc3686(ctr(aria)) entry below has a .desc
block, so desc.sadb_alg_id is 0 (SADB_EALG_NONE). Before this patch,
every ealg_list entry had a non-zero sadb_alg_id. Even ecb(cipher_null)
uses SADB_EALG_NULL.

attach_one_algo() in net/xfrm/xfrm_user.c copies that value into the
state:

    x->props.ealgo = algo->desc.sadb_alg_id;

An ESP SA using either ARIA mode therefore ends up with props.ealgo == 0,
x->ealg set and x->aead == NULL.

Can this cause a NULL cipher to be programmed when the SA is offloaded
to an nfp device? Here is the encryption switch in
nfp_net_xfrm_add_state() in drivers/net/ethernet/netronome/nfp/crypto/ipsec.c:

	switch (x->props.ealgo) {
	case SADB_EALG_NONE:
		...
		if (x->aead && !strcmp(x->aead->alg_name, "rfc7539esp(chacha20,poly1305)")) {
			...
			break;
		}
		fallthrough;
	case SADB_EALG_NULL:
		cfg->ctrl_word.cimode = NFP_IPSEC_CIMODE_CBC;
		cfg->ctrl_word.cipher = NFP_IPSEC_CIPHER_NULL;
		break;

x->aead is NULL here, so control falls through to SADB_EALG_NULL. Next,
the if (x->ealg) block copies the ARIA key into cfg->ciph_key. The SA is
sent to the NIC and the function returns success. xfrm_dev_state_add()
does not check the algorithm itself.

So an SA set up with something like "enc 'cbc(aria)' ... auth
'hmac(sha256)' ... offload dev <nfp> dir out" would be accepted for
crypto offload. The hardware would then apply a NULL cipher and send
the ESP payloads in plaintext. Inbound ARIA-encrypted traffic would be
passed up as if it had already been decrypted.

Until now, only AH or the chacha20-poly1305 AEAD reached the
SADB_EALG_NONE fallthrough in that driver. The follow-up "xfrm: add ARIA
GCM support" adds only aead_list entries, so the issue remains at the
end of the series.

Should nfp_net_xfrm_add_state() reject SADB_EALG_NONE when x->ealg is
set, or should these descriptors be identified some other way, so that
the offload path does not treat them as NULL encryption?

> +{
> +	.name = "rfc3686(ctr(aria))",

[Severity: Low]

Is a testmgr entry missing for this construction? alg_test_descs[] in
crypto/testmgr.c has entries for cbc(aria), ctr(aria), ecb(aria) and
gcm(aria), but none for rfc3686(ctr(aria)). The rfc3686(ctr(aes)) mode
that XFRM already exposes has one, using aes_ctr_rfc3686_tv_template.

When ESP instantiates this transform, alg_test() takes the notest path
and logs:

    alg: No test for rfc3686(ctr(aria)) (...)

As a result, no known-answer test covers the RFC3686 nonce/IV/counter
block layout combined with ARIA. Could test vectors be added for it?

> +
> +	.uinfo = {
> +		.encr = {
> +			.geniv = "seqiv",
> +			.blockbits = 128,
> +			.defkeybits = 160, /* 128-bit key + 32-bit nonce */
> +		}
> +	},
> +
> +	.pfkey_supported = 0,
> +},

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127020448.55891-1-his1415%40pribit.com
