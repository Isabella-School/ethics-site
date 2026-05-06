<script setup>
import { ref, computed } from "vue";
import DriversLicense from "./DriversLicense.vue";
import BillOverlay from "./BillOverlay.vue";
import state_data from "../data/state_data.json";
const props = defineProps({
    data: {
        type: Object,
        required: true,
    },
});

const page = ref(0);
const pageSize = 9;

const entries = computed(() => Object.entries(props.data));

const pages = computed(() => {
    const arr = entries.value;
    const result = [];

    for (let i = 0; i < arr.length; i += pageSize) {
        result.push(arr.slice(i, i + pageSize));
    }

    return result;
});

const totalPages = computed(() => pages.value.length);

const trackStyle = computed(() => ({
    transform: `translateX(calc(-${page.value * 100}% - ${page.value * 32}px))`,
}));

function nextPage() {
    if (page.value < totalPages.value - 1) page.value++;
}

function prevPage() {
    if (page.value > 0) page.value--;
}

const selected = ref(null);
function open(state) {
    selected.value = state_data[state];
}

function closeOverlay() {
    selected.value = null;
}

function getCounts(state) {
    const bills = state_data[state]?.bills || [];
    let passed = 0;
    let pending = 0;
    let failed = 0;

    if (bills.length == 0) {
        passed = -1;
        pending = -1;
        failed = -1;
        return { passed, pending, failed };
    }

    for (const bill of bills) {
        switch (bill.status) {
            case 4:
                passed++;
                break;
            case 3:
            case 2:
            case 1:
                pending++;
                break;
            case 6:
                failed++;
        }
    }
    return { passed, pending, failed };
}
</script>

<template>
    <div class="container-wrapper">
        <!-- controls -->
        <div class="controls">
            <button @click="prevPage" :disabled="page === 0">←</button>
            <button @click="nextPage" :disabled="page === totalPages - 1">
                →
            </button>
        </div>

        <!-- viewport -->
        <div class="viewport">
            <div class="track" :style="trackStyle">
                <div class="page" v-for="(group, i) in pages" :key="i">
                    <DriversLicense
                        v-for="[state, color] in group"
                        :key="state"
                        :initials="state"
                        :bar_color="color"
                        v-bind="getCounts(state)"
                        @select="open(state)"
                    />
                </div>
            </div>
        </div>

        <!-- dots -->
        <div class="dots">
            <span
                v-for="i in totalPages"
                :key="i"
                class="dot"
                :class="{ active: i - 1 === page }"
                @click="page = i - 1"
            />
        </div>
    </div>
    <BillOverlay v-if="selected" :data="selected" @close="closeOverlay" />
</template>

<style scoped>
.container-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 12px;
}

/* controls */
.controls {
    display: flex;
    gap: 10px;
}

/* viewport stays strict */
.viewport {
    width: calc(3 * 220px + 2 * 14px);
    overflow: hidden;

    padding: 5px;
}

/* TRACK now handles spacing between pages */
.track {
    display: flex;
    gap: 32px; /* 👈 THIS is your page gap */

    transition: transform 0.35s ease;
    will-change: transform;
}

/* each page is a fixed 3x3 grid */
.page {
    width: calc(3 * 220px + 2 * 14px);

    display: grid;
    grid-template-columns: repeat(3, 220px);
    grid-auto-rows: 130px;
    gap: 14px;

    flex-shrink: 0;
}

/* dots */
.dots {
    display: flex;
    gap: 6px;
}

.dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #c7c7c7;
    cursor: pointer;
}

.dot.active {
    background: #333;
    transform: scale(1.3);
}
</style>
