# Image Fetcher App

an application that searches for the top images of the week from the Imgur gallery and displays them in a list.

----


> [!NOTE]
> Searched Images are coming from [imgur](https://imgur.com) website.
> 
> This application using thirdparty called [ImgurUtils](https://github.com/NamanVaishnav/imgurUtil)
>
> My Objective is to seperate Network layer by creating spm and cosuming APIs from it 


----


> [!TIP]
> Before running application get Client Id from [Imgur](https://imgur.com)
> 
> once you get Client Id from website put it into SearchViewModel line number 32


<img width="780" alt="Screenshot 2024-01-03 at 4 35 43 PM" src="https://github.com/NamanVaishnav/ImageFetcherApp/assets/6386216/af03ead2-1e5f-4483-89a6-8e82155aeca7">


----

## Solution 

Each cell needs to display the following for each search result:
- title
- date of the post in local time (DD/MM/YY hh:mm am/pm)
- number of additional images in the post (if there are multiple)
- image


Main screen has 4 phase : 

- Result Phase
  
 <img width="887" alt="Screenshot 2024-01-03 at 4 41 35 PM" src="https://github.com/NamanVaishnav/ImageFetcherApp/assets/6386216/c82bf8ae-3d52-47a6-a271-955bcefbb255">


- Empty Phase

  <img width="887" alt="Screenshot 2024-01-03 at 4 51 21 PM" src="https://github.com/NamanVaishnav/ImageFetcherApp/assets/6386216/40a78437-4f13-40a6-8a48-d6d05aadac33">


- Loading Phase

  <img width="885" alt="Screenshot 2024-01-03 at 4 52 07 PM" src="https://github.com/NamanVaishnav/ImageFetcherApp/assets/6386216/e9d3f1f2-ee7a-44ec-877b-87766f2ade66">


- Error Phase
  
  <img width="897" alt="Screenshot 2024-01-03 at 4 52 51 PM" src="https://github.com/NamanVaishnav/ImageFetcherApp/assets/6386216/21bd9ea0-4d8e-4a03-a5fb-0aeeeff66d1b">


In App we have toggle option to switch from Grid to List 

- Grid
  
![Simulator Screenshot - iPhone 15 Pro - 2024-01-03 at 17 09 56](https://github.com/NamanVaishnav/ImageFetcherApp/assets/6386216/53955479-d744-41ea-a0fb-0528289cf1e1)

- List

  ![Simulator Screenshot - iPhone 15 Pro - 2024-01-03 at 17 08 43](https://github.com/NamanVaishnav/ImageFetcherApp/assets/6386216/8fb2b9ca-b408-4b0f-b651-b65faa23618c)


  


