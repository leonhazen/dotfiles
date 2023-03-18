// Author: Leon Hazen (with some help from ChatGPT)
// Date: 2023-03-18
// This script adds a link to IMDb pages to add a show to 
// either Radarr or Sonarr, depending on if it's a movie or TV series

if (window.location.pathname.split('/')[1] == 'title') {

  const imdbMovieId = window.location.pathname.split('/')[2];

  // Get the title type from the pageProps object
  const titleData = JSON.parse(document.getElementById('__NEXT_DATA__').textContent).props.pageProps.aboveTheFoldData
  const titleType = titleData.titleType.id;
  const imdbTitle = titleData.titleText.text;

  console.log(titleType)
  // Create the link URL based on the title type
  let linkUrl;
  if (titleType === 'movie') {
    const imdbMovieId = window.location.pathname.split('/')[2];
    linkUrl = `https://radarr.reon.dev/add/new?term=imdb%3A${imdbMovieId}`;
    linkText = 'Radarr'
  } else if (titleType === 'tvSeries' | titleType === 'tvMiniSeries') {
    const imdbSeriesId = window.location.pathname.split('/')[2];
    linkUrl = `https://sonarr.reon.dev/add/new?term=${encodeURIComponent(imdbTitle)}`;
    linkText = 'Sonarr'
  }

  // Create the link element
  const linkElement = document.createElement('a');
  linkElement.href = linkUrl;
  linkElement.target = '_blank';
  linkElement.textContent = linkText;
  linkElement.setAttribute('class', 'ipc-link ipc-link--baseAlt ipc-link--inherit-color')

  // Find the unordered list element below the title
  const listElement = document.querySelector('#__next main section:nth-child(1) div:nth-child(4) section section div:nth-child(2) div ul');

  // Create a new list item element for the link
  const listItemElement = document.createElement('li');
  listItemElement.setAttribute('role', 'presentation');
  listItemElement.setAttribute('class', 'ipc-inline-list__item');
  listItemElement.appendChild(linkElement);

  // Insert the new list item element into the unordered list
  listElement.appendChild(listItemElement);
}