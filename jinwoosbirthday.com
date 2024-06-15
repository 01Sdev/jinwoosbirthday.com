<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>친구 생일 기념 사이트</title>
    <style>
        body {
            background-color: #B0FFFF; /* 연한 하늘색 배경 (RGB 176, 255, 255) */
            font-family: 'Arial', sans-serif;
            color: black;
            margin: 0;
            padding: 0;
        }
        header {
            text-align: center;
            padding: 20px;
            background: #B0FFFF; /* 헤더 배경 색상 변경 */
            color: black;
        }
        header h1 {
            font-size: 2.5em;
            margin: 0;
            padding: 20px;
            display: inline-block;
        }
        nav {
            margin: 20px 0;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: black;
        }
        nav a:visited, nav a:hover, nav a:focus, nav a:active {
            color: black; /* 링크의 다른 상태에서도 검은색 유지 */
            text-decoration: none; /* 링크의 밑줄 제거 */
        }
        .container {
            margin: 0 auto;
            max-width: 1200px;
            padding: 20px;
        }
        .section-title {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .flashcards, .gallery, .video-section {
            margin-bottom: 40px;
        }
        .flashcards {
            text-align: center; /* 플래시카드를 중간에 배치 */
        }
        .flashcard {
            border: 2px solid #000;
            padding: 20px; /* 적절한 패딩 설정 */
            margin: 20px auto; /* 플래시카드를 중간에 배치 */
            cursor: pointer;
            text-align: center; /* 플래시카드 글씨를 중간에 배치 */
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            background-color: #FFB3B3; /* 플래시카드 배경을 지정된 색상으로 설정 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 300px; /* 적절한 크기 설정 */
            height: 300px; /* 적절한 크기 설정 */
            display: flex; /* 플래시카드 내부 글씨 중앙 정렬 */
            justify-content: center; /* 플래시카드 내부 글씨 중앙 정렬 */
            align-items: center; /* 플래시카드 내부 글씨 중앙 정렬 */
        }
        .flashcard:hover {
            background-color: #e0e0e0;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .gallery {
            position: relative; /* 상대 위치로 설정하여 슬라이드 가능하게 */
            width: 300px; /* 갤러리 너비 설정 */
            height: 400px; /* 갤러리 높이 설정 */
            margin: 0 auto; /* 갤러리를 중앙에 배치 */
            overflow: hidden; /* 오버플로우 숨김 */
        }
        .gallery img {
            position: absolute;
            width: 100%; /* 폴라로이드 이미지 크기 조정 */
            height: auto;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            margin: 0 auto;
            padding: 10px;
            background-color: white;
            border: 10px solid #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: opacity 1s ease; /* 부드러운 전환 효과 */
            opacity: 0; /* 초기 상태를 투명하게 설정 */
        }
        .gallery img.active {
            opacity: 1; /* 활성화된 이미지는 불투명하게 설정 */
        }
        .qr-box {
            text-align: center;
            margin-top: 40px;
        }
        .qr-box a {
            text-decoration: none; /* 링크 밑줄 제거 */
            color: inherit; /* 링크 색상 상속 */
        }
        .qr-box img {
            width: 200px;
            height: auto;
            cursor: pointer; /* 커서 변경 */
        }
        .video-section {
            text-align: center;
        }
        .video-section video {
            width: 100%;
            max-width: 800px;
            border: 2px solid #000;
        }
        video::-webkit-media-controls {
            display: none !important;
        }
        video::-webkit-media-controls-overlay-play-button {
            display: none !important;
        }
        video::-webkit-media-controls-start-playback-button {
            display: none !important;
        }
    </style>
</head>
<body>
    <header>
        <h1>진우유님, 생일을 축하합니다!</h1>
        <nav>
            <a href="#video">귀요미 진우</a>
            <a href="#flashcards">축사</a>
            <a href="#gallery">사진 갤러리</a>
            <a href="#recommendation">추천곡</a>
        </nav>
    </header>
    <div class="container">
        <section id="video" class="video-section">
            <h2 class="section-title">귀요미 진우❤️</h2>
            <video autoplay muted loop>
                <source src="https://github.com/01Sdev/studies/assets/163882242/5b78751a-b850-487e-9bb4-0a37ac016305" type="video/mp4">
                브라우저가 비디오 태그를 지원하지 않습니다.
            </video>
        </section>
        <section id="flashcards" class="flashcards">
            <h2 class="section-title">여기 눌러 보세요~</h2>
            <div class="flashcard" onclick="showMessage(this)">두근두근🫠</div>
        </section>
        <section id="gallery" class="gallery">
            <h2 class="section-title">사진 갤러리</h2>
            <img src="https://github.com/01Sdev/studies/assets/163882242/d7fac73b-ec52-4077-80b7-10e0881d42cf" alt="추억 사진 1" class="active">
            <img src="https://github.com/01Sdev/studies/assets/163882242/9bb44832-bf3c-4a21-8470-996955847a3d" alt="추억 사진 2">
            <img src="https://github.com/01Sdev/studies/assets/163882242/8978e480-9cfa-44cf-95f1-c8705ba4ff48" alt="추억 사진 3">
        </section>
        <section id="recommendation" class="qr-box">
            <h2 class="section-title">진우를 위한 플레이리스트 🎶</h2>
            <a href="https://youtube.com/playlist?list=PLoa09kR5NIAbZ8MLiG2Yg-_BFnMSTW71Y&feature=shared" target="_blank">
                <img src="https://qr-codes-svg.s3.amazonaws.com/jMzuG5.svg?1718481310066" alt="추천곡 QR 코드">
            </a>
        </section>
    </div>
    <script>
        function showMessage(card) {
            card.textContent = "진우야, 생일 진심으로 축하해! 널 만난 건 나에게 축복이야~ 오래오래 행복하고 건강했으면 좋겠고 하루하루 더욱 멋있는 사람이 되었으면 좋겠고 네가 꾸는 꿈들이 다 이루어졌으면 좋겠다. 너의 아픈 모습, 힘든 모습 보기 싫지만 항상 내가 응원하고 네가 그렇게 아파하고 힘들어하지 않게끔 도와줄 테니 나를 믿고 나에게 맡겨. 부디 나쁜 일 조심하고 좋은 길, 꽃길만 걷길 바라! 다시 한번 생일 축하해❤️";
        }

        const images = document.querySelectorAll('.gallery img');
        let currentIndex = 0;
        let startX;

        
        // Function to show the next image
        function showNextImage() {
            // Remove 'active' class from the current image
            images[currentIndex].classList.remove('active');
        
            // Increment currentIndex to move to the next image
            currentIndex = (currentIndex + 1) % images.length;
        
            // Add 'active' class to the new current image
            images[currentIndex].classList.add('active');
        }
        
        // Set interval to automatically switch images every 5 seconds
        let intervalId = setInterval(showNextImage, 5000);
        
        // Event listener for mousedown event on the gallery
        document.querySelector('.gallery').addEventListener('mousedown', (event) => {
            // Capture the initial X coordinate of mouse/touch
            startX = event.pageX;
        
            // Clear the interval to stop auto image switching
            clearInterval(intervalId);
        });
        
        // Event listener for mouseup event on the gallery
        document.querySelector('.gallery').addEventListener('mouseup', (event) => {
            // Determine the distance moved
            const moveX = event.pageX - startX;
        
            // If moved more than 50 pixels to the left, show previous image
            if (moveX < -50) {
                images[currentIndex].classList.remove('active');
                currentIndex = (currentIndex + 1) % images.length;
                images[currentIndex].classList.add('active');
            }
            // If moved more than 50 pixels to the right, show next image
            else if (moveX > 50) {
                images[currentIndex].classList.remove('active');
                currentIndex = (currentIndex - 1 + images.length) % images.length;
                images[currentIndex].classList.add('active');
            }
        
            // Reset the interval to resume auto image switching
            intervalId = setInterval(showNextImage, 5000);
        });
        
        // Prevent default behavior on touchmove to avoid scrolling on mobile devices
        document.querySelector('.gallery').addEventListener('touchmove', (event) => {
            event.preventDefault();
        });
    </script>
</body>
</html>
