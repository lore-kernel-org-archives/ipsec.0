Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088860;
	b=mJYP+dc6r7Qv3L7TjXhXHWQTPotXSqCNZ1vqnJSs5uWqwU5vBCdKuYCOtFayrX2gAXZ8
	 u2hjtUgXbXMoN0L2f7sMeWdNXfJznbznLQGBzu5/pGzi4NPcBsdBgFBYECL+ZbVphy88V
	 zSoyW5kiXYZUXSd9Z9zuZPBZKZto4Oy+ay8U8I6ulNMMTFLHbcx9TVSc6O/drIrDdbnJi
	 AmMMBLLEjTIYNPstmfNmqynuk1ecpIzrwm+3iRtLgcdiV4LwT44KUKJgyf8HBZ9r1WoPu
	 TB7CqUlq0gmfbOTL/L+WzOV0/xieE3mb0YlJI8U1F42RrQy42EgEAwHuYJ8OeRYxiuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088860;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lb4SotDCk0/uxMRAiHdsRBtrBZNKJ6Y4CU9XfheMsDo=;
	b=1kxBRrOfrIfettE5i3SGpiACeXGdG7dBFjk1HF5FZAOrt4Fobx6TbaXsGQub/s8DKQqd
	 4EqdQvQLPCE1x3SSGWSaZE0nGzNDZaRbbTtYt+jBmVu/babvoJOT5CK4b74vXZRYMzVI0
	 tyQB67SnROPh635QNl8zsRFGvA7gPXTIx+ufay7N70g8/fBg6y4nhU8LGptz2zh7UbKKi
	 vADAqxeGwTo9ieFIaErecLNoJDz5GgSTBiDjGJ0OE2qla/Qr12sdHLnoFqOBEO6lzvDvJ
	 RqdgYSrifYOBp4OX7tfFJJ7oX6BUZp1bCOuTENMnXVl5XTanzzHDOm/jcxcezQOH7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWO00qJS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B58260A2616;
	Thu, 19 Nov 2026 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWO00qJS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7756A1F000C4;
	Thu, 19 Nov 2026 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795088860;
	bh=lb4SotDCk0/uxMRAiHdsRBtrBZNKJ6Y4CU9XfheMsDo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DWO00qJSP+CobWLUNeIWv4UpDPPBe6KtNoyi9Yxvpx9lWDVzlHqxtz2RMCLn2kAtg
	 0TAkKFTkJrHAB1q3vPaETeMwcwu0IQs//Sz7DtfwTZjxT9Tk/Pp6M5uzy9dfa/lCdC
	 WkLqIe0i6xP9EVy4l+P4ExcFLNhH5AcM8w+p6Ea3+QNT9dd9xfA7bJ5oRrjnKMLQ5d
	 sOzF4TNtt4OltdmGJdLhZJyPaxyuh0vKmZglgOrJIBZgAeVtEFzYEYNui96gFkPjr6
	 zeYZz0LsqjjkRHNAv/m5D2BOlFu6VsOv0esxyIKXiCkquIrXuiq4JztbQnHjav/oOs
	 VMtzL73B1U9VQ==
Subject: Re: [PATCH] xfrm: do not write the ethernet header when the mac
 header is unset
From: netdev-bot+sashiko@kernel.org
To: piyus@iiitd.ac.in
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, andrea.mayer@uniroma2.it, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 ipsec@lists.linux.dev, linux-kernel@vger.kernel.org, kapil@presceralabs.ai
Date: Thu, 19 Nov 2026 11:47:39 +0000
Message-ID: <179508885903.3136.15048597271351937392@kernel.org>
In-Reply-To: <20261116174531.2540348-2-piyus@iiitd.ac.in>
References: <20261116174531.2540348-2-piyus@iiitd.ac.in>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Medium] The patch guards consumers instead of fixing the producer of
  the bad skb state.
- [Low] The patch fixes a KASAN-confirmed slab out-of-bounds write but
  has no Fixes: tag and no Cc: stable.
- [Low] The Signed-off-by chain doesn't match the authorship.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is a
  related mac-header bug in the same IP-TFS decap function.

--

xfrm: do not write the ethernet header when the mac header is unset

This patch adds a skb_mac_header_was_set() check before the eth_hdr()
h_proto store in xfrm4_remove_tunnel_encap() and
xfrm6_remove_tunnel_encap(). It addresses a two byte out-of-bounds write at
skb->head + 0xffff + 12 when an skb arrives with an unset mac header and a
stale mac_len, as produced by end_dt_vrf_rcv() on the SRv6 End.DT4/End.DT6
receive path.

> Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>

[Severity: Low]
The From: author is Piyus Kedia, but the first Signed-off-by is Kapil
Vaswani, and there is no Co-developed-by: tag.

Documentation/process/submitting-patches.rst says the first SoB signals
primary authorship. It also says co-authors other than the From: author
need a Co-developed-by: tag, followed immediately by their Signed-off-by:.

If Kapil Vaswani co-developed this patch, is a Co-developed-by: line
missing? If not, should the SoB order change?

