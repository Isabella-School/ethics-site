<script setup>
defineProps({
    initials: String,
    bar_color: String,
    passed: Number,
    pending: Number,
    failed: Number,
});

const emit = defineEmits(["select"]);

function isUnknown(value) {
    return value === -1;
}
</script>

<template>
    <div class="DriversLicense" @click="emit('select')">
        <div class="top-bar" :style="{ background: bar_color }">
            {{ initials }}
        </div>

        <div class="content">
            <div class="portrait">
                <img :src="`/${initials}.svg`" />
            </div>

            <div class="stats">
                <div :class="{ unknown: isUnknown(passed) }">
                    {{ isUnknown(passed) ? "?" : passed }} passed
                </div>

                <div :class="{ unknown: isUnknown(pending) }">
                    {{ isUnknown(pending) ? "?" : pending }} pending
                </div>

                <div :class="{ unknown: isUnknown(failed) }">
                    {{ isUnknown(failed) ? "?" : failed }} failed
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.DriversLicense {
    font-family: "Public Sans", sans-serif;
    position: relative;
    width: 220px;
    height: 130px;

    background: linear-gradient(180deg, #ffffff 0%, #f7f7f5 100%);
    border-radius: 12px;

    border: 1px solid rgba(0, 0, 0, 0.08);
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);

    overflow: hidden;

    transition:
        transform 0.15s ease,
        box-shadow 0.15s ease;
    will-change: transform;
}

.DriversLicense:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 26px rgba(0, 0, 0, 0.12);
}

.DriversLicense:hover .top-bar {
    filter: brightness(1.08);
}

/* top bar */
.top-bar {
    position: absolute;
    top: 0;
    left: 0;
    height: 32px;
    width: 100%;

    display: flex;
    align-items: center;
    justify-content: center;

    color: #fafaf7;
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1.2px;

    text-transform: uppercase;
}

/* main content */
.content {
    display: flex;
    align-items: center;
    gap: 14px;
    padding-top: 36px;
    padding-left: 10px;
    padding-right: 10px;
}

/* portrait */
.portrait {
    width: 66px;
    height: 86px;

    border-radius: 10px;
    overflow: hidden;

    display: flex;
    align-items: center;
    justify-content: center;

    background: rgba(0, 0, 0, 0.03);
}

.portrait img {
    width: 100%;
    height: 100%;
    object-fit: contain;
    padding: 6px;
}

/* stats */
.stats {
    display: flex;
    flex-direction: column;
    gap: 6px;

    font-size: 12px;
    line-height: 1.2;
    color: #333;
}

/* stat rows */
.stats > div {
    display: flex;
    gap: 6px;
    align-items: baseline;

    transition: color 0.2s ease;
}

/* unknown state */
.unknown {
    color: #9a9a9a;
    font-style: italic;
}

/* value emphasis */
.stats > div span:first-child {
    font-weight: 600;
}

/* optional semantic colors (if you later add classes properly) */
.passed {
    color: #c62828;
}

.pending {
    color: #b08900;
}

.failed {
    color: #1b8f3a;
}
</style>
