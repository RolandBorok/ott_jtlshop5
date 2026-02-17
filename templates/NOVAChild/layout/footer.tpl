{extends file="{$parent_template_path}/layout/footer.tpl"}

{block name='layout-footer-copyright'}
    <div id="copyright">
        {container fluid=true class="footer_container"}
        {row class="footer_row"}
        {assign var=isBrandFree value=JTL\Shop::isBrandfree()}
        {block name='layout-footer-copyright-copyright'}

        {/block}
        {if !$isBrandFree}
            {block name='layout-footer-copyright-brand'}
                {col cols=12 md="auto" class="ml-auto-util{if $Einstellungen.template.theme.button_scroll_top === 'Y'} pr-md-8{/if}" id="system-credits"}
                    © Dichtstoff Shop - Fugentechnik Ott, Paul Ott
                {/col}
            {/block}
        {/if}
        {/row}
        {/container}
    </div>
{/block}

{block name='layout-footer-boxes'}
    {getBoxesByPosition position='bottom' assign='footerBoxes'}
    {if isset($footerBoxes) && count($footerBoxes) > 0}
        {row id='footer-boxes'}
        {foreach $footerBoxes as $box}
            {if $box->isActive() && !empty($box->getRenderedContent())}
                {col cols=12 sm=6 md=4 lg=true}
                {$box->getRenderedContent()}
                {/col}
            {/if}
        {/foreach}
        {/row}
    {/if}
    <hr class="footer-divider">

    <div class="row payment-methods">
        <div class="col text-left">
            <a href="https://www.trustedshops.de/bewertung/info_XE00A3997C90ED7D02D0189AE4D051D42.html" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/trusted.png" alt="Trusted Shops Bewertung" class="zahlungsart-img" loading="lazy">
            </a>
            <a href="https://www.shopauskunft.de/review/www.dichtstoffe-shop.de" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/shopauskaunft.png" alt="Shopauskunft Bewertung" class="zahlungsart-img" loading="lazy">
            </a>
            <a href="https://www.shopfinder.info/" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/shopfinder.png" alt="Shopfinder" class="zahlungsart-img" loading="lazy">
            </a>
            <a href="https://www.kaeufersiegel.de/zertifikat/?uuid=df298605-1b5d-11eb-a4fa-9c5c8e4fb375-0342402281" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/sicher.png" alt="K&auml;ufersiegel" class="zahlungsart-img" loading="lazy">
            </a>
            <a href="https://www.lizenzero.de/?utm_source=kundenseite&utm_medium=onlinesiegel&utm_campaign=referral" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/lizenzpartner.png"
                     alt="Lizenzero Lizenzpartner"
                     class="zahlungsart-img" loading="lazy">
            </a>
            <a href="#" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/comodo.png" alt="Comodo SSL Zertifikat" class="zahlungsart-img" loading="lazy">
            </a>
            <a href="https://logo.haendlerbund.de/show.php?uuid=cba5f421-111a-11eb-a4fa-9c5c8e4fb375-1261388884" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/mitglied.png" alt="H&auml;ndlerbund Mitglied" class="zahlungsart-img" loading="lazy">
            </a>
        </div>
        <div class="social_icons">
            <a href="https://www.facebook.com/p/Fugentechnik-Ott-100054480910235/" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/SocialIcons.svg"
                     alt="Facebook" class="social-img" loading="lazy">
            </a>
            <a href="https://www.instagram.com/fugentechnik_ott/" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/SocialIcons1.svg"
                     alt="Instagram" class="social-img" loading="lazy">
            </a>
            <a href="https://www.dichtstoffe-blog.de/" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/icon-blog.svg"
                     alt="Blog" class="social-img blog_icon" loading="lazy">
            </a>
            <a href="https://www.youtube.com/@MyFuger/videos" target="_blank" rel="noopener">
                <img src="{$ShopURL}/templates/NOVAChild/themes/my-nova/images/SocialIcons2.svg"
                     alt="YouTube" class="social-img" loading="lazy">
            </a>
        </div>
    </div>
{/block}

{block name='footer-vat-notice'}
    <span class="small">* {$footnoteVat}{if isset($footnoteShipping)}{$footnoteShipping}{/if}</span>

    <p class="small">Alle Markennamen, Warenzeichen und eingetragenen Warenzeichen sind Eigentum ihrer rechtmäßigen Eigentümer und dienen hier nur der Beschreibung.</p>
{/block}