<script setup>
import { computed } from "vue";

const props = defineProps({
    data: {
        type: Object,
        required: true,
    },
});

const emit = defineEmits(["close"]);

const bills = computed(() => props.data?.bills || []);

function getStatus(code) {
    switch (code) {
        case 4:
            return { label: "passed", type: "passed" };

        case 3:
            return { label: "passed (pending action)", type: "pending" };

        case 2:
            return { label: "pending", type: "pending" };

        case 1:
            return { label: "introduced", type: "introduced" };

        case 6:
            return { label: "failed", type: "failed" };

        case 5:
            return { label: "vetoed", type: "failed" };

        default:
            return { label: "unknown", type: "unknown" };
    }
}
</script>

<template>
    <div class="overlay" @click.self="emit('close')">
        <div class="panel">
            <div class="header">
                <h2>
                    {{ data.state }} ({{ data.stateAbbreviation }}) -
                    {{ data.year }}
                </h2>
                <button @click="emit('close')">Close</button>
            </div>

            <div class="content">
                <div v-if="bills.length === 0" class="empty">
                    No information is known for this state and year.
                </div>

                <div v-else>
                    <div
                        v-for="bill in bills"
                        :key="bill.bill_number"
                        class="bill"
                    >
                        <h3>{{ bill.bill_number }} — {{ bill.title }}</h3>

                        <div
                            class="status"
                            :class="getStatus(bill.status).type"
                        >
                            {{ getStatus(bill.status).label }}
                        </div>

                        <p class="desc">{{ bill.description }}</p>

                        <small>Last action: {{ bill.last_bill_action }}</small>
                        <hr />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.overlay {
    font-family:
        "Inter",
        system-ui,
        -apple-system,
        sans-serif;
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.6);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
}

.empty {
    padding: 30px;
    text-align: center;
    font-size: 14px;
    color: #666;
    background: #f7f7f7;
    border: 1px dashed #ccc;
    border-radius: 8px;
}
.panel {
    width: 80%;
    max-width: 900px;
    height: 80%;
    background: white;
    border-radius: 12px;
    display: flex;
    flex-direction: column;
    overflow: hidden;
}

.header {
    display: flex;
    justify-content: space-between;
    padding: 12px;
    border-bottom: 1px solid #ddd;
}

.content {
    padding: 12px;
    overflow-y: auto;
}

.bill {
    margin-bottom: 20px;
}

.desc {
    font-size: 14px;
    opacity: 0.85;
}

blockquote {
    margin: 8px 0;
    padding-left: 10px;
    border-left: 3px solid #ccc;
    font-style: italic;
}

.status {
    display: inline-block;
    margin: 6px 0 10px;
    padding: 2px 8px;
    border-radius: 6px;
    font-size: 12px;
    font-weight: 600;
    text-transform: capitalize;
}

/* 🔴 passed = red */
.status.passed {
    background: #fdeaea;
    color: #d00000;
}

/* 🟡 pending stays neutral */
.status.pending {
    background: #fff6db;
    color: #b88900;
}

/* 🟢 failed = green */
.status.failed {
    background: #e6f6ea;
    color: #1f9d3a;
}

/* optional */
.status.introduced {
    background: #e9eefc;
    color: #3556c9;
}
</style>
