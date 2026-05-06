<template>
    <div v-if="!acknowledged" class="trigger-warning-overlay">
        <div class="warning-box">
            <h2>Trigger Warning</h2>
            <p>
                This site contains discussions on sensitive topics, including
                gender, healthcare, sexual assault, discrimination, and
                genocide. Some content may be distressing.
            </p>
            <div class="buttons">
                <button @click="acknowledgeWarning">Acknowledge</button>
                <button @click="closeSite">Leave Site</button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue";

const acknowledged = ref(false);

function acknowledgeWarning() {
    acknowledged.value = true;
}

function closeSite() {
    window.location.href = "https://www.google.com"; // redirect away
}
</script>

<style scoped>
/* Fully opaque overlay covering the entire site */
.trigger-warning-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: #000000; /* fully opaque black */
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 99999; /* above everything */
}

/* Warning box in the center */
.warning-box {
    background: #fff;
    padding: 30px 40px;
    border-radius: 12px;
    max-width: 500px;
    text-align: center;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

.warning-box h2 {
    margin-bottom: 15px;
    color: #c62828;
}

.warning-box p {
    margin-bottom: 25px;
    color: #333;
    font-size: 14px;
    line-height: 1.5;
}

/* Buttons */
.buttons {
    display: flex;
    justify-content: space-between;
    gap: 15px;
}

.buttons button {
    flex: 1;
    padding: 10px 15px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    font-size: 14px;
    transition: all 0.2s ease;
}

.buttons button:first-child {
    background: #2e7d32;
    color: white;
}

.buttons button:first-child:hover {
    background: #1b5e20;
}

.buttons button:last-child {
    background: #c62828;
    color: white;
}

.buttons button:last-child:hover {
    background: #8e0000;
}
</style>
