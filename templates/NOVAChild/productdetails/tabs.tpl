{extends file="{$parent_template_path}/productdetails/tabs.tpl"}

{block name='productdetails-tabs-tab-content'}

    {block name='tab-description-media-types'}
        {opcMountPoint id='opc_before_desc'}
        <div class="desc truncated" id="product-description">
            {$Artikel->cBeschreibung}
        </div>
        {if $useDownloads}
        {block name='productdetails-tabs-tab-downloads'}
            {tab title="{lang section='productDownloads' key='downloadSection'}" active=$setActiveClass.downloads id="downloads"|cat:$quickViewIdPostfix}
            {opcMountPoint id='opc_before_download'}
                {include file='productdetails/download.tpl'}
            {opcMountPoint id='opc_after_download'}
            {/tab}
        {/block}
    {/if}

        <button id="desc-more-btn" class="desc-btn">Weiterlesen</button>
        <button id="desc-less-btn" class="desc-btn" style="display:none;">Weniger</button>

        {opcMountPoint id='opc_after_desc'}
    {/block}

    {block name='productdetails-tabs-tab-description-include-attributes'}
        {include file='productdetails/attributes.tpl' tplscope='details'
        showProductWeight=$showProductWeight showShippingWeight=$showShippingWeight
        dimension=$dimension showAttributesTable=$showAttributesTable}
    {/block}
{/block}