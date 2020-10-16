use competitive::prelude::*;

#[argio(output = AtCoder)]
fn main(input: [(f32, f32, f32); 600]) {
    //csvファイルを読み取る
    let dx = input[23].0.clone() - input[22].0.clone(); // 微小時間の幅を求める
    let mut v = Vec::new(); // 配列の用意
    let mut w = Vec::new();
    for i in 0..600 {
        v.push(input[i].1.clone()); // ch1, ch2のデータを一旦こちらにコピー
        w.push(input[i].2.clone());
    }
    let max_ch1 = v.clone().into_iter().fold(0.0, f32::max); // 振幅の最大値を求める
    let max_ch2 = w.clone().into_iter().fold(0.0, f32::max);
    println!("ch1'x max = {}", max_ch1);
    println!("ch2'x max = {}", max_ch2);

    let mut sum1 = 0.0; // 全ての値を足しこむ変数を用意
    let mut sum2 = 0.0;
    for i in 0..600 {
        sum1 += v[i].clone().abs(); // 全て絶対値をとって足しこむ
        sum2 += w[i].clone().abs();
    }
    let amp1 = dx * sum1 * 3.14 / 2.0 / (input[599].0.clone() - input[0].0.clone()); //振幅を計算 2a/ωとか使って
    let amp2 = dx * sum2 * 3.14 / 2.0 / (input[599].0.clone() - input[0].0.clone());
    println!("ch1::sum1: {}", amp1);
    println!("ch2::sum2: {}", amp2);

    println!("rate = {}", max_ch2 / max_ch1); // ゲイン
    println!("rate2 = {}", sum2 / sum1);

    println!("");
    println!("");

    // こっから下で-3e-2~3e-2の間に入るやつをピックアップ
    // 特にぴったり0になったやつはメッセージを短くして読みやすく
    // count1とcount2はプログラムを改良する中で意味がなくなった変数(消しても大丈夫)
    let mut count1 = 0;
    let mut count2 = 0;
    for i in 0..600 {
        if input[i].1 == 0.0 {
            println!("ch1 = 0: {}, {}", input[i].0.clone(), input[i].1.clone());
            count1 += 1;
        } else if input[i].1 >= -3.00e-2 && input[i].1 <= 3.00e-2 {
            println!(
                "maybe ch1 = 0: {}, {}",
                input[i].0.clone(),
                input[i].1.clone()
            );
            count1 += 1;
        }
        if input[i].2 == 0.0 {
            println!("ch2 = 0: {}, {}", input[i].0.clone(), input[i].2.clone());
            count2 += 2;
        } else if input[i].2 >= -3.00e-2 && input[i].2 <= 3.00e-2 {
            println!(
                "maybe ch2 = 0: {}, {}",
                input[i].0.clone(),
                input[i].2.clone()
            );
            count2 += 1;
        }
    }
    // for i in 0..600 {
    //     if input[i].1 >= -2.00e-2 && input[i].1 <= 2.00e-2 {
    //         println!(
    //             "maybe ch1 = 0: {}, {}",
    //             input[i].0.clone(),
    //             input[i].1.clone()
    //         );
    //         count1 += 1;
    //     }
    // }
    // for i in 0..600 {
    //     if input[i].2 >= -2.00e-2 && input[i].2 <= 2.00e-2 {
    //         println!(
    //             "maybe ch2 = 0: {}, {}",
    //             input[i].0.clone(),
    //             input[i].2.clone()
    //         );
    //         count2 += 1;
    //     }
    // }
    if count1 == 0 {
        println!("count1 err");
    }
    if count2 == 0 {
        println!("count2 err");
    }
}
