import React, { useState, useEffect } from "react";
import axios from "axios";
import { makeStyles } from "@material-ui/core/styles";
import {
  Button, CardContent, Grid, Card, Typography, List, Drawer, 
  AppBar, CssBaseline, Toolbar, FormControlLabel, FormControl, 
  MenuItem, TextField, Checkbox, FormHelperText, Select, FormGroup } 
  from "@material-ui/core";
const drawerWidth = 240;

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
  },
  appBar: {
    zIndex: theme.zIndex.drawer + 1,
  },
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
  },
  drawerPaper: {
    width: drawerWidth,
  },
  drawerContainer: {
    overflow: "auto",
  },
  content: {
    flexGrow: 1,
    padding: theme.spacing(3),
  },
  root1: {
    // minWidth: 275,
    width: 500,
    height: 200,
    textAlign: "center",
    textShadow: "2px 2px white",
    // boxShadow: "2px 2px 2px 2px white"
  },
  bullet: {
    display: "inline-block",
    margin: "0 2px",
    transform: "scale(0.8)",
  },
  title: {
    fontSize: 14,
  },
  pos: {
    marginBottom: 12,
  },
}));

export default function Navbar() {
  const classes = useStyles();
  const [category, setCategory] = useState("");
  const [foodItems, setFoodItems] = useState("");
  const [currentId, setCurrentId] = useState(" ");
  const [state, setState] = useState({
    checkedA: false,
  });
  const [amount, setAmount] = useState("");
  const [searchName, setSearchName] = useState("");

  useEffect(() => {
    axios
      .get("http://localhost:8000/urban_backend/list_category_name/", {
        headers: {
          "Content-Type": "application/json",
        },
      })
      .then((res) => {
        axios
          .get("http://localhost:8000/urban_backend/filter_items_name/", {
            headers: {
              "Content-Type": "application/json",
            },
            params: {
              category_name: res.data[0].id,
            },
          })
          .then((resItems) => {
            // console.log(res.data)
            setFoodItems(resItems.data);
          });
        setCategory(res.data);
      });
  }, []);
  // console.log(category)
  const handleCategoryClick = (id, name) => {
    axios
      .get("http://localhost:8000/urban_backend/filter_items_name/", {
        headers: {
          "Content-Type": "application/json",
        },
        params: {
          category_name: id,
        },
      })
      .then((res) => {
        // console.log(res.data)
        setFoodItems(res.data);
        setCurrentId(id);
      });
    console.log(id);
  };
  console.log(foodItems);

  const handleVegChange = (event) => {
    console.log(event.target.name);
    // console.log(event.target)
    setState({ ...state, [event.target.name]: event.target.checked });
    let val = "";
    if (event.target.checked) {
      val = "Veg";
    } else {
      val = "";
    }
    console.log(val);
    axios
      .get("http://localhost:8000/urban_backend/filter_items_type/", {
        headers: {
          "Content-Type": "application/json",
        },
        params: {
          is_veg: val,
          category_name: currentId ? currentId : null,
        },
      })
      .then((res) => {
        setFoodItems(res.data);
        // setNonVeg(true)
      });
  };
  const handleSearchChange = (e) => {
    setSearchName(e.target.value);
  };

  // function debounce(fn, delay) {
  //   var timer = null;
  //   return function() {
  //     var context = this,
  //       args = arguments;
  //     clearTimeout(timer);
  //     timer = setTimeout(function() {
  //       fn.apply(context, args);
  //     }, delay);
  //   };
  // }
  const handleClickSearch = () => {
    console.log("hii");
    if (searchName.length > 0) {
      axios
        .get("http://localhost:8000/urban_backend/search_items_type/", {
          headers: {
            "Content-Type": "application/json",
          },
          params: {
            food_name: searchName,
            category_name: currentId,
          },
        })
        .then((res) => {
          setFoodItems(res.data);
          // setNonVeg(true)
        });
    } else {
      alert("Enter Food items");
    }
  };
  const handleChange = (event) => {
    setAmount(event.target.value);
    if (event.target.value === 1) {
      let data = foodItems.sort((a, b) => b.price - a.price);
      setFoodItems(data);
    }
    if (event.target.value === 0) {
      let data = foodItems.sort((a, b) => a.price - b.price);
      setFoodItems(data);
    }
  };
  return (
    <div className={classes.root}>
      <CssBaseline />
      <AppBar position="fixed" className={classes.appBar}>
        <Toolbar>
          <Typography variant="h6" noWrap>
            Category
          </Typography>
          <Typography variant="h6" style={{ marginLeft: "500px" }}>
            <FormGroup row>
              <FormControlLabel
                control={
                  <Checkbox
                    checked={state.checkedA}
                    name="checkedA"
                    onChange={handleVegChange}
                  />
                }
                label="Veg"
              />
            </FormGroup>
          </Typography>
        </Toolbar>
      </AppBar>
      <Drawer
        className={classes.drawer}
        variant="permanent"
        classes={{
          paper: classes.drawerPaper,
        }}
      >
        <Toolbar />
        <div className={classes.drawerContainer}>
          <List>
            {category
              ? category.map((items) => {
                  return (
                    <div>
                      <Button
                        selected
                        variant="contained"
                        style={{
                          width: "100%",
                          marginTop: "10px",
                          color: "blue",
                        }}
                        onClick={() =>
                          handleCategoryClick(items.id, items.category_name)
                        }
                        active
                      >
                        {items.category_name}
                      </Button>
                    </div>
                  );
                })
              : null}
          </List>
        </div>
      </Drawer>
      <main className={classes.content}>
        <Toolbar />
        <Grid container spacing={2}>
          <Grid item xs={3}></Grid>
          <Grid item xs={3}>
            <TextField
              id="filled-search"
              style={{ marginBottom: "30px" }}
              label="Search Items"
              type="search"
              onChange={handleSearchChange}
            />
          </Grid>
          <Grid item xs={2} style={{ marginTop: "10px" }}>
            <Button
              variant="contained"
              color="primary"
              onClick={handleClickSearch}
            >
              Search
            </Button>
          </Grid>
          <Grid item xs={4} style={{ marginTop: "10px" }}>
            <FormControl className={classes.formControl}>
              <Select
                style={{ width: "200px" }}
                value={amount}
                onChange={handleChange}
                displayEmpty
                className={classes.selectEmpty}
                inputProps={{ "aria-label": "Without label" }}
              >
                <MenuItem value="">
                  <em>None</em>
                </MenuItem>
                <MenuItem value={0}>Acse</MenuItem>
                <MenuItem value={1}>Desc</MenuItem>
              </Select>
              <FormHelperText>Sort By Price</FormHelperText>
            </FormControl>
          </Grid>
        </Grid>
        <Grid container spacing={2}>
          {foodItems && foodItems.length > 0 ? (
            foodItems.map((item) => {
              return (
                <Grid item xs={6}>
                  <Card className={classes.root1}>
                    <CardContent>
                      <Typography variant="h5" component="h2">
                        <span>
                          {item.food_name}{" "}
                          {item.is_veg ? (
                            <span style={{ color: "green" }}> &#9679;</span>
                          ) : (
                            <span style={{ color: "red" }}> &#9679;</span>
                          )}
                        </span>
                      </Typography>
                      <Typography variant="body2" component="p">
                        {item.discription}
                      </Typography>
                      <Typography
                        className={classes.pos}
                        style={{ fontWeight: "bold", marginTop: "10px" }}
                        color="textSecondary"
                      >
                        Price:&#8377;{item.price}
                      </Typography>
                      <Typography variant="body2" component="p">
                        Available:{" "}
                        {item.is_available ? (
                          <span style={{ color: "green" }}>Yes </span>
                        ) : (
                          "No"
                        )}
                      </Typography>
                    </CardContent>
                  </Card>
                </Grid>
              );
            })
          ) : <div style={{textAlign: "center", marginTop:"20px"}}> No Items Available</div>
          }
        </Grid>
      </main>
    </div>
  );
}
