import matplotlib.pyplot as plt
import numpy as np
import yaml

def parse_scan_file(filename):
    messages = []
    with open(filename, 'r') as file:
        current_message = []
        for line in file:
            # 检测分隔线
            if line.strip() == "# =======================================":
                if current_message:  # 保存上一条消息
                    try:
                        msg = yaml.safe_load("\n".join(current_message))
                        messages.append(msg)
                    except yaml.YAMLError as e:
                        print(f"YAML 解析错误: {e}")
                    current_message = []
            else:
                current_message.append(line.strip())

        # 处理最后一条消息
        if current_message:
            try:
                msg = yaml.safe_load("\n".join(current_message))
                messages.append(msg)
            except yaml.YAMLError as e:
                print(f"YAML 解析错误: {e}")

    return messages

def plot_laser_scan(messages):
    for idx, msg in enumerate(messages):
        try:
            # 提取数据
            ranges = np.array(msg['ranges'], dtype=float)
            angle_min = float(msg['angle_min'])
            angle_max = float(msg['angle_max'])
            angle_increment = float(msg['angle_increment'])

            # 生成角度数组
            angles = np.arange(angle_min, angle_max, angle_increment)
            angles = angles[:len(ranges)]  # 确保长度匹配
            try:
                # 将极坐标转换为笛卡尔坐标
                x = ranges * np.cos(angles)
                y = ranges * np.sin(angles)
            except:
                continue

            # 绘制图形
            plt.figure(figsize=(8, 8))
            plt.scatter(x, y, s=1, label='Points')
            plt.title(f'Message {idx+1}')
            plt.xlabel('X')
            plt.ylabel('Y')
            plt.axis('equal')
            plt.legend()
            plt.grid(True)


            plt.savefig(f'Laser{idx+1}.png')
            plt.clf()
            plt.close()

        except KeyError as e:
            print(f"消息 {idx+1} 缺少: {e}")
            pass

if __name__ == "__main__":
    scan_file = "scan.yaml"
    laser_scan_messages = parse_scan_file(scan_file)
    plot_laser_scan(laser_scan_messages)
