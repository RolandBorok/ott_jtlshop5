{extends file="{$parent_template_path}/productdetails/details.tpl"}

{block name='productdetails-details-info-product-title'}
    {opcMountPoint id='opc_before_headline'}
    <div class="name_hersteller">
    <h1 class="product-title h2" itemprop="name">{$Artikel->cName}</h1>
        <div class="hersteller">
    {if $Einstellungen.artikeldetails.artikel_weitere_artikel_hersteller_anzeigen === 'Y'}
        <a href="{if !empty($Artikel->cHerstellerHomepage)}{$Artikel->cHerstellerHomepage}{else}{$Artikel->cHerstellerURL}{/if}"
        {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'B'}
            data-toggle="tooltip"
            data-placement="left"
            title="{$Artikel->cHersteller}"
        {/if}
        itemprop="url">
    {/if}
    {if ($Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'B'
    || $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'BT')
    && !empty($Artikel->cHerstellerBildURLKlein)}
        {image lazy=true
        webp=true
        src=$Artikel->cHerstellerBildURLKlein
        alt=$Artikel->cHersteller|escape:'html'
        }
        <meta itemprop="image" content="{$Artikel->cHerstellerBildURLKlein}">
    {/if}
    {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen !== 'B'}
        <span itemprop="name">{$Artikel->cHersteller}</span>
    {/if}
    {if $Einstellungen.artikeldetails.artikel_weitere_artikel_hersteller_anzeigen === 'Y'}
        </a>
    {/if}
        </div>
    </div>

{/block}

{block name='productdetails-basket-form-inline'}
    {$smarty.block.parent}
    {if isset($Artikel->FunktionsAttribute.sicherheitshinweise) && $Artikel->FunktionsAttribute.sicherheitshinweise|strlen > 0}
        <div class="sicherheitshinweise-wrapper">
            <strong>Sicherheitshinweise - bitte anklicken zum Vergrößern</strong><br>

            <!-- Trigger: The clickable image -->
            <a href="javascript:void(0);" data-toggle="modal" data-target="#shModal">
                <img src="https://www.dichtstoffe-shop.de/mediafiles/Datenblaetter/sicherheitshinweise/{$Artikel->FunktionsAttribute.sicherheitshinweise}.jpg"
                     alt="Sicherheitshinweise"
                     class="img-responsive img-fluid sh-preview"/>
            </a>

            <!-- The Popup (Bootstrap Modal) -->
            <div class="modal fade" id="shModal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Sicherheitshinweise</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body text-center">
                            <img src="https://www.dichtstoffe-shop.de//mediafiles/Datenblaetter/sicherheitshinweise/{$Artikel->FunktionsAttribute.sicherheitshinweise}.jpg"
                                 class="img-fluid"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Schließen</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {/if}

{/block}

{block name='productdetails-details-content-not-quickview'}
    {block name='productdetails-details-include-tabs'}
        {include file='productdetails/tabs.tpl'}
    {/block}

    {if empty($smarty.get.quickView)}
        {*SLIDERS*}
        {if isset($Einstellungen.artikeldetails.artikeldetails_stueckliste_anzeigen) && $Einstellungen.artikeldetails.artikeldetails_stueckliste_anzeigen === 'Y' && isset($Artikel->oStueckliste_arr) && $Artikel->oStueckliste_arr|count > 0
        || isset($Einstellungen.artikeldetails.artikeldetails_produktbundle_nutzen) && $Einstellungen.artikeldetails.artikeldetails_produktbundle_nutzen === 'Y' && isset($Artikel->oProduktBundle_arr) && $Artikel->oProduktBundle_arr|count > 0
        || isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0
        || isset($Xselling->Kauf->Artikel) && count($Xselling->Kauf->Artikel) > 0
        || isset($oAehnlicheArtikel_arr) && count($oAehnlicheArtikel_arr) > 0}
            {container fluid=false class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
            {if isset($Einstellungen.artikeldetails.artikeldetails_stueckliste_anzeigen) && $Einstellungen.artikeldetails.artikeldetails_stueckliste_anzeigen === 'Y' && isset($Artikel->oStueckliste_arr) && $Artikel->oStueckliste_arr|count > 0}
                {block name='productdetails-details-include-product-slider-partslist'}
                    <div class="partslist">
                        {lang key='listOfItems' section='global' assign='slidertitle'}
                        {include file='snippets/product_slider.tpl' id='slider-partslist' productlist=$Artikel->oStueckliste_arr title=$slidertitle showPartsList=true}
                    </div>
                {/block}
            {/if}

            {if isset($Einstellungen.artikeldetails.artikeldetails_produktbundle_nutzen) && $Einstellungen.artikeldetails.artikeldetails_produktbundle_nutzen === 'Y' && isset($Artikel->oProduktBundle_arr) && $Artikel->oProduktBundle_arr|count > 0}
                {block name='productdetails-details-include-bundle'}
                    <div class="bundle">
                        {include file='productdetails/bundle.tpl' ProductKey=$Artikel->kArtikel Products=$Artikel->oProduktBundle_arr ProduktBundle=$Artikel->oProduktBundlePrice ProductMain=$Artikel->oProduktBundleMain}
                    </div>
                {/block}
            {/if}
            {if isset($Xselling->Standard) || isset($Xselling->Kauf) || isset($oAehnlicheArtikel_arr)}
                <div class="recommendations d-print-none">
                    {block name='productdetails-details-recommendations'}
                        {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
                            {foreach $Xselling->Standard->XSellGruppen as $Gruppe}
                                {include file='snippets/product_slider.tpl' class='x-supplies' id='slider-xsell-group-'|cat:$Gruppe@iteration productlist=$Gruppe->Artikel title=$Gruppe->Name}
                            {/foreach}
                        {/if}

                        {if isset($Xselling->Kauf->Artikel) && count($Xselling->Kauf->Artikel) > 0}
                            {lang key='customerWhoBoughtXBoughtAlsoY' section='productDetails' assign='slidertitle'}
                            {include file='snippets/product_slider.tpl' class='x-sell' id='slider-xsell' productlist=$Xselling->Kauf->Artikel title=$slidertitle}
                        {/if}

                        {if isset($oAehnlicheArtikel_arr) && count($oAehnlicheArtikel_arr) > 0}
                            {lang key='RelatedProducts' section='productDetails' assign='slidertitle'}
                            {include file='snippets/product_slider.tpl' class='x-related' id='slider-related' productlist=$oAehnlicheArtikel_arr title=$slidertitle}
                        {/if}
                    {/block}
                </div>
            {/if}
            {/container}
        {/if}
        {block name='productdetails-details-include-popups'}
            <div id="article_popups">
                {include file='productdetails/popups.tpl'}
            </div>
        {/block}
    {/if}
{/block}
