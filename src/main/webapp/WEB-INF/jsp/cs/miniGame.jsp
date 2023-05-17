<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                    <head>
                        <meta charset="UTF-8">
                        <title>書贏遊你來決定-小遊戲</title>

                        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
                        <!-- Styles -->
                        <link
                            href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&family=Poppins:wght@600&display=swap"
                            rel="stylesheet">
                        <link href="${contextRoot}/css/bootstrapSC.min.css" rel="stylesheet">
                        <link href="${contextRoot}/css/font-awesome.min.css" rel="stylesheet">
                        <link href="${contextRoot}/css/swiperSC.css" rel="stylesheet">
                        <link href="${contextRoot}/css/stylesSC.css" rel="stylesheet">
                        <script src='${contextRoot}/js/jquery.min.js'></script>
                        <!-- <script src="https://c./..ode.jquery.com/jquery-3.6.0.min.js"></script> -->

                        <!-- Favicon  -->
                        <link rel="icon" href="${contextRoot}/images/favicon.png">

                        <style>
                            .player_poker img {
                                height: 210px;
                                width: 150px;
                                margin-top: 250px;

                            }

                            .cpu_poker img {
                                position: relative;
                                height: 210px;
                                width: 150px;
                                margin-top: -250px;
                            }

                            .back img {
                                position: absolute;
                                height: 210px;
                                width: 150px;
                                margin-left: 300px;

                            }

                            .buttons {
                                position: absolute;
                                bottom: 20px;
                                left: 50%;
                                transform: translateX(-50%);
                                text-align: center;
                            }

                            button {
                                font-size: 16px;
                                padding: 12px 24px;
                                margin: 10px;
                                border: none;
                                border-radius: 4px;
                                color: #fff;
                                background-color: #4CAF50;
                                cursor: pointer;
                                transition: background-color 0.3s ease-in-out;
                            }

                            button:hover,
                            button:focus {
                                background-color: #2E8B57;
                            }

                            button:active {
                                background-color: #1E5631;
                            }
                        </style>

                    </head>

                    <body>

                        <jsp:include page="../layout/navebar.jsp"></jsp:include>

                        <!-- Header -->
                        <header id="header" class="header" style="height: 110%;">
                            <div class="container" >
                                <div class="row">
                                    <!-- end of col -->
                                    <div class="game">
                                        <div class="cpu_poker">
                                            <!-- <img src="../../../images/poker/10_of_clubs.png">
                        <img src="../../../images/poker/10_of_clubs.png">
                        <img src="../../../images/poker/10_of_clubs.png">
                        <img src="../../../images/poker/10_of_clubs.png">
                        <img src="../../../images/poker/10_of_clubs.png"> -->
                                        </div>
                                        <div class="back">
                                            <img class="back1" src="${contextRoot}/images/southeast.jpg">
                                            <img class="back2" style="visibility:hidden;"
                                                src="${contextRoot}/images/southeast.jpg">
                                            <!-- <h1 style="color: red; float: right; font-size: 500%;">你輸了</h1> -->
                                        </div>
                                        <div class="game">
                                            <div class="player_poker">
                                                <!-- <img src="../../../images/poker/10_of_clubs.png">
                            <img src="../../../images/poker/10_of_clubs.png">
                            <img src="../../../images/poker/10_of_clubs.png">
                            <img src="../../../images/poker/10_of_clubs.png">
                            <img src="../../../images/poker/10_of_clubs.png"> -->
                                            </div>
                                            <div class="buttons d-flex justify-content-center align-items-center mt-4" style="bottom: -200px; position: absolute">
                                                <button class="btn btn-success me-2 hit">加牌</button>
                                                <button class="btn btn-danger me-2 stand">停牌</button>
                                                <button class="btn btn-secondary restart">重新開始</button>
                                            </div>
                                        </div>

                                        <!-- end of row -->
                                    </div>
                                    <!-- end of container -->
                        </header>
                        <!-- end of header -->
                        <!-- end of header -->
                        <jsp:include page="../layout/footerbar.jsp"></jsp:include>

                        <script>
                            // $(document).ready(function () {
                            //     // 取得要移動的圖片和目標位置的圖片
                            //     var $back = $('.back img');
                            //     var $target = $('.player_poker img:first-child');

                            //     // 取得圖片的座標位置
                            //     var backOffset = $back.offset();
                            //     var targetOffset = $target.offset();
                            //     console.log(backOffset)

                            //     // 計算需要移動的距離
                            //     var deltaX = targetOffset.left - backOffset.left;
                            //     var deltaY = targetOffset.top - backOffset.top;

                            //     // 設定圖片的動畫效果
                            //     $back.animate({
                            //         left: '+=' + deltaX + 'px',
                            //         top: '+=' + deltaY + 'px'
                            //     }, 1000);
                            // });




                            // 定義變數：牌堆、玩家手牌、電腦手牌、遊戲是否結束
                            const deck = [
                                '2_of_clubs',
                                '2_of_diamonds',
                                '2_of_hearts',
                                '2_of_spades',
                                '3_of_clubs',
                                '3_of_diamonds',
                                '3_of_hearts',
                                '3_of_spades',
                                '4_of_clubs',
                                '4_of_diamonds',
                                '4_of_hearts',
                                '4_of_spades',
                                '5_of_clubs',
                                '5_of_diamonds',
                                '5_of_hearts',
                                '5_of_spades',
                                '6_of_clubs',
                                '6_of_diamonds',
                                '6_of_hearts',
                                '6_of_spades',
                                '7_of_clubs',
                                '7_of_diamonds',
                                '7_of_hearts',
                                '7_of_spades',
                                '8_of_clubs',
                                '8_of_diamonds',
                                '8_of_hearts',
                                '8_of_spades',
                                '9_of_clubs',
                                '9_of_diamonds',
                                '9_of_hearts',
                                '9_of_spades',
                                '10_of_clubs',
                                '10_of_diamonds',
                                '10_of_hearts',
                                '10_of_spades',
                                'ace_of_clubs',
                                'ace_of_diamonds',
                                'ace_of_hearts',
                                'ace_of_spades2',
                                'jack_of_clubs2',
                                'jack_of_diamonds2',
                                'jack_of_hearts2',
                                'jack_of_spades2',
                                'queen_of_clubs2',
                                'queen_of_diamonds2',
                                'queen_of_hearts2',
                                'queen_of_spades2',
                                'king_of_clubs2',
                                'king_of_diamonds2',
                                'king_of_hearts2',
                                'king_of_spades2',
                            ];
                            let playerCards = [];
                            let cpuCards = [];
                            let isGameOver = false;

                            // 定義函數：從牌堆中抽一張牌
                            function drawCard() {
                                const index = Math.floor(Math.random() * deck.length);
                                return deck.splice(index, 1)[0];
                            }

                            // 定義函數：計算手牌分數
                            function getScore(cards) {
                                let score = 0;
                                let aceCount = 0;
                                for (let i = 0; i < cards.length; i++) {
                                    const card = cards[i];
                                    const value = parseInt(card);
                                    if (!isNaN(value)) {
                                        score += value;
                                    } else if (card !== 'ace_of_clubs' && card !== 'ace_of_diamonds' && card !== 'ace_of_hearts' && card !== 'ace_of_spades2') {
                                        score += 10;
                                    } else {
                                        score += 11;
                                        aceCount++;
                                    }
                                }
                                while (score > 21 && aceCount > 0) {
                                    score -= 10;
                                    aceCount--;
                                }
                                return score;
                            }
                            function endGame(playerWin) {
                                // 將遊戲結束的狀態設為 true
                                isGameOver = true;


                                // 計算CPU手牌分數
                                const cpuScore = getScore(cpuCards);
                                console.log("電腦分數為:" + cpuScore)
                                // 計算玩家手牌分數
                                const playerScore = getScore(playerCards);
                                console.log("玩家分數為:" + playerScore)

                                let message = "";
                                if (playerScore > 21) {
                                    message = '你爆了！';
                                } else if (cpuScore > 21) {
                                    message = 'CPU爆了！';
                                } else if (playerScore > cpuScore) {
                                    message += '你贏了！';
                                } else if (playerScore < cpuScore) {
                                    message += '你輸了！';
                                } else {
                                    message += '平手！';
                                }

                                const cpuBack = document.querySelector('.back');
                                cpuBack.innerHTML += `<h1 style="color: red; float: right; font-size: 500%;">` + message + `</h1>`

                            }


                            function move(image) {
                                var $back1 = $('.back1');
                                var $target = $(image);
                                var $back2 = $('.back2');

                                // 取得圖片的座標位置
                                var back1Offset = $back1.offset();
                                var back2Offset = $back2.offset();
                                var targetOffset = $target.offset();


                                // 計算需要移動的距離
                                var deltaX = targetOffset.left - back1Offset.left;
                                var deltaY = targetOffset.top - back1Offset.top;

                                //先讓back2出來

                                $back2.css('visibility', 'visible');

                                // 設定圖片的動畫效果
                                $back1.animate({
                                    left: '+=' + deltaX + 'px',
                                    top: '+=' + deltaY + 'px'
                                }, 1000, function () {
                                    // 動畫完成後將 back1 元素的位置設定回 back2 的位置
                                    $back1.offset(back2Offset);
                                });

                            }

                            // 定義函數：加牌
                            function hit() {
                                if (!isGameOver) {
                                    const playerPoker = document.querySelector('.player_poker');
                                    const cardImage = document.createElement('img');
                                    const card = drawCard();
                                    playerCards.push(card);
                                    cardImage.src = `${contextRoot}/images/poker/` + card + `.png`;


                                    // 先隱藏牌
                                    cardImage.style.visibility = 'hidden';
                                    playerPoker.appendChild(cardImage);

                                    // 延遲 0.5 秒再移動牌
                                    setTimeout(function () {
                                        move(cardImage);
                                    }, 500);

                                    // 延遲 1.6 秒再開牌
                                    setTimeout(function () {
                                        cardImage.style.visibility = 'visible'
                                    }, 1600);


                                    const score = getScore(playerCards);
                                    //牌爆掉後回傳結果
                                    setTimeout(() => {
                                        if (score > 21) {
                                            endGame(false);
                                        }
                                    }, 1800);
                                }
                            }

                            // 定義函數：停牌
                            function stand() {
                                if (!isGameOver) {
                                    // const cpuBack = document.querySelector('.back img');
                                    // cpuBack.style.display = 'none';
                                    const cpuPoker = document.querySelector('.cpu_poker');
                                    const numCardsToShow = 4; // the number of cards to show
                                    let cardIndex = 0;
                                   
                                    //觸發以後先讓按鍵失效，以免重複觸發
                                    const standButton = document.querySelector('.stand');
                                    standButton.disabled = true;

                                    const intervalId = setInterval(() => {
                                        if (cardIndex < numCardsToShow && getScore(cpuCards) < 17) {
                                            const cardImage = document.createElement('img');
                                            const card = drawCard();
                                            cpuCards.push(card);
                                            cardImage.src = `${contextRoot}/images/poker/` + card + `.png`;
                                            cardImage.style.visibility = 'hidden';
                                            cpuPoker.appendChild(cardImage);
                                            move(cardImage);

                                            setTimeout(() => {
                                                cardImage.style.visibility = 'visible';
                                            }, 1000);

                                            cardIndex++;
                                        } else {
                                            clearInterval(intervalId);
                                            endGame(getScore(playerCards) > getScore(cpuCards));
                                        }
                                    }, 1500);
                                }
                            }

                            // 定義函數：重新開始
                            function restart() {

                                playerCards = [];
                                cpuCards = [];
                                isGameOver = false;
                                const cpuBack = document.querySelector('.back');
                                cpuBack.innerHTML = '<img class="back1" src="${contextRoot}/images/southeast.jpg">';
                                cpuBack.innerHTML += '<img class="back2" style="visibility:hidden;"src="${contextRoot}/images/southeast.jpg">'
                                const playerPoker = document.querySelector('.player_poker');
                                playerPoker.innerHTML = '';
                                const cpuPoker = document.querySelector('.cpu_poker');
                                cpuPoker.innerHTML = '';
                                const hitButton = document.querySelector('.hit');
                                hitButton.disabled = false;
                                const standButton = document.querySelector('.stand');
                                standButton.disabled = false;
                                // while (playerCards.length < 2) {
                                //     const card = drawCard();
                                //     const cardImage = document.createElement('img');
                                //     playerCards.push(card);
                                //     cardImage.src = `${contextRoot}/images/poker/` + card + `.png`;
                                //     playerPoker.appendChild(cardImage);
                                //     const score = getScore(playerCards);
                                // }
                            }

                            // 綁定按鈕事件
                            const hitButton = document.querySelector('.hit');
                            hitButton.addEventListener('click', hit);
                            const standButton = document.querySelector('.stand');
                            standButton.addEventListener('click', stand);
                            const restartButton = document.querySelector('.restart');
                            restartButton.addEventListener('click', restart);

                        </script>
                    </body>

                    </html>