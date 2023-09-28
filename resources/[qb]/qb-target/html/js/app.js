const Targeting = Vue.createApp({
    data() {
        return {
            Show: false,
            ChangeTextIconColor: false, // This is if you want to change the color of the icon next to the option text with the text color
            StandardEyeIcon: 'https://cdn.discordapp.com/attachments/903021216464531507/903024370665000981/normaleye.png', // Instead of icon it's using a image source found in HTML 
            CurrentIcon: 'https://cdn.discordapp.com/attachments/903021216464531507/903024370665000981/normaleye.png', // Instead of icon it's using a image source found in HTML
            SuccessIcon: 'https://media.discordapp.net/attachments/1065711026814865409/1156997103516647547/activeeye.png?ex=65170105&is=6515af85&hm=9eac49f3e2e0e439f2f98cabda3d95b5368481964fefeff67a2d27e77f3fa517&=', // Instead of icon it's using a image source found in HTML
            SuccessColor: "#008aff",
            StandardColor: "white",
            TargetHTML: "",
            
            TargetEyeStyleObject: {
                color: "white", // This is the standardcolor, change this to the same as the StandardColor if you have changed it
            },
        }
    },
    destroyed() {
        window.removeEventListener("message", this.messageListener);
        window.removeEventListener("mousedown", this.mouseListener);
        window.removeEventListener("keydown", this.keyListener);
    },
    mounted() {
        this.messageListener = window.addEventListener("message", (event) => {
            switch (event.data.response) {
                case "openTarget":
                    this.OpenTarget();
                    break;
                case "closeTarget":
                    this.CloseTarget();
                    break;
                case "foundTarget":
                    this.FoundTarget(event.data);
                    break;
                case "validTarget":
                    this.ValidTarget(event.data);
                    break;
                case "leftTarget":
                    this.LeftTarget();
                    break;
            }
        });

        this.mouseListener = window.addEventListener("mousedown", (event) => {
            let element = event.target;
            if (element.id) {
                const split = element.id.split("-");
                if (split[0] === 'target' && split[1] !== 'eye' && event.button == 0) {
                    fetch(`https://${GetParentResourceName()}/selectTarget`, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
                        body: JSON.stringify(split[1])
                    }).then(resp => resp.json()).then(_ => {});
                    this.TargetHTML = "";
                    this.Show = false;
                }
            }

            if (event.button == 2) {
                this.LeftTarget();
                fetch(`https://${GetParentResourceName()}/leftTarget`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
                    body: ''
                }).then(resp => resp.json()).then(_ => {});
            }
        });

        this.keyListener = window.addEventListener("keydown", (event) => {
            if (event.key == 'Escape' || event.key == 'Backspace') {
                this.CloseTarget();
                fetch(`https://${GetParentResourceName()}/closeTarget`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
                    body: ''
                }).then(resp => resp.json()).then(_ => {});
            }
        });
    },
    methods: {
        OpenTarget() {
            this.TargetHTML = "";
            this.Show = true;
            this.TargetEyeStyleObject.color = this.StandardColor;
        },

        CloseTarget() {
            this.TargetHTML = "";
            this.TargetEyeStyleObject.color = this.StandardColor;
            this.Show = false;
            this.CurrentIcon = this.StandardEyeIcon;
        },

        FoundTarget(item) {
            if (item.data) {
                this.CurrentIcon = item.data;
            } else {
                this.CurrentIcon = this.SuccessIcon;
            }
            this.TargetEyeStyleObject.color = this.SuccessColor;
        },

        ValidTarget(item) {
            this.TargetHTML = "";
            let TargetLabel = this.TargetHTML;
            const FoundColor = this.SuccessColor;
            const ResetColor = this.StandardColor;
            const AlsoChangeTextIconColor = this.ChangeTextIconColor;
            for (let index in item.data) {
                const itemData = item.data[index];
                const numberTest = Number(index);
                if (!isNaN(numberTest)) index = numberTest + 1;
                if (AlsoChangeTextIconColor) {
                    TargetLabel += "<div id='target-" + index + "' style='margin-bottom: 1vh;'><span id='target-icon-" + index + "' style='color: " + ResetColor + "'><i class='" + itemData.icon + "'></i></span>&nbsp" + itemData.label + "</div>";
                } else {
                    TargetLabel += "<div id='target-" + index + "' style='margin-bottom: 1vh;'><span id='target-icon-" + index + "' style='color: " + FoundColor + "'><i class='" + itemData.icon + "'></i></span>&nbsp" + itemData.label + "</div>";
                }

                setTimeout(() => {
                    const hoverelem = document.getElementById("target-" + index);

                    hoverelem.addEventListener("mouseenter", (event) => {
                        event.target.style.color = FoundColor;
                        if (AlsoChangeTextIconColor) {
                            document.getElementById("target-icon-" + index).style.color = FoundColor;
                        };
                    });

                    hoverelem.addEventListener("mouseleave", (event) => {
                        event.target.style.color = ResetColor;
                        if (AlsoChangeTextIconColor) document.getElementById("target-icon-" + index).style.color = ResetColor;
                    });
                }, 10)
            }
            this.TargetHTML = TargetLabel;
        },

        LeftTarget() {
            this.TargetHTML = "";
            this.CurrentIcon = this.StandardEyeIcon;
            this.TargetEyeStyleObject.color = this.StandardColor;
        }
    }
});

Targeting.use(Quasar, { config: {} });
Targeting.mount("#target-wrapper");