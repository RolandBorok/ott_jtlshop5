{block name='productdetails-mediafile-pdf'}
    {card class="mediafiles-pdf" title-text=$oMedienDatei->cName}
    {row}
    {col md=12}
    {if !empty($oMedienDatei->cPfad)}
        {link class="text-decoration-none-util"
        href="{$ShopURL}/{$smarty.const.PFAD_MEDIAFILES}{$oMedienDatei->cPfad}"
        target="_blank"
        }
        {image alt="PDF" src="{$ShopURL}/{$smarty.const.PFAD_BILDER}intern/file-pdf.png"}
            <span class="text-decoration-underline" >{$oMedienDatei->cName}</span>
        {/link}
    {elseif !empty($oMedienDatei->cURL)}
        {link class="text-decoration-none-util" href=$oMedienDatei->cURL target="_blank"}
        {image alt="PDF" src="{$ShopURL}/{$smarty.const.PFAD_BILDER}intern/file-pdf.png"}
            <span class="text-decoration-underline">{$oMedienDatei->cName}</span>
        {/link}
    {/if}
    {/col}
    {/row}
    {/card}
{/block}