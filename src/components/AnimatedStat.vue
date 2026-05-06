<template>
    <div ref="el" class="stat">
        <div class="num">{{ displayValue }}</div>

        <div class="label">
            {{ label }}

            <span v-if="citationText" class="citation">
                —
                <a
                    v-if="citationUrl"
                    :href="citationUrl"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="citation-link"
                >
                    {{ citationText }}
                </a>
                <span v-else>
                    {{ citationText }}
                </span>
            </span>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from "vue";

const props = defineProps({
    value: { type: Number, required: true },
    label: { type: String, required: true },

    // citation support
    citationText: { type: String, default: "" },
    citationUrl: { type: String, default: "" },

    duration: { type: Number, default: 1200 },
});

const el = ref(null);
const displayValue = ref(0);

let observer;

function animate(to) {
    const start = performance.now();

    function tick(now) {
        const progress = Math.min((now - start) / props.duration, 1);
        displayValue.value = Math.floor(progress * to);

        if (progress < 1) requestAnimationFrame(tick);
    }

    requestAnimationFrame(tick);
}

onMounted(() => {
    observer = new IntersectionObserver(
        ([entry]) => {
            if (entry.isIntersecting) {
                animate(props.value);
                observer.disconnect();
            }
        },
        { threshold: 0.4 },
    );

    if (el.value) observer.observe(el.value);
});

onBeforeUnmount(() => {
    if (observer) observer.disconnect();
});
</script>

<style scoped>
.stat {
    padding: 14px 16px;
    border-left: 3px solid #081a33;
}

.num {
    font-size: 28px;
    font-weight: 600;
    color: #081a33;
}

.label {
    font-size: 12px;
    opacity: 0.7;
}

.citation {
    font-size: 11px;
    opacity: 0.65;
    margin-left: 6px;
}

.citation-link {
    color: inherit;
    text-decoration: underline;
}

.citation-link:hover {
    opacity: 0.85;
}
</style>
