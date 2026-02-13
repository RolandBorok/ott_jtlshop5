{extends file="{$parent_template_path}/layout/header.tpl"}
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">

{block name='layout-header-branding-top-bar'}
    <div class="{if $headerWidth === 'B'}container{else}container-fluid {if $headerWidth === 'N'}container-fluid-xl{/if}{/if} {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}d-lg-flex flex-row-reverse toptopbar{/if}">
    <div class="topbar">
        <div class="topbar-item">
            <span class="topbar-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="21" height="15" viewBox="0 0 21 15" fill="none">
                    <path d="M2 7.50002L7.66707 13L19 2" stroke="white" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </span>
            <p>Schnelle Lieferzeit</p>
        </div>

        <div class="topbar-item">
            <span class="topbar-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36" fill="none">
                    <path d="M16.5 29.1375V18.8625L7.5 13.65V23.925L16.5 29.1375ZM19.5 29.1375L28.5 23.925V13.65L19.5 18.8625V29.1375ZM16.5 32.5875L6 26.55C5.525 26.275 5.15625 25.9125 4.89375 25.4625C4.63125 25.0125 4.5 24.5125 4.5 23.9625V12.0375C4.5 11.4875 4.63125 10.9875 4.89375 10.5375C5.15625 10.0875 5.525 9.725 6 9.45L16.5 3.4125C16.975 3.1375 17.475 3 18 3C18.525 3 19.025 3.1375 19.5 3.4125L30 9.45C30.475 9.725 30.8438 10.0875 31.1063 10.5375C31.3688 10.9875 31.5 11.4875 31.5 12.0375V23.9625C31.5 24.5125 31.3688 25.0125 31.1063 25.4625C30.8438 25.9125 30.475 26.275 30 26.55L19.5 32.5875C19.025 32.8625 18.525 33 18 33C17.475 33 16.975 32.8625 16.5 32.5875ZM24 12.7875L26.8875 11.1375L18 6L15.075 7.6875L24 12.7875ZM18 16.275L20.925 14.5875L12.0375 9.45L9.1125 11.1375L18 16.275Z" fill="white"/>
                </svg>
            </span>
            <p>Pakete ab 100 € Bestellwert innerhalb deutschlands versandkostenfrei</p>
        </div>

        <div class="topbar-item">
            <span class="topbar-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="none">
                    <path d="M8.00246 2.75722C7.69873 1.9979 6.96332 1.5 6.14551 1.5H3.39474C2.3483 1.5 1.5 2.3481 1.5 3.39453C1.5 12.2892 8.71078 19.5 17.6055 19.5C18.6519 19.5 19.5 18.6516 19.5 17.6052L19.5005 14.854C19.5005 14.0361 19.0027 13.3009 18.2434 12.9971L15.6069 11.9429C14.9249 11.6701 14.1483 11.7929 13.5839 12.2632L12.9035 12.8307C12.1089 13.4929 10.9396 13.4402 10.2082 12.7088L8.29222 10.7911C7.56079 10.0596 7.50673 8.89134 8.16895 8.09668L8.73633 7.4163C9.20661 6.85195 9.33049 6.07516 9.05766 5.39309L8.00246 2.75722Z" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </span>
            <p>Tel. +49 (0) 7371 96 59 780</p>
        </div>
    </div>
    </div>
{/block}