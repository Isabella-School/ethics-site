<template>
    <div
        class="passport"
        @mouseenter="hover = true"
        @mouseleave="hover = false"
    >
        <!-- COVER -->
        <div class="cover" :class="{ open: hover }">
            <div class="cover-content">
                <div class="cover-title">Transgender Mobility & Safety</div>
                <div class="cover-subtitle">Domestic & Abroad</div>
            </div>
        </div>

        <!-- Inside -->
        <div class="inside">
            <div class="page left">
                <h3>Domestic</h3>
                <ul>
                    <li>
                        An estimated 400,000 Transgender people have moved to a
                        different state due to fear of discrimination
                    </li>
                </ul>
            </div>

            <div class="page right">
                <h3>International</h3>
                <ul>
                    <li>
                        When surveyed, 45% of transgender adults indicated a
                        desire to emigrate from the United States
                    </li>

                    <li>
                        Inconsistent identification puts transgender people at
                        risk while traveling
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from "vue";
const hover = ref(false);
</script>

<style scoped>
.passport {
    position: relative;

    /* 🔥 scaled centerpiece size (keeps original ratio 160:220) */
    width: 340px;
    height: 467px;

    transform-style: preserve-3d;
    perspective: 1400px;

    transition: transform 0.35s ease;
}

.passport:hover {
    transform: translateY(-8px);
}

/* INSIDE */
.inside {
    position: absolute;
    inset: 0;
    display: flex;
    background: #f5f0e6;
    border-radius: 12px;
    overflow: hidden;
    z-index: 1;
}

/* PAGES */
.page {
    width: 50%;
    padding: 20px;
    font-size: 14px;
    border-right: 1px solid #ddd;
}

.page.right {
    border-right: none;
}
.cover {
    position: absolute;
    inset: 0;
    background: #081a33;
    border-radius: 12px;

    box-shadow:
        0 25px 60px rgba(0, 0, 0, 0.55),
        inset 0 0 0 1px rgba(255, 255, 255, 0.05);

    transform-origin: left;
    transition:
        transform 0.9s cubic-bezier(0.4, 0.2, 0.2, 1),
        opacity 0.3s ease 0.6s;

    z-index: 3;
}
.cover-content {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    text-align: center;

    font-family: "Courier New", Courier, monospace;
    color: #f5f0e6;

    gap: 6px;

    /* stamped feel */
    text-transform: uppercase;
    letter-spacing: 2px;
    opacity: 0.9;
}

.cover.open {
    transform: rotateY(-170deg) translateX(-10px);
    pointer-events: none;
}
</style>
