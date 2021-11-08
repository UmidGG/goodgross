@extends('Layouts.account_panel')

@section('content')


    <div class="row mt-5">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="text-info">$2600</div>
                    <div class="text-secondary small">Total Sold</div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="text-info">$200</div>
                    <div class="text-secondary small">Total Expenses</div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="text-info">120</div>
                    <div class="text-secondary small">Total Orders</div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="text-info">551K</div>
                    <div class="text-secondary small">Total Visitors</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-12 col-sm-12 col-md-12 col-lg-8">

            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-9">
                                    <span class="text-secondary me-3">Income</span>
                                    <span class="text-primary">Expense</span>
                                </div>
                                <div class="col-3 text-end">
                                    <select class="form-select">
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                    </select>
                                </div>
                            </div>
                            <canvas id="sales_and_expenses_chart" style="width:100%;"></canvas>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row mt-4">
                <div class="col">
                    <div class="text-secondary">Top Sold Products</div>
                    <div class="card">
                        <div class="card-body">

                        </div>
                    </div>

                </div>
            </div>

        </div>
        <div class="col-12 col-sm-12 col-md-12 col-lg-4">
            <div>Reputation</div>
            <div class="card">
                <div class="card-body">
                    <div class="progress">
                        <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            21 Products
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            1.1K Followers
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-8">Recent Orders</div>
                <div class="col-4 text-end"><a href="#" class="text-decoration-none text-primary">See All</a></div>
            </div>
            <div class="card">
                <div class="card-body">

                </div>
            </div>

        </div>
    </div>



    <script type="text/javascript">
        let xValues = ["Jan", "Feb", "Mar", "Apr", "May", 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        let yValues = [5, 8, 12, 15, 20, 13, 18, 17, 10, 25, 26, 12];
        let barColors = ["red", "green", "blue", "orange", "brown", 'mint', 'yellow', 'maroon', 'navy', 'olive', 'purple', 'teal'];

        new Chart("sales_and_expenses_chart", {
            type: "bar",
            data: {
                labels: xValues,
                datasets: [{
                    backgroundColor: barColors,
                    data: yValues
                }]
            },
            options: {
                legend: {display: false},
                title: {
                    display: true,
                    text: "Sales and Expenses Overview"
                }
            }
        });

    </script>



@endsection
