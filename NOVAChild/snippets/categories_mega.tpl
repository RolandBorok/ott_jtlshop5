{extends file="{$parent_template_path}/snippets/categories_mega.tpl"}

{block name='snippets-categories-mega-categories'}
    {if $Einstellungen.template.megamenu.show_categories !== 'N'
    && ($Einstellungen.global.global_sichtbarkeit != 3 || \JTL\Session\Frontend::getCustomer()->getID() > 0)}

        {get_category_array categoryId=0 assign='categories'}

        {if !empty($categories)}
            {assign var='isProductsActive' value=false}
            {if $activeId > 0 || ($nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($Artikel))}
                {$isProductsActive=true}
            {/if}

            <li class="nav-item nav-scrollbar-item dropdown dropdown-full {if $isProductsActive}active{/if}">
                <a href="#" class="nav-link dropdown-toggle" target="_self" aria-expanded="false">
                    <span class="nav-mobile-heading">Produkte</span>
                </a>

                <div class="dropdown-menu">
                    <div class="dropdown-body">
                        {container class="subcategory-wrapper"}
                        {row class="lg-row-lg nav product-menu-row"}

                            {* Mobile Header *}
                        {col lg=4 xl=3 class="nav-item-lg-m nav-item dropdown d-lg-none"}
                            <strong class="nav-mobile-heading">Produkte</strong>
                        {/col}

                            {* SETTINGS: Limit to 3 items per column *}
                        {assign var=counter value=0}
                        {assign var=itemsPerCol value=2}

                            {*
                               col-lg-auto: Allows column to grow as wide as the text needs
                               min-width-col: Custom class to ensure it's not too small
                            *}
                            <div class="col-lg-auto nav-item-lg-m product-category-col">

                        {foreach $categories as $category}
                            {if $category->isOrphaned() === false}

                                <a href="{$category->getURL()}" class="product-category-link">
                                    {$category->getShortName()}
                                </a>

                                {$counter = $counter + 1}

                                {* If 3 items reached, close div and open new one *}
                                {if $counter % $itemsPerCol == 0 && !$category@last}
                                    </div><div class="col-lg-auto nav-item-lg-m product-category-col">
                                {/if}
                            {/if}
                        {/foreach}

                            </div>

                        {/row}
                        {/container}
                    </div>
                </div>
            </li>
        {/if}
    {/if}
{/block}