> checkpatch reports one thing, the missing Fixes: tag.  Neither tree we
> reproduced on carries history for the file, so we could not determine the
> introducing commit; we will add the tag if you can name it.

[Severity: Low]
In mainline, blame on the lines changed here points to:

b3284df1c86f ("xfrm: remove input2 indirection from xfrm_mode")

That commit moved the code out of xfrm{4,6}_mode_tunnel.c. The
skb_unset_mac_header() call in end_dt_vrf_rcv(), which leaves the header
unset with a stale mac_len, came from:

664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")

Could one of these be the Fixes: target? Since this is a slab
out-of-bounds write, should Cc: stable be added as well?

> diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
> index 5ed87d51392a5..624ff8055e470 100644
> --- a/net/xfrm/xfrm_input.c
> +++ b/net/xfrm/xfrm_input.c
> @@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
>  
>  	skb_reset_network_header(skb);
>  	skb_mac_header_rebuild(skb);
> -	if (skb->mac_len)
> +	if (skb_mac_header_was_set(skb) && skb->mac_len)
>  		eth_hdr(skb)->h_proto = skb->protocol;

[Severity: High]
The IP-TFS decap path still seems to have the same write. In
net/xfrm/xfrm_iptfs.c, the reuse branch of __input_process_payload() has
no skb_mac_header_was_set() check:

net/xfrm/xfrm_iptfs.c:__input_process_payload() {
    ...
				skb->protocol = protocol;
				skb_mac_header_rebuild(skb);
				if (skb->mac_len)
					eth_hdr(skb)->h_proto = skb->protocol;
    ...
}

Take the End.DT4 path from the commit message, but with the SA in iptfs
mode instead of tunnel mode. The skb then gets here through:

xfrm_input()
  xfrm_inner_mode_input()   /* default case: x->mode_cbs->input */
    iptfs_input()
      iptfs_input_ordered()
        __input_process_payload()

With mac_header == 0xffff and mac_len == 14, would this store land at
skb->head + 0xffff + 12? That is the same out-of-bounds write this patch
fixes.

The same function already computes:

	old_mac = skb_mac_header_was_set(skb) ? skb_mac_header(skb) : NULL;

The non-reuse branch only writes h_proto under if (old_mac), so the reuse
branch is the only one missing the check.

Should this site get the same guard as part of this fix?

[Severity: High]
This isn't a bug introduced by this patch, but there is a related mac
header problem in the non-reuse branch of the same function:

net/xfrm/xfrm_iptfs.c:__input_process_payload() {
    ...
			skb->protocol = protocol;
			if (old_mac) {
				/* rebuild the mac header */
				skb_set_mac_header(skb, -first_skb->mac_len);
				memcpy(skb_mac_header(skb), old_mac, first_skb->mac_len);
				eth_hdr(skb)->h_proto = skb->protocol;
			}
    ...
}

This store checks that the mac header is set, but it does not check
mac_len.

When the outer ESP skb arrives over an L3 device, the mac header can be
set while mac_len is 0. ipip_tunnel_rcv(), ip_gre and wireguard all reset
the mac header to the inner IP header. __netif_receive_skb_core() then
computes mac_len as 0.

In that case skb_set_mac_header(skb, 0) puts the mac header at skb->data.
Can the h_proto store then overwrite bytes 12-13 of the inner IP header
with 0x0800 or 0x86dd?

For IPv4 those bytes are the start of saddr, so the header checksum would
fail and the packet would be dropped. For IPv6 they are bytes 4-5 of
saddr, so the packet could be delivered with a rewritten source address.

This would affect every inner packet after the first one in an aggregated
payload. It would also affect the first one whenever it can't be reused.

The reuse branch checks skb->mac_len before the same store. Should the
non-reuse branch also check first_skb->mac_len?

[ ... ]

> @@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
>  
>  	skb_reset_network_header(skb);
>  	skb_mac_header_rebuild(skb);
> -	if (skb->mac_len)
> +	if (skb_mac_header_was_set(skb) && skb->mac_len)
>  		eth_hdr(skb)->h_proto = skb->protocol;

[Severity: Medium]
Would it make sense to also clear mac_len where the bad state comes from,
in end_dt_vrf_rcv()?

net/ipv6/seg6_local.c:end_dt_vrf_rcv() {
    ...
	/* the decap packet IPv4/IPv6 does not come with any mac header info.
	 * We must unset the mac header to allow the VRF device to rebuild it,
	 * just in case there is a sniffer attached on the device.
	 */
	skb_unset_mac_header(skb);
    ...
}

Other code treats an unset mac header as having mac_len == 0.
skb_reset_mac_len() sets mac_len to 0 when the header is unset.
skb_carve_reset_headers() clears mac_len right after calling
skb_unset_mac_header().

If mac_len stays at 14 here, any code that reads mac_len as "there is a mac
header" is still exposed, including the IP-TFS reuse branch above.
Clearing mac_len in end_dt_vrf_rcv() would cover both xfrm_input.c sites
and the IP-TFS site on this path.

It would not silence the skb_reset_mac_len() warnings used as the control
in the testing notes, since those fire on any unset header regardless of
mac_len.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116174531.2540348-2-piyus%40iiitd.ac.in
