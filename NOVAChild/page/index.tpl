{block name='page-index-include-product-slider'}
    {container class="product-slider-wrapper product-slider-{$Box->name} {if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}" fluid=false}
        {include file='snippets/product_slider.tpl'
        productlist=$Box->Artikel->elemente
        title=$title
        hideOverlays=true
        moreLink=$moreLink
        moreTitle=$moreTitle
        titleContainer=true}
    {/container}
{/block}