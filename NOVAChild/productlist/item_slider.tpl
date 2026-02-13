{block name='productlist-item-slider'}
    {if $nSeitenTyp === 18 || $nSeitenTyp === 2}
        {* --- START CUSTOM HOMEPAGE LAYOUT --- *}
        <div class="productbox-inner">
            {block name='productlist-item-slider-link'}
                {link href=$Artikel->cURLFull}
                    <div class="item-slider productbox-image ">
                        <div class="inner">
                            {if isset($Artikel->Bilder[0]->cAltAttribut)}
                                {assign var=alt value=$Artikel->Bilder[0]->cAltAttribut|strip_tags|truncate:60|escape:'html'}
                            {else}
                                {assign var=alt value=$Artikel->cName}
                            {/if}
                            {block name='productlist-item-slider-image'}
                                {include file='snippets/image.tpl' item=$Artikel square=false srcSize='sm' class='product-image'}
                            {/block}
                            {if $tplscope !== 'box'}
                                <meta itemprop="image" content="{$Artikel->Bilder[0]->cURLNormal}">
                                <meta itemprop="url" content="{$Artikel->cURLFull}">
                            {/if}
                        </div>
                    </div>
                {/link}
            {/block}
            {block name='productlist-item-slider-caption'}
                {block name='productlist-item-slider-caption-short-desc'}
                    {link href=$Artikel->cURLFull}
                        <span class="item-slider-desc text-clamp-2">
                            {if isset($showPartsList) && $showPartsList === true && isset($Artikel->fAnzahl_stueckliste)}
                                {block name='productlist-item-slider-caption-bundle'}
                                    {$Artikel->fAnzahl_stueckliste}x
                                {/block}
                            {/if}
                            <span {if $tplscope !== 'box'}itemprop="name"{/if}>{$Artikel->cKurzbezeichnung}</span>
                        </span>
                    {/link}
                {/block}
                {block name='productlist-index-include-rating'}
                    <div class="filter-title">
                        <span class="content">
                            {include file='productdetails/rating.tpl' stars=$Artikel->fDurchschnittsBewertung link=$Artikel->cURLFull}
                        </span>
                    </div>
                {/block}
                {block name='productlist-item-slider-include-price'}
                    <div class="item-slider-price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                        {include file='productdetails/price.tpl' Artikel=$Artikel tplscope=$tplscope}
                    </div>
                {/block}
            {/block}

            {* Only show add to cart section if nSeitenTyp is not 2 *}
            {if $nSeitenTyp !== 2}
                {form id="buy_form_{$Artikel->kArtikel}" action=$ShopURL class="form form-basket jtl-validate" data=["toggle" => "basket-add"]}
                {row}
                {col cols=12 xl=12 class='productbox-options' itemprop='offers' itemscope=true itemtype='http://schema.org/Offer'}
                {block name='productlist-item-list-basket-details'}
                    <div class="form-row productbox-onhover productbox-actions item-list-basket-details">
                        {if ($Artikel->inWarenkorbLegbar === 1
                        || ($Artikel->nErscheinendesProdukt === 1 && $Einstellungen.global.global_erscheinende_kaeuflich === 'Y'))
                        && (($Artikel->nIstVater === 0 && $Artikel->Variationen|@count === 0)
                        || $hasOnlyListableVariations === 1)
                        && !$Artikel->bHasKonfig
                        && $Einstellungen.template.productlist.buy_productlist === 'Y'}


                            {* Dont show add to cart button when article price is 0 (voucher)*}
                            {if $Artikel->Preise->fVKNetto == 0}
                                {col cols=12}
                                {link class="btn basket-details-add-to-cart btn-primary btn-block" role="button" href=$Artikel->cURLFull}
                                {lang key='details ' section='custom'}
                                {/link}
                                {/col}
                            {else}

                                {col cols=12}


                                {block name='productlist-item-list-basket-details-quantity'}
                                    {inputgroup class="form-counter" data=["bulk" => {!empty($Artikel->staffelPreis_arr)}]}
                                    {inputgroupprepend}
                                    {button variant=""
                                    data=["count-down"=>""]
                                    aria=["label"=>{lang key='decreaseQuantity' section='aria'}]}
                                        <span class="fas fa-minus"></span>
                                    {/button}
                                    {/inputgroupprepend}
                                    {input type="number" min="0"
                                    step="{if $Artikel->cTeilbar === 'Y' && $Artikel->fAbnahmeintervall == 0}any{elseif $Artikel->fAbnahmeintervall > 0}{$Artikel->fAbnahmeintervall}{else}1{/if}"
                                    min="{if $Artikel->fMindestbestellmenge}{$Artikel->fMindestbestellmenge}{else}0{/if}"
                                    max=$Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]|default:''
                                    id="quantity{$Artikel->kArtikel}"
                                    class="quantity"
                                    name="anzahl"
                                    autocomplete="off"
                                    aria=["label"=>{lang key='quantity'}]
                                    data=["decimals"=>{getDecimalLength quantity=$Artikel->fAbnahmeintervall}]
                                    value="{if $Artikel->fAbnahmeintervall > 0}{if $Artikel->fMindestbestellmenge > $Artikel->fAbnahmeintervall}{$Artikel->fMindestbestellmenge}{else}{$Artikel->fAbnahmeintervall}{/if}{else}1{/if}"}
                                    {inputgroupappend}
                                    {button variant=""
                                    data=["count-up"=>""]
                                    aria=["label"=>{lang key='increaseQuantity' section='aria'}]}
                                        <span class="fas fa-plus"></span>
                                    {/button}
                                    {/inputgroupappend}
                                    {/inputgroup}
                                {/block}


                                {/col}
                                {col cols=12}
                                {block name='productlist-item-list-basket-details-add-to-cart'}
                                    {button type="submit"
                                    variant="primary"
                                    block=true id="submit{$Artikel->kArtikel}"
                                    title="{lang key='addToCart'}"
                                    class="basket-details-add-to-cart"
                                    aria=["label"=>{lang key='addToCart'}]}
                                    {lang key='addToCart'} <img class="slider_cart_icon" alt="cart" src="https://staging.dichtstoffe-shop.de/templates/NOVAChild/themes/my-nova/images/startseite/cart.svg">
                                    {/button}
                                {/block}


                                {/col}
                            {/if}
                        {else}
                            {if $Artikel->nIstVater && $Artikel->kVaterArtikel == 0 && $Artikel->inWarenkorbLegbar === 1}
                                {col cols=12}
                                {block name='productlist-item-list-basket-details-details'}
                                    {link class="btn basket-details-add-to-cart btn-primary btn-block" role="button" href=$Artikel->cURLFull}
                                    {lang key='details ' section='custom'}
                                    {/link}
                                {/block}
                                {/col}
                            {else}
                                {col cols=12}
                                {block name='productlist-item-list-basket-details-details'}
                                    {if ($Artikel->FunktionsAttribute["is_limited_edition"] == 1) || $Artikel->FunktionsAttribute["exit_sortiment"] == 1}
                                        {button type="submit"
                                        variant="primary"
                                        block=true
                                        disabled=true
                                        class="sold-out"
                                        aria=["label"=>{lang key='sold-out'}]}
                                            AUSVERKAUFT
                                        {/button}
                                    {else}
                                        {link class="btn btn-outline-primary btn-block" role="button" href=$Artikel->cURLFull}
                                        {lang key='getNotified' section='custom'}
                                        {/link}
                                    {/if}
                                {/block}
                                {/col}
                            {/if}
                        {/if}
                    </div>
                {/block}
                {block name='productlist-item-form-expandable-inputs-hidden'}
                    {if $Artikel->kArtikelVariKombi > 0}
                        {input type="hidden" name="aK" value=$Artikel->kArtikelVariKombi}
                    {/if}
                    {if isset($Artikel->kVariKindArtikel)}
                        {input type="hidden" name="VariKindArtikel" value=$Artikel->kVariKindArtikel}
                    {/if}
                    {input type="hidden" name="a" value=$Artikel->kArtikel}
                    {input type="hidden" name="wke" value="1"}
                    {input type="hidden" name="overview" value="1"}
                    {input type="hidden" name="Sortierung" value="{if !empty($Suchergebnisse->Sortierung)}{$Suchergebnisse->Sortierung}{/if}"}
                    {if $Suchergebnisse->getPages()->getCurrentPage() > 1}
                        {input type="hidden" name="seite" value=$Suchergebnisse->getPages()->getCurrentPage()}
                    {/if}
                    {if $NaviFilter->hasCategory()}
                        {input type="hidden" name="k" value=$NaviFilter->getCategory()->getValue()}
                    {/if}
                    {if $NaviFilter->hasManufacturer()}
                        {input type="hidden" name="h" value=$NaviFilter->getManufacturer()->getValue()}
                    {/if}
                    {if $NaviFilter->hasSearchQuery()}
                        {input type="hidden" name="l" value=$NaviFilter->getSearchQuery()->getValue()}
                    {/if}
                    {if $NaviFilter->hasCharacteristicValue()}
                        {input type="hidden" name="m" value=$NaviFilter->getCharacteristicValue()->getValue()}
                    {/if}
                    {if $NaviFilter->hasCategoryFilter()}
                        {assign var=cfv value=$NaviFilter->getCategoryFilter()->getValue()}
                        {if is_array($cfv)}
                            {foreach $cfv as $val}
                                {input type="hidden" name="hf" value=$val}
                            {/foreach}
                        {else}
                            {input type="hidden" name="kf" value=$cfv}
                        {/if}
                    {/if}
                    {if $NaviFilter->hasManufacturerFilter()}
                        {assign var=mfv value=$NaviFilter->getManufacturerFilter()->getValue()}
                        {if is_array($mfv)}
                            {foreach $mfv as $val}
                                {input type="hidden" name="hf" value=$val}
                            {/foreach}
                        {else}
                            {input type="hidden" name="hf" value=$mfv}
                        {/if}
                    {/if}
                    {foreach $NaviFilter->getCharacteristicFilter() as $filter}
                        {input type="hidden" name="mf{$filter@iteration}" value=$filter->getValue()}
                    {/foreach}
                {/block}
                {/col}
                {/row}
                {/form}
            {/if}
        </div>
        {* --- END CUSTOM HOMEPAGE LAYOUT --- *}
    {else}
        {* This calls the standard NOVA layout for all other pages (Categories, Search, etc) *}
        {$smarty.block.parent}
    {/if}
{/block}