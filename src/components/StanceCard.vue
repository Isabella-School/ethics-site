<template>
    <div class="stance-card" :class="stanceclass">
        <div class="header">
            <h2 class="title">{{ title }}</h2>
            <span class="badge">{{ stancelabel }}</span>
        </div>

        <p v-if="summary" class="summary">
            {{ summary }}
        </p>

        <ul v-if="points && points.length" class="points">
            <li v-for="(point, index) in points" :key="index">
                {{ point }}
            </li>
        </ul>

        <footer v-if="footer" class="footer">
            {{ footer }}
        </footer>
    </div>
</template>

<script setup>
import { computed } from "vue";

const props = defineProps({
    title: {
        type: String,
        default: "my ethical position",
    },
    stance: {
        type: String,
        required: true, // "for", "against", or "neutral"
    },
    summary: {
        type: String,
        default: "",
    },
    points: {
        type: Array,
        default: () => [],
    },
    footer: {
        type: String,
        default: "",
    },
});

const stancelabel = computed(() => {
    switch (props.stance) {
        case "for":
            return "in support";
        case "against":
            return "opposed";
        default:
            return "neutral";
    }
});

const stanceclass = computed(() => {
    return {
        for: props.stance === "for",
        against: props.stance === "against",
        neutral: props.stance === "neutral",
    };
});
</script>

<style scoped>
.stance-card {
    border-radius: 12px;
    padding: 20px;
    max-width: 600px;
    font-family: system-ui, sans-serif;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    border-left: 6px solid transparent;
    background: white;

    /* Center all content */
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

/* stance colors */
.for {
    border-left-color: #2e7d32;
}

.against {
    border-left-color: #c62828;
}

.neutral {
    border-left-color: #1565c0;
}

.header {
    display: flex;
    flex-direction: column; /* stack title and badge vertically */
    align-items: center;
    margin-bottom: 10px;
    gap: 4px;
}

.title {
    font-size: 1.25rem;
    margin: 0;
}

.badge {
    font-size: 0.75rem;
    padding: 4px 10px;
    border-radius: 999px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.for .badge {
    background: #e8f5e9;
    color: #2e7d32;
}

.against .badge {
    background: #ffebee;
    color: #c62828;
}

.neutral .badge {
    background: #e3f2fd;
    color: #1565c0;
}

.summary {
    margin: 10px 0;
    color: #333;
}

.points {
    margin: 10px 0;
    padding-left: 18px;
    text-align: left; /* bullets still aligned */
}

.footer {
    margin-top: 12px;
    font-size: 0.85rem;
    color: #666;
}
</style>
