<template>
    <transition name="modal-animation">
        <div v-show="modalActive" class="modal">
            <transition name="modal-animation-inner">
                <div v="modalActive" class="modal-inner">
                    <i @click="close" class="far fa-times-circle"></i>
                    <slot></slot>
                    <button class="buttons" @click="close" type="button">Close</button>
                </div>
            </transition>
        </div>
    </transition>

</template>

<script>
export default{
    props: ["modalActive"],
    setup(props, {emit}){
        const close = () => {
            emit("close");
        };
        return {close};
    }
};
</script>

<style scoped>
.modal {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: rgba(0, 0, 0, .5);
    z-index: 9999;
}

.modal-inner {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.far.fa-times-circle {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 24px;
    color: #333;
    cursor: pointer;
}

.buttons {
    background-color: #007bff;
    color: white;
    border: none;
    padding: .4rem 1rem;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    margin-top: 1rem;
    margin-left: 3.5rem;

}

.buttons:hover {
    background-color: #0056b3;
}
</style>



