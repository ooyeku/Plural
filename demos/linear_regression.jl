using Flux
using Statistics
using Flux: train!

function lrmdemo()
    # function to create a linear regression model
    actual(x) = 10x + 5

    # create a test and training dataset of 1_000_000 observations
    x_train, x_test = hcat(0:10000000...), hcat(0:10000000...)
    y_train, y_test = actual.(x_train), actual.(x_test)

    # create a linear regression model
    model = Dense(1, 1) # 1 input, 1 output

    model.weight

    model.bias


    # create a loss function (mean squared error)
    loss(model, x, y) = mean(abs2.(model(x) .- y))

    # test the model
    loss(model, x_test, y_test)
end



# improving the prediction
    # function to create a linear regression model
    actual(x) = 4x + 5

    # create a test and training dataset of 1_000_000 observations
    x_train, x_test = hcat(0:5...), hcat(6:10...)
    y_train, y_test = actual.(x_train), actual.(x_test)

    opt = Descent(.1)

    data = [(x_train, y_train)]

    predict = Dense(1, 1)

    predict.weight
    predict.bias

    # create a loss function (mean squared error)  
    loss(model, x, y) = mean(abs2.(model(x) .- y))

    loss(predict, x_train, y_train)

    # train the model using optimizer 
    # for epoch in 1:2000_000
    #     train!(loss, predict, data, opt)
    # end

    function itertrain(epoch::Int64,loss,predict,data,opt)
        for epoch in 1:epoch
            train!(loss, predict, data, opt)
        end
    end

    itertrain(300,loss,predict,data,opt)

    loss(predict, x_train ,y_train)

    # train the model
    predict(x_test)
    y_test